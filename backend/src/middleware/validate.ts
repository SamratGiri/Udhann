import { Request, Response, NextFunction } from 'express';
import { z, ZodError } from 'zod';


export const portfolioSchema = z.object({
  degree: z.string().optional(),
  institution: z.string().optional(),
  gpa: z.string().optional(),
  educationStartDate: z.string().datetime().optional(),
  educationEndDate: z.string().datetime().optional(),
  testType: z.string().optional(),
  testScore: z.string().optional(),
  testDate: z.string().datetime().optional(),
  annualBudget: z.number().optional(),
  financialField: z.string().optional(),
  interests: z.string().optional(),
  preferredCountries: z.string().optional(),
  preferredPrograms: z.string().optional(),
}).strict(); 

export const authSchema = z.object({
  email: z.string().email(),
  password: z.string().min(6, 'Password must be at least 6 characters long'),
}).strict();

export const validatePortfolio = (req: Request, res: Response, next: NextFunction) => {
  try {
    if (req.method === 'POST' || req.method === 'PUT') {
      portfolioSchema.parse(req.body);
    }
    next();
  } catch (error) {
    if (error instanceof ZodError) {
      return res.status(400).json({ errors: error.errors });
    }
    next(error);
  }
};

// Middleware to validate the request body for auth routes
export const validateAuth = (req: Request, res: Response, next: NextFunction) => {
  try {
    authSchema.parse(req.body);
    next();
  } catch (error) {
    if (error instanceof ZodError) {
      return res.status(400).json({ errors: error.errors });
    }
    next(error);
  }
};