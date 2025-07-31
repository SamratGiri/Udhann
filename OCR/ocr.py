import requests
import re
import cv2
import os
from time import sleep
from pdf2image import convert_from_path

def preprocess_image(image_path):
    """Preprocess image to improve OCR accuracy."""
    try:
        img = cv2.imread(image_path, cv2.IMREAD_GRAYSCALE)
        if img is None:
            raise ValueError("Failed to load image")
        # Apply thresholding and noise reduction
        img = cv2.threshold(img, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)[1]
        img = cv2.GaussianBlur(img, (3, 3), 0)
        processed_path = 'processed_' + os.path.basename(image_path)
        cv2.imwrite(processed_path, img)
        return processed_path
    except Exception as e:
        print(f"Preprocessing failed for {image_path}: {e}")
        return image_path

def ocr_image(image_path, api_key, language="eng", retries=3):
    """Extract text from a single image using OCR.Space API."""
    processed_path = preprocess_image(image_path)
    
    for attempt in range(retries):
        try:
            with open(processed_path, 'rb') as image_file:
                response = requests.post(
                    'https://api.ocr.space/parse/image',
                    files={'file': image_file},
                    data={
                        'language': language,
                        'apikey': api_key,
                        'isOverlayRequired': 'false'
                    },
                    timeout=10
                )
                response.raise_for_status()
                result = response.json()
                
                if result.get("IsErroredOnProcessing"):
                    print(f"API Error for {image_path}: {result.get('ErrorMessage')}")
                    return None
                
                parsed_text = result["ParsedResults"][0]["ParsedText"]
                return parsed_text
        except (requests.exceptions.RequestException, ValueError) as e:
            print(f"Attempt {attempt + 1} failed for {image_path}: {e}")
            if attempt < retries - 1:
                sleep(2 ** attempt)  # Exponential backoff
            else:
                print(f"Max retries reached for {image_path}.")
                return None
        finally:
            if processed_path != image_path and os.path.exists(processed_path):
                os.remove(processed_path)  # Clean up processed image

def parse_document_text(text):
    """Parse OCR text to extract Education, Test Scores, and Financial fields."""
    if not text:
        return None
    
    data = {
        'education': {
            'degree': None,
            'institution_name': None,
            'gpa_percentage': None,
            'date_of_completion': None
        },
        'test_scores': {
            'test_type': None,
            'score': None,
            'test_date': None
        },
        'financial': {
            'field': None,
            'budget': None
        }
    }
    
    # Regex patterns for extraction
    patterns = {
        'degree': r'(?:Degree|Program|Qualification)[:\s]*(High School Diploma|Bachelor\'?s? [^\n]*|Master\'?s? [^\n]*)',
        'institution_name': r'(?:Institution|School|University|College)[:\s]*([^\n]+)',
        'gpa_percentage': r'(?:GPA|CGPA|Percentage)[:\s]*(\d\.\d{1,2}|\d{1,3}(?:\.\d)?%)',
        'date_of_completion': r'(?:Date of Completion|Graduation Date|Completed)[:\s]*(\d{4}-\d{2}-\d{2}|\d{2}/\d{2}/\d{4})',
        'test_type': r'(IELTS|PTE|TOEFL)[:\s]*',
        'score': r'(?:IELTS|Overall Band Score)[:\s]*(\d\.\d)|PTE[:\s]*(\d{1,3})|TOEFL[:\s]*(\d{1,3})',
        'test_date': r'(?:Test Date|Date of Test)[:\s]*(\d{4}-\d{2}-\d{2}|\d{2}/\d{2}/\d{4})',
        'field': r'(?:Field of Study|Program of Interest)[:\s]*([^\n]+)',
        'budget': r'(?:Budget|Financial Capacity|Balance)[:\s]*\$?([\d,]+\.?\d*)'
    }
    
    try:
        for key, pattern in patterns.items():
            match = re.search(pattern, text, re.IGNORECASE)
            if match:
                if key == 'degree':
                    data['education']['degree'] = match.group(1).strip()
                elif key == 'institution_name':
                    data['education']['institution_name'] = match.group(1).strip()
                elif key == 'gpa_percentage':
                    value = match.group(1)
                    data['education']['gpa_percentage'] = float(value[:-1]) if value.endswith('%') else float(value)
                elif key == 'date_of_completion':
                    data['education']['date_of_completion'] = match.group(1)
                elif key == 'test_type':
                    data['test_scores']['test_type'] = match.group(1)
                elif key == 'score':
                    score = next((g for g in match.groups() if g), None)
                    data['test_scores']['score'] = float(score) if score and '.' in score else int(score) if score else None
                elif key == 'test_date':
                    data['test_scores']['test_date'] = match.group(1)
                elif key == 'field':
                    data['financial']['field'] = match.group(1).strip()
                elif key == 'budget':
                    budget = match.group(1).replace(',', '')
                    data['financial']['budget'] = float(budget)
        
        if data['test_scores']['test_type'] and not data['test_scores']['score']:
            data['test_scores'] = {'test_type': None, 'score': None, 'test_date': None}
    except Exception as e:
        print(f"Parsing error: {e}")
        return {"raw_text": text, "error": "Failed to parse required fields"}
    
    return data

