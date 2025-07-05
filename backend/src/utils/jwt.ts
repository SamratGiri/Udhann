import jwt from 'jsonwebtoken';

const secret = process.env.JWT_SECRET as string;

export const generateToken = (email: string) => {
  return jwt.sign({ email }, secret, { expiresIn: '7d' });
};
