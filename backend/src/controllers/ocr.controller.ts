// backend/src/controllers/ocr.controller.ts
import { Request, Response } from 'express';
import multer from 'multer';
import { spawn } from 'child_process';
import path from 'path';
import fs from 'fs';

// Configure multer for file uploads
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    const uploadPath = path.join(__dirname, '../../uploads');
    if (!fs.existsSync(uploadPath)) {
      fs.mkdirSync(uploadPath, { recursive: true });
    }
    cb(null, uploadPath);
  },
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, file.fieldname + '-' + uniqueSuffix + path.extname(file.originalname));
  }
});

export const upload = multer({ 
  storage,
  fileFilter: (req, file, cb) => {
    console.log('File upload attempt:', {
      originalname: file.originalname,
      mimetype: file.mimetype,
      fieldname: file.fieldname
    });
    
    // Accept images, PDFs, and generic binary files from browsers
    const allowedTypes = [
      'image/jpeg', 'image/jpg', 'image/png', 'image/gif', 'image/webp',
      'application/pdf',
      'application/octet-stream' // Accept binary files from browsers
    ];
    
    // Also check file extension if MIME type is generic
    const fileExt = file.originalname.toLowerCase().split('.').pop();
    const allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp', 'pdf'];
    
    if (allowedTypes.includes(file.mimetype) || allowedExtensions.includes(fileExt || '')) {
      console.log('File accepted:', file.originalname);
      cb(null, true);
    } else {
      console.log('File rejected:', file.mimetype, 'Extension:', fileExt);
      const error = new Error(`File type not allowed: ${file.mimetype}`) as any;
      cb(error, false);
    }
  },
  limits: {
    fileSize: 10 * 1024 * 1024, // 10MB limit
  }
});

export const processOCR = async (req: Request, res: Response): Promise<void> => {
  console.log('OCR processOCR called');
  console.log('User:', req.user);
  console.log('File:', req.file);
  
  if (!req.user || !req.user.id) {
    console.log('User not authenticated');
    res.status(401).json({ message: 'User not authenticated.' });
    return;
  }

  if (!req.file) {
    console.log('No file uploaded in request');
    res.status(400).json({ message: 'No file uploaded.' });
    return;
  }

  console.log('File received:', req.file.filename, 'Size:', req.file.size);

  const filePath = req.file.path;
  const pythonScriptPath = path.join(__dirname, '../../../OCR/ocr.py');
  const pythonVenvPath = path.join(__dirname, '../../../OCR/venv/bin/python');

  try {
    // Check if Python script exists
    if (!fs.existsSync(pythonScriptPath)) {
      res.status(500).json({ message: 'OCR service not available.' });
      return;
    }

    // Use virtual environment Python if available, otherwise use system python3
    const pythonExecutable = fs.existsSync(pythonVenvPath) ? pythonVenvPath : 'python3';
    
    console.log('Executing Python OCR script:');
    console.log('Python executable:', pythonExecutable);
    console.log('Script path:', pythonScriptPath);
    console.log('File path:', filePath);
    console.log('File exists:', fs.existsSync(filePath));

    // Execute Python OCR script
    const python = spawn(pythonExecutable, [pythonScriptPath, filePath]);
    
    let ocrResult = '';
    let errorOutput = '';

    python.stdout.on('data', (data) => {
      console.log('Python stdout:', data.toString());
      ocrResult += data.toString();
    });

    python.stderr.on('data', (data) => {
      console.log('Python stderr:', data.toString());
      errorOutput += data.toString();
    });

    python.on('close', (code) => {
      console.log('Python script finished with code:', code);
      console.log('OCR Result length:', ocrResult.length);
      console.log('Error output length:', errorOutput.length);
      
      // Clean up uploaded file
      fs.unlink(filePath, (err) => {
        if (err) console.error('Error deleting file:', err);
        else console.log('Uploaded file deleted:', filePath);
      });

      if (code === 0) {
        // Parse the OCR result
        try {
          const parsedData = parseOCRData(ocrResult);
          res.json({ 
            success: true, 
            rawText: ocrResult.trim(),
            parsedData,
            message: 'OCR processing completed successfully.' 
          });
        } catch (parseError) {
          res.json({ 
            success: true, 
            rawText: ocrResult.trim(),
            parsedData: null,
            message: 'OCR completed but data parsing failed.' 
          });
        }
      } else {
        console.error('Python script error:', errorOutput);
        res.status(500).json({ 
          message: 'OCR processing failed.', 
          error: errorOutput 
        });
      }
    });

  } catch (error) {
    console.error('OCR processing error:', error);
    
    // Clean up uploaded file
    fs.unlink(filePath, (err) => {
      if (err) console.error('Error deleting file:', err);
    });

    res.status(500).json({ 
      message: 'Failed to process OCR.', 
      error: (error as Error).message 
    });
  }
};