def extract_multiple_documents(file_paths, api_key, language="eng"):
    """Process multiple documents (images or PDFs) and merge extracted data."""
    if not file_paths:
        print("Error: No files provided.")
        return None
    
    merged_data = {
        'education': {
            'degree': None,
            'institution_name': None,
            'gpa_percentage': None,
            'date_of_completion': None
        },
        'test_scores': {
            'test_type': None,
            'score': None,
            'test_date': None
        },
        'financial': {
            'field': None,
            'budget': None
        }
    }
    
    for file_path in file_paths:
        if not os.path.exists(file_path):
            print(f"Error: File {file_path} does not exist.")
            continue
        
        valid_extensions = ('.png', '.jpg', '.jpeg', '.pdf')
        if not file_path.lower().endswith(valid_extensions):
            print(f"Error: File {file_path} has unsupported extension.")
            continue
        
        # Handle PDFs
        if file_path.lower().endswith('.pdf'):
            try:
                images = convert_from_path(file_path)
                text = ""
                for i, image in enumerate(images):
                    temp_path = f"temp_page_{i}_{os.path.basename(file_path)}.jpg"
                    image.save(temp_path, 'JPEG')
                    page_text = ocr_image(temp_path, api_key, language)
                    if page_text:
                        text += page_text + "\n"
                    os.remove(temp_path)
            except Exception as e:
                print(f"PDF processing failed for {file_path}: {e}")
                continue
        else:
            text = ocr_image(file_path, api_key, language)
        
        if not text:
            print(f"Error: OCR processing failed for {file_path}.")
            continue
        
        parsed_data = parse_document_text(text)
        if not parsed_data or "error" in parsed_data:
            print(f"Error: Failed to parse fields for {file_path}: {parsed_data.get('error', 'Unknown error')}")
            continue
        
        # Merge data, prioritizing non-None values
        for category in merged_data:
            for key in merged_data[category]:
                if parsed_data[category][key] is not None:
                    merged_data[category][key] = parsed_data[category][key]
    
    # Check if any data was extracted
    if all(v is None for cat in merged_data.values() for v in cat.values()):
        return {"error": "No valid data extracted from provided files"}
    
    return merged_data

# === Example usage ===
if __name__ == "__main__":
    file_paths = [
        "./ielts_sample.jpg",
        "./transcript_sample.pdf",
        "./bank_statement.jpg"
    ]  # Replace with your document paths
    api_key = os.getenv('OCR_SPACE_API_KEY', 'K81899431888957')
    
    result = extract_multiple_documents(file_paths, api_key)
    
    if result and "error" not in result:
        print("Extracted Data:")
        print(f"Education: Degree={result['education']['degree']}, "
              f"Institution={result['education']['institution_name']}, "
              f"GPA/Percentage={result['education']['gpa_percentage']}, "
              f"Date of Completion={result['education']['date_of_completion']}")
        print(f"Test Scores: Type={result['test_scores']['test_type']}, "
              f"Score={result['test_scores']['score']}, "
              f"Test Date={result['test_scores']['test_date']}")
        print(f"Financial: Field={result['financial']['field']}, "
              f"Budget={result['financial']['budget']}")
        
        with open("extracted_data.txt", "w", encoding="utf-8") as f:
            f.write(str(result))
        print("\n✅ Data saved to 'extracted_data.txt'")
    else:
        print("❌ Extraction failed:", result.get("error", "Unknown error"))