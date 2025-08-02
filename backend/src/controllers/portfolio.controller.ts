
import { Request, Response } from 'express';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

interface PortfolioRequestBody {
  degree?: string;
  institution?: string;
  gpa?: string;
  educationStartDate?: string; 
  educationEndDate?: string;  
  testType?: string;
  testScore?: string;
  testDate?: string; 
  annualBudget?: number; 
  financialField?: string;
  interests?: string;
  preferredCountries?: string;
  preferredPrograms?: string;

}

export const upsertPortfolio = async (req: Request, res: Response): Promise<void> => {
  if (!req.user || !req.user.id) {
    res.status(401).json({ message: 'User not authenticated.' });
    return;
  }

  const userId = req.user.id;
  const {
    degree,
    institution,
    gpa,
    educationStartDate,
    educationEndDate,
    testType,
    testScore,
    testDate,
    annualBudget,
    financialField,
    interests,
    preferredCountries,
    preferredPrograms,
  }: PortfolioRequestBody = req.body;

  try {
    const portfolioData: any = { // Use 'any' temporarily, or define a more specific type
      degree,
      institution,
      gpa,
      // Convert date strings to Date objects if they exist
      educationStartDate: educationStartDate ? new Date(educationStartDate) : undefined,
      educationEndDate: educationEndDate ? new Date(educationEndDate) : undefined,
      testType,
      testScore,
      testDate: testDate ? new Date(testDate) : undefined,
      annualBudget: annualBudget,
      financialField,
      interests,
      preferredCountries,
      preferredPrograms,
    };

  
    const dataToUpdate = Object.fromEntries(
      Object.entries(portfolioData).filter(([, value]) => value !== undefined)
    );

    const portfolio = await prisma.portfolio.upsert({
      where: { userId: userId },
      update: dataToUpdate,
      create: {
        userId: userId,
        ...dataToUpdate,
      },
    });

    res.status(200).json({ message: 'Portfolio updated successfully', portfolio });
  } catch (error) {
    console.error('Error upserting portfolio:', error);
    res.status(500).json({ message: 'Failed to update portfolio', error: (error as Error).message });
  }
};

export const getPortfolio = async (req: Request, res: Response): Promise<void> => {
  if (!req.user || !req.user.id) {
    res.status(401).json({ message: 'User not authenticated.' });
    return;
  }

  const userId = req.user.id;

  try {
    const portfolio = await prisma.portfolio.findUnique({
      where: { userId: userId },
    });

    if (!portfolio) {
      res.status(404).json({ message: 'Portfolio not found for this user.' });
      return;
    }

    res.status(200).json({ portfolio });
  } catch (error) {
    console.error('Error fetching portfolio:', error);
    res.status(500).json({ message: 'Failed to fetch portfolio', error: (error as Error).message });
  }
};

export const uploadDocument = async (req: Request, res: Response): Promise<void> => {
  if (!req.user || !req.user.id) {
    res.status(401).json({ message: 'User not authenticated.' });
    return;
  }

  if (!req.file) {
    res.status(400).json({ message: 'No file uploaded' });
    return;
  }

  try {
    const { section } = req.body;
    const file = req.file;
    
    // Create a file URL (in production, this would be a proper URL)
    const fileUrl = `/uploads/${file.filename}`;
    
    // Optionally store file info in database
    // You could create a Documents table to track uploaded files
    
    res.status(200).json({ 
      message: 'File uploaded successfully',
      fileUrl: fileUrl,
      fileName: file.originalname,
      section: section
    });
  } catch (error) {
    console.error('Error uploading document:', error);
    res.status(500).json({ message: 'Failed to upload document', error: (error as Error).message });
  }
};