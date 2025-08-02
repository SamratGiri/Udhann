import jwt from 'jsonwebtoken';

const secret = process.env.JWT_SECRET as string;

export const generateToken = (email: string, userId: number) => {
  return jwt.sign({ email, id: userId }, secret, { expiresIn: '7d' });
};
