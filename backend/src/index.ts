import express from 'express';
import dotenv from 'dotenv';
import cors from 'cors';
import authRoutes from './routes/auth.routes';
import portfolioRoutes from './routes/portfolio.routes';
import ocrRoutes from './routes/ocr.routes';

dotenv.config();
const app = express();
const PORT = process.env.PORT || 5001;

app.use(cors({
  origin: '*',
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization'],
  credentials: true
}));

app.use(express.json());

// Add logging middleware
app.use((req, res, next) => {
  console.log(`${new Date().toISOString()} - ${req.method} ${req.path}`);
  next();
});

app.use('/api/auth', authRoutes);
app.use('/api/', portfolioRoutes);
app.use('/api/ocr', ocrRoutes);

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});