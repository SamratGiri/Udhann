// backend/src/routes/portfolio.routes.ts
import express from 'express';
import { authMiddleware } from '../middleware/auth.middleware'; 
import { upsertPortfolio, getPortfolio, uploadDocument } from '../controllers/portfolio.controller';
import multer from 'multer';
import path from 'path';
import fs from 'fs';

const router = express.Router();

// Ensure uploads directory exists
const uploadsDir = 'uploads';
if (!fs.existsSync(uploadsDir)) {
  fs.mkdirSync(uploadsDir, { recursive: true });
}

// Configure multer for file uploads
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, uploadsDir);
  },
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, file.fieldname + '-' + uniqueSuffix + path.extname(file.originalname));
  }
});

const upload = multer({ 
  storage: storage,
  fileFilter: (req, file, cb) => {
    console.log('Portfolio file upload attempt:', {
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
      console.log('Portfolio file accepted:', file.originalname);
      cb(null, true);
    } else {
      console.log('Portfolio file rejected:', file.mimetype, 'Extension:', fileExt);
      const error = new Error(`File type not allowed: ${file.mimetype}`) as any;
      cb(error, false);
    }
  },
  limits: {
    fileSize: 10 * 1024 * 1024 // 10MB limit
  }
});

router.use(authMiddleware);

router.get('/portfolio', getPortfolio);
router.put('/portfolio', upsertPortfolio);
router.post('/portfolio/upload', upload.single('document'), uploadDocument);

export default router;