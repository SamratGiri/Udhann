import { z } from 'zod';

export const portfolioUpdateSchema = z.object({
  degree: z.string().min(2, "Degree must be at least 2 characters").optional(),
  institution: z.string().min(3, "Institution must be at least 3 characters").optional(),
  gpa: z.string().optional(),
  educationStartDate: z.string().datetime({ message: "Invalid start date format" }).optional(),
  educationEndDate: z.string().datetime({ message: "Invalid end date format" }).optional(),
  testType: z.string().optional(),
  testScore: z.string().optional(),
  testDate: z.string().datetime({ message: "Invalid test date format" }).optional(),
annualBudget: z.number().positive("Budget must be a positive number").optional(),
  financialField: z.string().optional(),
  interests: z.string().optional(),
  preferredCountries: z.string().optional(),
  preferredPrograms: z.string().optional(),
}).strict();

export type PortfolioUpdateDto = z.infer<typeof portfolioUpdateSchema>;
