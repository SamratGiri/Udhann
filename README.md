# CancelTency

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://github.com/cancel-tency/canceltency)
[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/cancel-tency/canceltency/releases)

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Problem Statement](#problem-statement)
- [Objectives](#objectives)
- [Technology Stack](#technology-stack)
- [System Architecture](#system-architecture)
- [Development Process](#development-process)
- [Key Algorithms](#key-algorithms)
- [Challenges & Mitigations](#challenges--mitigations)
- [Project Timeline](#project-timeline)
- [Team Roles](#team-roles)
- [Future Scope](#future-scope)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [References](#references)

## Overview
CancelTency is a student-centered mobile and web-based application designed to streamline the international university admission process for Nepalese students. By eliminating third-party consultancies, it reduces costs, enhances transparency, and promotes self-reliance. The platform enables students to access reliable information, communicate directly with universities, and manage applications independently.

## Features
- **University Search & Comparison**: Filter universities by country, program, tuition fees, rankings, and admission requirements.
- **Smart Suggestions**: Personalized university and scholarship recommendations based on grades, test scores (IELTS, PTE, GRE), and interests.
- **Information Resource Hub**: Centralized guides on admissions, scholarships, visa requirements, and language tests (IELTS, TOEFL).
- **Document Management**: Securely upload and manage documents (transcripts, test scores, passports, bank statements).
- **Direct Messaging**: Communicate directly with university admission officers.
- **Document Scanning**: Automated data extraction using Google Cloud Vision API.
- **Deadline Tracking**: Monitor application and scholarship deadlines.
- **Secure Authentication**: Powered by Firebase for safe user registration and login.

## Problem Statement
Nepalese students face a complex, costly, and error-prone process when applying to international universities, often relying on consultancies charging high fees (e.g., NPR 20,000) for unreliable advice. This leads to missed deadlines, financial burdens, and emotional stress. CancelTency provides a transparent, affordable, and user-friendly platform for direct applications.

## Objectives
- Centralize application documents (transcripts, test scores, bank statements, passport scans).
- Facilitate direct communication with universities.
- Eliminate hidden consultancy costs.
- Reduce time, costs, and stress for students.
- Enhance decision-making with intelligent technology.

## Technology Stack
- **Frontend**: [Flutter](https://flutter.dev/) (cross-platform UI toolkit for mobile and web).
- **Backend**: [Node.js](https://nodejs.org/) (API requests, authentication, university matching).
- **Data Collection**: Web scraping with [Puppeteer](https://pptr.dev/) or [Cheerio](https://cheerio.js.org/).
- **Document Processing**: [Google Cloud Vision API](https://cloud.google.com/vision) for OCR.
- **Real-time Data Management**: [Firebase](https://firebase.google.com/) (Authentication, Firestore, Cloud Storage, Cloud Functions).
- **Development Methodology**: Agile Scrum with two-week sprints.

## System Architecture
- **Client**: Flutter-based mobile and web app.
- **Server**: Node.js backend for API requests and business logic.
- **Database**: Firestore for real-time data storage.
- **Storage**: Firebase Cloud Storage for document uploads.
- **External Services**:
  - Google Cloud Vision API for document processing.
  - Web scraping scripts for university data collection.

## Development Process
- **Requirement Analysis (1 week)**: Conducted interviews and analyzed existing platforms.
- **Design (1 week)**: Created wireframes with [Figma](https://www.figma.com/) and designed Firestore schema.
- **Implementation (4 weeks)**: Built frontend (Flutter), backend (Node.js), and integrated Firebase and Google Cloud Vision API.
- **Testing (1 week)**: Unit, integration, and user acceptance testing with security validation.
- **Deployment (1 week)**: Deployed to App Store, Google Play Store, and hosted backend on [Heroku](https://www.heroku.com/).
- **Maintenance**: Ongoing updates based on user feedback.

## Key Algorithms
- **Document Scanning**: Google Cloud Vision API extracts text from documents (e.g., IELTS scores, certificates).
- **Probabilistic University Matching**: Weighted scoring algorithm (IELTS/PTE: 40%, GPA: 30%, prerequisites: 20%, financial readiness: 10%) for matching student profiles to university requirements.

## Challenges & Mitigations
- **Data Accuracy (Web Scraping)**: Robust error handling, periodic script validation, and caching.
- **Document Processing Accuracy**: Upload guidelines and manual verification for low-confidence OCR results.
- **Scalability**: Scalable Firebase services and optimized database queries.
- **User Adoption**: Marketing campaigns and free trials.

## Project Timeline
| Phase                          | Duration   |
|--------------------------------|------------|
| Requirement Analysis & Design  | 1 week     |
| Prototyping & Initial Dev      | 2 weeks    |
| Core Feature Implementation    | 3 weeks    |
| Testing & Quality Assurance    | 1 week     |
| Deployment & Pilot Launch      | 1 week     |
| Post-Launch Maintenance        | Ongoing    |

## Team Roles
| Team Member         | Role & Responsibility                                      |
|---------------------|-----------------------------------------------------------|
| Madhu Kunwar        | QA, Backend Developer (server setup, database, APIs)      |
| Pranav Bhandari     | Backend Developer, QA                                     |
| Madhusudan Bhandari | Frontend Developer (UI/UX, web/mobile interfaces), Planning |
| Samrat Giri         | Frontend Developer, Planning                              |

## Future Scope
- Expand to additional countries beyond the UK, Australia, and Canada.
- Integrate with visa application systems.
- Add AI-powered application assistants.


