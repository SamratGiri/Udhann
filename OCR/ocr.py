import requests
import re
import cv2
import os
import numpy as np
import logging
from time import sleep
from concurrent.futures import ThreadPoolExecutor, as_completed

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler("ocr_processing.log"),
        logging.StreamHandler()
    ]
)

def preprocess_image(image_path):
    """Enhanced image preprocessing for better OCR accuracy"""
    try:
        img = cv2.imread(image_path, cv2.IMREAD_GRAYSCALE)
        if img is None:
            raise ValueError(f"Failed to load image: {image_path}")
        
        # Resize if too large
        if max(img.shape) > 2000:
            scale = 2000 / max(img.shape)
            img = cv2.resize(img, None, fx=scale, fy=scale, interpolation=cv2.INTER_AREA)
        
        # Adaptive thresholding for better contrast
        img = cv2.adaptiveThreshold(
            img, 255, 
            cv2.ADAPTIVE_THRESH_GAUSSIAN_C, 
            cv2.THRESH_BINARY, 11, 2
        )
        
        # Noise reduction
        img = cv2.fastNlMeansDenoising(img, None, 10, 7, 21)
        
        # Sharpening
        kernel = np.array([[0, -1, 0], [-1, 5, -1], [0, -1, 0]])
        img = cv2.filter2D(img, -1, kernel)
        
        processed_path = 'processed_' + os.path.basename(image_path)
        cv2.imwrite(processed_path, img)
        logging.info(f"Preprocessed image saved to: {processed_path}")
        return processed_path
    except Exception as e:
        logging.error(f"Preprocessing failed for {image_path}: {e}")
        return image_path

def ocr_image(image_path, api_key, language="eng", retries=3):
    """Enhanced OCR processing with better error handling"""
    processed_path = preprocess_image(image_path)
    
    for attempt in range(retries):
        try:
            with open(processed_path, 'rb') as image_file:
                logging.info(f"Sending {image_path} to OCR.Space (Attempt {attempt + 1})")
                response = requests.post(
                    'https://api.ocr.space/parse/image',
                    files={'file': image_file},
                    data={
                        'language': language,
                        'apikey': api_key,
                        'isOverlayRequired': 'false',
                        'detectOrientation': 'true',
                        'scale': 'true',
                        'OCREngine': '2'  # Use newer engine
                    },
                    timeout=30
                )
                response.raise_for_status()
                result = response.json()
                
                if result.get("IsErroredOnProcessing"):
                    error_msg = result.get('ErrorMessage', 'Unknown API error')
                    logging.error(f"API Error for {image_path}: {error_msg}")
                    return None
                
                parsed_text = result["ParsedResults"][0]["ParsedText"]
                logging.info(f"Raw OCR Text for {image_path}:\n{parsed_text[:200]}...")  # Log first 200 chars
                return parsed_text
        except (requests.exceptions.RequestException, ValueError) as e:
            logging.error(f"Attempt {attempt + 1} failed for {image_path}: {e}")
            if attempt < retries - 1:
                sleep(2 ** attempt)
            else:
                logging.error(f"Max retries reached for {image_path}.")
                return None
        finally:
            if processed_path != image_path and os.path.exists(processed_path):
                os.remove(processed_path)

def parse_education(text):
    """Enhanced education field extraction"""
    patterns = {
        'degree': r'(?:Degree|Program|Qualification|GRADE|Level|Certificate|EDUCAT|ATTON)[\s:-]*(.+?)(?:\n|$)',
        'institution': r'(?:Institution|School|University|College|Board|NE\'? BHAKTAPUR|TANGKAS)[\s:-]*(.+?)(?:\n|$)',
        'gpa': r'(?:GPA|CGPA|Percentage|Marks|Score|Grade)[\s:-]*([A-Za-z0-9+\.%]+)',
        'completion_date': r'(?:Date of Completion|Graduation Date|Completed|Passing Date|Year)[\s:-]*(\d{4}|\d{2}/\d{4}|\d{2} \w+ \d{4})'
    }
    
    data = {}
    for field, pattern in patterns.items():
        match = re.search(pattern, text, re.IGNORECASE)
        if match:
            value = match.group(1).strip()
            logging.info(f"Matched education.{field}: {value}")
            data[field] = value
    
    # Special handling for grade sheets
    if not data.get('degree'):
        grade_match = re.search(r'GRADE\s*-\s*SHEET', text, re.IGNORECASE)
        if grade_match:
            data['degree'] = 'Secondary Education'
    
    return data

