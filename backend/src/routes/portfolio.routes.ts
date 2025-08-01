// backend/src/routes/portfolio.routes.ts
import express from 'express';
import { authMiddleware } from '../middleware/auth.middleware'; 
import { upsertPortfolio, getPortfolio } from '../controllers/portfolio.controller';


const router = express.Router();

router.use(authMiddleware);

router.get('/portfolio', getPortfolio);

router.put('/portfolio', upsertPortfolio); 

export default router;