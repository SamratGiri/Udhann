from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException, TimeoutException
import json
import time

# List of universities and URLs for admission requirements (undergrad/grad)
universities = {
    "Harvard University": "https://college.harvard.edu/admissions/apply",
    "MIT": "https://gradadmissions.mit.edu/about/requirements",
    "Stanford University": "https://admission.stanford.edu/apply/",
    "University of Toronto": "https://future.utoronto.ca/apply/requirements/",
    "University of British Columbia": "https://you.ubc.ca/applying-ubc/requirements/",
    "University of Melbourne": "https://study.unimelb.edu.au/how-to-apply/international-undergraduate",
    "University of Oxford": "https://www.ox.ac.uk/admissions/undergraduate/courses/admission-requirements",
    "University of Sydney": "https://www.sydney.edu.au/study/how-to-apply/admission-requirements.html",
    "National University of Singapore": "https://www.nus.edu.sg/oam/apply-to-nus/international-qualifications",
    "University of Edinburgh": "https://www.ed.ac.uk/studying/undergraduate/entry-requirements"
}

def setup_driver():
    options = Options()
    options.add_argument("--headless=new")  # Use headless mode (set False to see browser)
    options.add_argument("--disable-gpu")
    options.add_argument("--window-size=1920,1080")
    service = Service()  # Use default chromedriver from PATH or specify path here
    driver = webdriver.Chrome(service=service, options=options)
    return driver

def safe_find_elements(driver, xpath):
    try:
        return driver.find_elements(By.XPATH, xpath)
    except Exception:
        return []

def safe_find_element(driver_or_element, xpath):
    try:
        return driver_or_element.find_element(By.XPATH, xpath)
    except NoSuchElementException:
        return None

def extract_section_text(driver, keywords):
    """
    Extract text blocks under headings containing any keyword in keywords list.
    """
    results = []
    headings = safe_find_elements(driver, "//h1|//h2|//h3|//h4")
    n = len(headings)
    for i, h in enumerate(headings):
        heading_text = h.text.lower()
        if any(k.lower() in heading_text for k in keywords):
            collected_texts = []
            next_heading = headings[i+1] if i+1 < n else None

            # Get siblings after heading until next heading
            try:
                elem = safe_find_element(h, "following-sibling::*[1]")
            except Exception:
                elem = None

            while elem is not None and elem != next_heading:
                text = elem.text.strip()
                if text:
                    collected_texts.append(text)
                try:
                    elem = safe_find_element(elem, "following-sibling::*[1]")
                except Exception:
                    break
            if collected_texts:
                results.append("\n".join(collected_texts))
    return "\n\n".join(results) if results else "not mentioned"

def parse_requirements(text):
    """
    Simple parser to extract degree, gpa, completion date, test scores etc. from raw text.
    This can be customized per university.
    """
    # Placeholder example parser; real parser should use regex or NLP
    degree = "not mentioned"
    gpa = "not mentioned"
    completion_date = "not mentioned"

    lines = text.lower().split("\n")
    for line in lines:
        if "degree" in line:
            degree = line.strip()
        if "gpa" in line or "grade" in line:
            gpa = line.strip()
        if "completion" in line or "year" in line:
            completion_date = line.strip()

    return {
        "degree": degree,
        "institution_name": "not mentioned",
        "gpa_percentage": gpa,
        "date_of_completion": completion_date
    }

def parse_test_scores(text):
    """
    Extract test scores info from text.
    """
    # Placeholder - this is very site-specific, so we just return the text for now
    return {"test_type": "not mentioned", "score": "not mentioned", "test_date": "not mentioned"}

def parse_financial(text):
    """
    Extract financial requirements info.
    """
    # Placeholder
    return {"field": "Tuition or Financial", "budget": text if text != "not mentioned" else "not mentioned"}

def parse_scholarships(text):
    """
    Extract scholarships info.
    """
    # Placeholder, just dump the text for now
    return {
        "requirements": text,
        "application_deadline": "not mentioned",
        "eligibility_criteria": "not mentioned"
    }

def main():
    driver = setup_driver()
    all_data = []

    for uni, url in universities.items():
        print(f"Scraping {uni}...")
        try:
            driver.get(url)
            time.sleep(4)  # Wait for page to load (adjust as needed)

            education_text = extract_section_text(driver, ["education", "academic requirements", "admission requirements", "entry requirements", "qualification"])
            test_scores_text = extract_section_text(driver, ["test scores", "english language", "ielts", "toefl", "exam"])
            financial_text = extract_section_text(driver, ["financial", "tuition", "fees", "cost", "budget"])
            scholarships_text = extract_section_text(driver, ["scholarship", "funding", "financial aid"])

            uni_data = {
                "university": uni,
                "url": url,
                "education": parse_requirements(education_text),
                "test_scores": parse_test_scores(test_scores_text),
                "financial": parse_financial(financial_text),
                "scholarships": parse_scholarships(scholarships_text)
            }

            all_data.append(uni_data)
        except Exception as e:
            print(f"Error scraping {uni}: {e}")
            continue

    driver.quit()

    # Print JSON nicely
    print(json.dumps(all_data, indent=2))

if __name__ == "__main__":
    main()
