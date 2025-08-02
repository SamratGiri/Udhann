// backend/src/routes/ocr.routes.ts
import express from 'express';
import { authMiddleware } from '../middleware/auth.middleware';
import { processOCR, upload } from '../controllers/ocr.controller';

const router = express.Router();

// Apply authentication middleware
router.use(authMiddleware);

// Test endpoint
router.get('/test', (req, res) => {
  console.log('OCR test endpoint hit');
  res.json({ message: 'OCR service is working', user: req.user });
});

// OCR processing endpoint
router.post('/process', upload.single('document'), processOCR);

export default router;
