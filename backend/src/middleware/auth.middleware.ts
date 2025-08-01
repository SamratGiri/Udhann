import { Request, Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';

declare global {
  namespace Express {
    interface Request {
      user?: {
        id: number;
        email: string;
      };
    }
  }
}
export const authMiddleware = (req: Request, res: Response, next: NextFunction): void => {
  const authHeader = req.headers.authorization;

  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    res.status(401).json({ message: 'Authentication token required.' });
    return;
  }

  const token = authHeader.split(' ')[1];

  try {
    const payload = jwt.verify(token, process.env.JWT_SECRET as string) as { id: number; email: string };

    if (!payload.id) {
       res.status(401).json({ message: 'Invalid token payload.' });
       return;
    }
    
    req.user = { id: payload.id, email: payload.email };
    next();
  } catch (error) {
    res.status(403).json({ message: 'Invalid or expired token.' });
  }
};