def parse_test_scores(text):
    """Enhanced test score extraction"""
    patterns = {
        'testType': r'(?:Test Type|Exam|Test Name)[\s:-]*(IELTS|PTE|TOEFL|GRE|SAT|ACT)',
        'testScore': r'(?:Overall Band Score|Total Score|Marks|Score|Band)[\s:-]*(\d+\.\d|\d+)',
        'testDate': r'(?:Test Date|Exam Date|Date of Test)[\s:-]*(\d{2}/\d{2}/\d{4}|\d{2} \w+ \d{4})'
    }
    
    data = {}
    for field, pattern in patterns.items():
        match = re.search(pattern, text, re.IGNORECASE)
        if match:
            value = match.group(1).strip()
            logging.info(f"Matched test_scores.{field}: {value}")
            data[field] = value
    
    return data

def parse_financial(text):
    """Enhanced financial field extraction"""
    patterns = {
        'annualBudget': r'(?:Closing Balance|Available Balance|Amount|Balance|Funds)[\s:-]*(?:NPR|AUD|USD)?\s*([\d,]+\.?\d*)',
        'currency': r'(?:Currency|Account Currency)[\s:-]*(\w{3})',
        'statementDate': r'(?:Statement Date|As of|Date)[\s:-]*(\d{2}/\d{2}/\d{4}|\d{2} \w+ \d{4})'
    }
    
    data = {}
    for field, pattern in patterns.items():
        match = re.search(pattern, text, re.IGNORECASE)
        if match:
            value = match.group(1).strip()
            logging.info(f"Matched financial.{field}: {value}")
            
            # Convert amounts to float
            if field == 'annualBudget' and re.match(r'^[\d,]+\.?\d*$', value):
                data[field] = float(value.replace(',', ''))
            else:
                data[field] = value
    
    return data

def parse_portfolio_fields(text):
    """Parse OCR text into portfolio fields matching Prisma schema"""
    portfolio = {}
    
    # Education fields
    education = parse_education(text)
    if education:
        portfolio.update({
            'degree': education.get('degree'),
            'institution': education.get('institution'),
            'gpa': education.get('gpa'),
        })
    
    # Test score fields
    test_scores = parse_test_scores(text)
    if test_scores:
        portfolio.update({
            'testType': test_scores.get('testType'),
            'testScore': test_scores.get('testScore'),
            'testDate': test_scores.get('testDate'),
        })
    
    # Financial fields
    financial = parse_financial(text)
    if financial and 'annualBudget' in financial:
        portfolio['annualBudget'] = financial['annualBudget']
    
    return portfolio

def process_single_file(file_path, api_key, language="eng"):
    """Process a single image file"""
    if not os.path.exists(file_path):
        logging.error(f"File not found: {file_path}")
        return None
    
    text = ocr_image(file_path, api_key, language)
    if not text:
        logging.error(f"OCR processing failed for {file_path}")
        return None
    
    return parse_portfolio_fields(text)

def extract_portfolio_data(file_paths, api_key, language="eng"):
    """Process multiple images and merge into portfolio data"""
    if not file_paths:
        logging.error("No files provided")
        return {"error": "No files provided"}
    
    # Process files in parallel
    with ThreadPoolExecutor() as executor:
        futures = {executor.submit(process_single_file, fp, api_key, language): fp for fp in file_paths}
        
        portfolio_data = {}
        for future in as_completed(futures):
            file_path = futures[future]
            try:
                result = future.result()
                if result:
                    # Merge results with priority to existing data
                    for key, value in result.items():
                        if value and (key not in portfolio_data or not portfolio_data[key]):
                            portfolio_data[key] = value
            except Exception as e:
                logging.error(f"Processing failed for {file_path}: {e}")
    
    return portfolio_data

# Example Usage
if __name__ == "__main__":
    import sys
    
    # Check if a file path was provided as command line argument
    if len(sys.argv) < 2:
        logging.error("No file path provided. Usage: python ocr.py <file_path>")
        print("❌ Error: No file path provided")
        sys.exit(1)
    
    # Get the uploaded file path from command line argument
    uploaded_file_path = sys.argv[1]
    
    # Check if file exists
    if not os.path.exists(uploaded_file_path):
        logging.error(f"File not found: {uploaded_file_path}")
        print(f"❌ Error: File not found: {uploaded_file_path}")
        sys.exit(1)
    
    # Process the single uploaded file
    file_paths = [uploaded_file_path]
    
    # Get API key from environment variable
    api_key = os.getenv('OCR_SPACE_API_KEY', 'K81899431888957')
    
    # Process documents
    result = extract_portfolio_data(file_paths, api_key)
    
    # Output results
    if 'error' in result:
        logging.error(f"❌ Extraction failed: {result['error']}")
        print(f"❌ Extraction failed: {result['error']}")
    else:
        print("\n✅ Successfully extracted portfolio data:")
        for field, value in result.items():
            print(f"{field}: {value}")
        
        # Save detailed results
        with open("portfolio_data.json", "w", encoding="utf-8") as f:
            import json
            json.dump(result, f, indent=2)
        print("\n📊 Full results saved to 'portfolio_data.json'")