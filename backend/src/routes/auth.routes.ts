import express from 'express';
import { register, login } from '../controllers/auth.controller';
import { validateAuth } from '../middleware/validate';

const router = express.Router();

router.post('/register', validateAuth, register);
router.post('/login', validateAuth, login);

export default router;