// Helper function to parse OCR data into structured format
function parseOCRData(text: string): any {
  const lines = text.split('\n').map(line => line.trim()).filter(line => line.length > 0);
  
  // Try to extract common document types
  const result: any = {
    documentType: 'unknown',
    extractedFields: {}
  };

  // Check for transcript patterns
  if (text.toLowerCase().includes('transcript') || text.toLowerCase().includes('grade')) {
    result.documentType = 'transcript';
    result.extractedFields = parseTranscript(lines);
  }
  // Check for test score patterns
  else if (text.toLowerCase().includes('ielts') || text.toLowerCase().includes('toefl') || text.toLowerCase().includes('sat')) {
    result.documentType = 'testScore';
    result.extractedFields = parseTestScore(lines);
  }
  // Check for financial document patterns
  else if (text.toLowerCase().includes('bank') || text.toLowerCase().includes('statement') || text.toLowerCase().includes('balance')) {
    result.documentType = 'financial';
    result.extractedFields = parseFinancialDocument(lines);
  }

  return result;
}

function parseTranscript(lines: string[]): any {
  const fields: any = {};
  
  // Extract GPA
  const gpaMatch = lines.find(line => /gpa|grade point average/i.test(line));
  if (gpaMatch) {
    const gpaValue = gpaMatch.match(/(\d+\.?\d*)/);
    if (gpaValue) fields.gpa = gpaValue[1];
  }

  // Extract institution name (usually one of the first few lines)
  const institutionLine = lines.find(line => 
    /university|college|institute|school/i.test(line) && line.length > 10
  );
  if (institutionLine) fields.institution = institutionLine;

  // Extract degree information
  const degreeMatch = lines.find(line => 
    /bachelor|master|degree|diploma|b\.?s\.?|m\.?s\.?|b\.?a\.?|m\.?a\.?/i.test(line)
  );
  if (degreeMatch) fields.degree = degreeMatch;

  return fields;
}

function parseTestScore(lines: string[]): any {
  const fields: any = {};
  
  // Extract test type
  if (lines.some(line => /ielts/i.test(line))) {
    fields.testType = 'IELTS';
    // Look for overall band score
    const scoreMatch = lines.find(line => /overall|band/i.test(line));
    if (scoreMatch) {
      const score = scoreMatch.match(/(\d+\.?\d*)/);
      if (score) fields.score = score[1];
    }
  } else if (lines.some(line => /toefl/i.test(line))) {
    fields.testType = 'TOEFL';
    const scoreMatch = lines.find(line => /total|score/i.test(line));
    if (scoreMatch) {
      const score = scoreMatch.match(/(\d+)/);
      if (score) fields.score = score[1];
    }
  } else if (lines.some(line => /sat/i.test(line))) {
    fields.testType = 'SAT';
    const scoreMatch = lines.find(line => /total|composite/i.test(line));
    if (scoreMatch) {
      const score = scoreMatch.match(/(\d+)/);
      if (score) fields.score = score[1];
    }
  }

  return fields;
}

function parseFinancialDocument(lines: string[]): any {
  const fields: any = {};
  
  // Extract balance information
  const balanceMatch = lines.find(line => /balance|amount/i.test(line));
  if (balanceMatch) {
    const amount = balanceMatch.match(/[\$]?(\d{1,3}(?:,\d{3})*(?:\.\d{2})?)/);
    if (amount) fields.balance = amount[1].replace(/,/g, '');
  }

  return fields;
}
