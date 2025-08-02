# Frontend-Backend Connection Setup

## Overview
This document explains how the frontend Flutter app connects to the Node.js backend API.

## Backend Setup
1. Navigate to the backend directory:
   ```bash
   cd backend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the backend server:
   ```bash
   npm run dev
   ```
   The backend will run on `http://localhost:5001`

## Frontend Setup
1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the Flutter app:
   ```bash
   flutter run
   ```

## API Endpoints
The frontend connects to these backend endpoints:

### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration

### Portfolio
- `GET /api/portfolio` - Fetch user portfolio data
- `PUT /api/portfolio` - Save/update portfolio data

## Configuration
- **Backend Port**: 5001
- **Frontend API Base URLs**:
  - Web: `http://localhost:5001/api`
  - Android Emulator: `http://10.0.2.2:5001/api`
  - iOS Simulator: `http://localhost:5001/api`

## Authentication Flow
1. User logs in through `LoginScreen`
2. Backend returns JWT token and userId
3. Token is stored in SharedPreferences via `userManager`
4. All subsequent API calls include the token in Authorization header
5. User data persists across app restarts

## Key Files
- **Authentication**: `lib/services/auth_service.dart`
- **Portfolio API**: `lib/services/portfolio_service.dart`
- **Global State**: `lib/utils/global_state.dart`
- **User Management**: Uses `CurrentUser` class with SharedPreferences

## Error Handling
- Missing token redirects to login screen
- API errors shown via SnackBar
- Network errors are caught and displayed to user
