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



```
Udhann
├─ 📁OCR
│  ├─ 📁.venv
│  ├─ 📄.DS_Store
│  ├─ 📄Major_Project_Report .pdf
│  ├─ 📄Marksheet.jpg
│  ├─ 📄bankstatement.png
│  ├─ 📄ielts_sample.png
│  ├─ 📄ocr.py
│  ├─ 📄portfolio_data.json
│  ├─ 📄requirements.txt
│  └─ 📄webscrape.py
├─ 📁backend
│  ├─ 📁node_modules
│  │  ├─ 📁.bin
│  │  │  ├─ 📄acorn
│  │  │  ├─ 📄jiti
│  │  │  ├─ 📄mkdirp
│  │  │  ├─ 📄node-gyp-build
│  │  │  ├─ 📄node-gyp-build-optional
│  │  │  ├─ 📄node-gyp-build-test
│  │  │  ├─ 📄prisma
│  │  │  ├─ 📄resolve
│  │  │  ├─ 📄rimraf
│  │  │  ├─ 📄semver
│  │  │  ├─ 📄tree-kill
│  │  │  ├─ 📄ts-node
│  │  │  ├─ 📄ts-node-cwd
│  │  │  ├─ 📄ts-node-dev
│  │  │  ├─ 📄ts-node-esm
│  │  │  ├─ 📄ts-node-script
│  │  │  ├─ 📄ts-node-transpile-only
│  │  │  ├─ 📄ts-script
│  │  │  ├─ 📄tsc
│  │  │  ├─ 📄tsnd
│  │  │  └─ 📄tsserver
│  │  ├─ 📁.prisma
│  │  │  └─ 📁client
│  │  │     ├─ 📄client.d.ts
│  │  │     ├─ 📄client.js
│  │  │     ├─ 📄default.d.ts
│  │  │     ├─ 📄default.js
│  │  │     ├─ 📄edge.d.ts
│  │  │     ├─ 📄edge.js
│  │  │     ├─ 📄index-browser.js
│  │  │     ├─ 📄index.d.ts
│  │  │     ├─ 📄index.js
│  │  │     ├─ 📄libquery_engine-darwin-arm64.dylib.node
│  │  │     ├─ 📄package.json
│  │  │     ├─ 📄schema.prisma
│  │  │     ├─ 📄wasm.d.ts
│  │  │     └─ 📄wasm.js
│  │  ├─ 📁@cspotcode
│  │  │  └─ 📁source-map-support
│  │  │     ├─ 📄LICENSE.md
│  │  │     ├─ 📄README.md
│  │  │     ├─ 📄browser-source-map-support.js
│  │  │     ├─ 📄package.json
│  │  │     ├─ 📄register-hook-require.d.ts
│  │  │     ├─ 📄register-hook-require.js
│  │  │     ├─ 📄register.d.ts
│  │  │     ├─ 📄register.js
│  │  │     ├─ 📄source-map-support.d.ts
│  │  │     └─ 📄source-map-support.js
│  │  ├─ 📁@jridgewell
│  │  │  ├─ 📁resolve-uri
│  │  │  │  ├─ 📁dist
│  │  │  │  │  ├─ 📁types
│  │  │  │  │  │  └─ 📄resolve-uri.d.ts
│  │  │  │  │  ├─ 📄resolve-uri.mjs
│  │  │  │  │  ├─ 📄resolve-uri.mjs.map
│  │  │  │  │  ├─ 📄resolve-uri.umd.js
│  │  │  │  │  └─ 📄resolve-uri.umd.js.map
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  └─ 📄package.json
│  │  │  ├─ 📁sourcemap-codec
│  │  │  │  ├─ 📁dist
│  │  │  │  │  ├─ 📁types
│  │  │  │  │  │  ├─ 📄scopes.d.ts
│  │  │  │  │  │  ├─ 📄sourcemap-codec.d.ts
│  │  │  │  │  │  ├─ 📄strings.d.ts
│  │  │  │  │  │  └─ 📄vlq.d.ts
│  │  │  │  │  ├─ 📄sourcemap-codec.mjs
│  │  │  │  │  ├─ 📄sourcemap-codec.mjs.map
│  │  │  │  │  ├─ 📄sourcemap-codec.umd.js
│  │  │  │  │  └─ 📄sourcemap-codec.umd.js.map
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  └─ 📄package.json
│  │  │  └─ 📁trace-mapping
│  │  │     ├─ 📁dist
│  │  │     │  ├─ 📁types
│  │  │     │  │  ├─ 📄any-map.d.ts
│  │  │     │  │  ├─ 📄binary-search.d.ts
│  │  │     │  │  ├─ 📄by-source.d.ts
│  │  │     │  │  ├─ 📄resolve.d.ts
│  │  │     │  │  ├─ 📄sort.d.ts
│  │  │     │  │  ├─ 📄sourcemap-segment.d.ts
│  │  │     │  │  ├─ 📄strip-filename.d.ts
│  │  │     │  │  ├─ 📄trace-mapping.d.ts
│  │  │     │  │  └─ 📄types.d.ts
│  │  │     │  ├─ 📄trace-mapping.mjs
│  │  │     │  ├─ 📄trace-mapping.mjs.map
│  │  │     │  ├─ 📄trace-mapping.umd.js
│  │  │     │  └─ 📄trace-mapping.umd.js.map
│  │  │     ├─ 📄LICENSE
│  │  │     ├─ 📄README.md
│  │  │     └─ 📄package.json
│  │  ├─ 📁@prisma
│  │  │  ├─ 📁client
│  │  │  │  ├─ 📁generator-build
│  │  │  │  │  └─ 📄index.js
│  │  │  │  ├─ 📁runtime
│  │  │  │  │  ├─ 📄binary.d.ts
│  │  │  │  │  ├─ 📄binary.js
│  │  │  │  │  ├─ 📄binary.mjs
│  │  │  │  │  ├─ 📄client.d.mts
│  │  │  │  │  ├─ 📄client.d.ts
│  │  │  │  │  ├─ 📄client.js
│  │  │  │  │  ├─ 📄client.mjs
│  │  │  │  │  ├─ 📄edge-esm.js
│  │  │  │  │  ├─ 📄edge.d.ts
│  │  │  │  │  ├─ 📄edge.js
│  │  │  │  │  ├─ 📄index-browser.d.ts
│  │  │  │  │  ├─ 📄index-browser.js
│  │  │  │  │  ├─ 📄library.d.mts
│  │  │  │  │  ├─ 📄library.d.ts
│  │  │  │  │  ├─ 📄library.js
│  │  │  │  │  ├─ 📄library.mjs
│  │  │  │  │  ├─ 📄query_compiler_bg.cockroachdb.js
│  │  │  │  │  ├─ 📄query_compiler_bg.cockroachdb.mjs
│  │  │  │  │  ├─ 📄query_compiler_bg.cockroachdb.wasm
│  │  │  │  │  ├─ 📄query_compiler_bg.mysql.js
│  │  │  │  │  ├─ 📄query_compiler_bg.mysql.mjs
│  │  │  │  │  ├─ 📄query_compiler_bg.mysql.wasm
│  │  │  │  │  ├─ 📄query_compiler_bg.postgresql.js
│  │  │  │  │  ├─ 📄query_compiler_bg.postgresql.mjs
│  │  │  │  │  ├─ 📄query_compiler_bg.postgresql.wasm
│  │  │  │  │  ├─ 📄query_compiler_bg.sqlite.js
│  │  │  │  │  ├─ 📄query_compiler_bg.sqlite.mjs
│  │  │  │  │  ├─ 📄query_compiler_bg.sqlite.wasm
│  │  │  │  │  ├─ 📄query_compiler_bg.sqlserver.js
│  │  │  │  │  ├─ 📄query_compiler_bg.sqlserver.mjs
│  │  │  │  │  ├─ 📄query_compiler_bg.sqlserver.wasm
│  │  │  │  │  ├─ 📄query_engine_bg.cockroachdb.js
│  │  │  │  │  ├─ 📄query_engine_bg.cockroachdb.mjs
│  │  │  │  │  ├─ 📄query_engine_bg.cockroachdb.wasm
│  │  │  │  │  ├─ 📄query_engine_bg.mysql.js
│  │  │  │  │  ├─ 📄query_engine_bg.mysql.mjs
│  │  │  │  │  ├─ 📄query_engine_bg.mysql.wasm
│  │  │  │  │  ├─ 📄query_engine_bg.postgresql.js
│  │  │  │  │  ├─ 📄query_engine_bg.postgresql.mjs
│  │  │  │  │  ├─ 📄query_engine_bg.postgresql.wasm
│  │  │  │  │  ├─ 📄query_engine_bg.sqlite.js
│  │  │  │  │  ├─ 📄query_engine_bg.sqlite.mjs
│  │  │  │  │  ├─ 📄query_engine_bg.sqlite.wasm
│  │  │  │  │  ├─ 📄query_engine_bg.sqlserver.js
│  │  │  │  │  ├─ 📄query_engine_bg.sqlserver.mjs
│  │  │  │  │  ├─ 📄query_engine_bg.sqlserver.wasm
│  │  │  │  │  ├─ 📄react-native.d.ts
│  │  │  │  │  ├─ 📄react-native.js
│  │  │  │  │  ├─ 📄wasm-compiler-edge.d.ts
│  │  │  │  │  ├─ 📄wasm-compiler-edge.js
│  │  │  │  │  ├─ 📄wasm-compiler-edge.mjs
│  │  │  │  │  ├─ 📄wasm-engine-edge.d.ts
│  │  │  │  │  ├─ 📄wasm-engine-edge.js
│  │  │  │  │  └─ 📄wasm-engine-edge.mjs
│  │  │  │  ├─ 📁scripts
│  │  │  │  │  ├─ 📄colors.js
│  │  │  │  │  ├─ 📄default-index.d.ts
│  │  │  │  │  ├─ 📄default-index.js
│  │  │  │  │  ├─ 📄postinstall.d.ts
│  │  │  │  │  └─ 📄postinstall.js
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄default.d.ts
│  │  │  │  ├─ 📄default.js
│  │  │  │  ├─ 📄edge.d.ts
│  │  │  │  ├─ 📄edge.js
│  │  │  │  ├─ 📄extension.d.ts
│  │  │  │  ├─ 📄extension.js
│  │  │  │  ├─ 📄index-browser.js
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  ├─ 📄index.js
│  │  │  │  ├─ 📄package.json
│  │  │  │  ├─ 📄react-native.d.ts
│  │  │  │  ├─ 📄react-native.js
│  │  │  │  ├─ 📄sql.d.ts
│  │  │  │  ├─ 📄sql.js
│  │  │  │  ├─ 📄sql.mjs
│  │  │  │  ├─ 📄wasm.d.ts
│  │  │  │  └─ 📄wasm.js
│  │  │  ├─ 📁config
│  │  │  │  ├─ 📁dist
│  │  │  │  │  ├─ 📄index.d.ts
│  │  │  │  │  └─ 📄index.js
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  └─ 📄package.json
│  │  │  ├─ 📁debug
│  │  │  │  ├─ 📁dist
│  │  │  │  │  ├─ 📄index.d.mts
│  │  │  │  │  ├─ 📄index.d.ts
│  │  │  │  │  ├─ 📄index.js
│  │  │  │  │  ├─ 📄index.mjs
│  │  │  │  │  └─ 📄util.d.ts
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  └─ 📄package.json
│  │  │  ├─ 📁engines
│  │  │  │  ├─ 📁dist
│  │  │  │  │  ├─ 📁scripts
│  │  │  │  │  │  ├─ 📄localinstall.d.ts
│  │  │  │  │  │  ├─ 📄localinstall.js
│  │  │  │  │  │  ├─ 📄postinstall.d.ts
│  │  │  │  │  │  └─ 📄postinstall.js
│  │  │  │  │  ├─ 📄index.d.ts
│  │  │  │  │  └─ 📄index.js
│  │  │  │  ├─ 📁scripts
│  │  │  │  │  └─ 📄postinstall.js
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄libquery_engine-darwin-arm64.dylib.node
│  │  │  │  ├─ 📄package.json
│  │  │  │  └─ 📄schema-engine-darwin-arm64
│  │  │  ├─ 📁engines-version
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  ├─ 📄index.js
│  │  │  │  └─ 📄package.json
│  │  │  ├─ 📁fetch-engine
│  │  │  │  ├─ 📁dist
│  │  │  │  │  ├─ 📄BinaryType.d.ts
│  │  │  │  │  ├─ 📄BinaryType.js
│  │  │  │  │  ├─ 📄chmodPlusX.d.ts
│  │  │  │  │  ├─ 📄chmodPlusX.js
│  │  │  │  │  ├─ 📄chunk-4GLRZ2GS.js
│  │  │  │  │  ├─ 📄chunk-CWGQAQ3T.js
│  │  │  │  │  ├─ 📄chunk-IFAMTZQZ.js
│  │  │  │  │  ├─ 📄chunk-MWVY55RY.js
│  │  │  │  │  ├─ 📄chunk-MX3HXAU2.js
│  │  │  │  │  ├─ 📄chunk-NA32AGOU.js
│  │  │  │  │  ├─ 📄chunk-O32LZZSL.js
│  │  │  │  │  ├─ 📄chunk-PXQVM7NP.js
│  │  │  │  │  ├─ 📄chunk-QGM4M3NI.js
│  │  │  │  │  ├─ 📄chunk-RXM4EBGR.js
│  │  │  │  │  ├─ 📄chunk-SVP4SRAT.js
│  │  │  │  │  ├─ 📄chunk-VAPNG6TS.js
│  │  │  │  │  ├─ 📄chunk-X37PZICB.js
│  │  │  │  │  ├─ 📄chunk-YJOPKU47.js
│  │  │  │  │  ├─ 📄cleanupCache.d.ts
│  │  │  │  │  ├─ 📄cleanupCache.js
│  │  │  │  │  ├─ 📄download.d.ts
│  │  │  │  │  ├─ 📄download.js
│  │  │  │  │  ├─ 📄downloadZip.d.ts
│  │  │  │  │  ├─ 📄downloadZip.js
│  │  │  │  │  ├─ 📄env.d.ts
│  │  │  │  │  ├─ 📄env.js
│  │  │  │  │  ├─ 📄getHash.d.ts
│  │  │  │  │  ├─ 📄getHash.js
│  │  │  │  │  ├─ 📄getProxyAgent.d.ts
│  │  │  │  │  ├─ 📄getProxyAgent.js
│  │  │  │  │  ├─ 📄index.d.ts
│  │  │  │  │  ├─ 📄index.js
│  │  │  │  │  ├─ 📄log.d.ts
│  │  │  │  │  ├─ 📄log.js
│  │  │  │  │  ├─ 📄multipart-parser-ASKQAOL4.js
│  │  │  │  │  ├─ 📄utils.d.ts
│  │  │  │  │  └─ 📄utils.js
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  └─ 📄package.json
│  │  │  └─ 📁get-platform
│  │  │     ├─ 📁dist
│  │  │     │  ├─ 📁test-utils
│  │  │     │  │  ├─ 📄binaryTargetRegex.d.ts
│  │  │     │  │  ├─ 📄binaryTargetRegex.js
│  │  │     │  │  ├─ 📄index.d.ts
│  │  │     │  │  ├─ 📄index.js
│  │  │     │  │  ├─ 📄jestContext.d.ts
│  │  │     │  │  ├─ 📄jestContext.js
│  │  │     │  │  └─ 📄jestSnapshotSerializer.js
│  │  │     │  ├─ 📄assertNodeAPISupported.d.ts
│  │  │     │  ├─ 📄assertNodeAPISupported.js
│  │  │     │  ├─ 📄binaryTargets.d.ts
│  │  │     │  ├─ 📄binaryTargets.js
│  │  │     │  ├─ 📄chunk-2ESYSVXG.js
│  │  │     │  ├─ 📄chunk-2U36ISZO.js
│  │  │     │  ├─ 📄chunk-6HZWON4S.js
│  │  │     │  ├─ 📄chunk-7MLUNQIZ.js
│  │  │     │  ├─ 📄chunk-7PMGXL6S.js
│  │  │     │  ├─ 📄chunk-FWMN4WME.js
│  │  │     │  ├─ 📄chunk-HE3NEP2U.js
│  │  │     │  ├─ 📄chunk-IPLRRT6O.js
│  │  │     │  ├─ 📄chunk-M5T7GI2R.js
│  │  │     │  ├─ 📄chunk-O5EOXX3N.js
│  │  │     │  ├─ 📄chunk-YVXCXD3A.js
│  │  │     │  ├─ 📄getNodeAPIName.d.ts
│  │  │     │  ├─ 📄getNodeAPIName.js
│  │  │     │  ├─ 📄getPlatform.d.ts
│  │  │     │  ├─ 📄getPlatform.js
│  │  │     │  ├─ 📄index.d.ts
│  │  │     │  ├─ 📄index.js
│  │  │     │  ├─ 📄link.d.ts
│  │  │     │  ├─ 📄link.js
│  │  │     │  ├─ 📄logger.d.ts
│  │  │     │  └─ 📄logger.js
│  │  │     ├─ 📄LICENSE
│  │  │     ├─ 📄README.md
│  │  │     └─ 📄package.json
│  │  ├─ 📁@tsconfig
│  │  │  ├─ 📁node10
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄package.json
│  │  │  │  └─ 📄tsconfig.json
│  │  │  ├─ 📁node12
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄package.json
│  │  │  │  └─ 📄tsconfig.json
│  │  │  ├─ 📁node14
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄package.json
│  │  │  │  └─ 📄tsconfig.json
│  │  │  └─ 📁node16
│  │  │     ├─ 📄LICENSE
│  │  │     ├─ 📄README.md
│  │  │     ├─ 📄package.json
│  │  │     └─ 📄tsconfig.json
│  │  ├─ 📁@types
│  │  │  ├─ 📁bcrypt
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  └─ 📄package.json
│  │  │  ├─ 📁body-parser
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  └─ 📄package.json
│  │  │  ├─ 📁connect
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  └─ 📄package.json
│  │  │  ├─ 📁express
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  └─ 📄package.json
│  │  │  ├─ 📁express-serve-static-core
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  └─ 📄package.json
│  │  │  ├─ 📁http-errors
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  └─ 📄package.json
│  │  │  ├─ 📁jsonwebtoken
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  └─ 📄package.json
│  │  │  ├─ 📁mime
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄Mime.d.ts
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  ├─ 📄lite.d.ts
│  │  │  │  └─ 📄package.json
│  │  │  ├─ 📁ms
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  └─ 📄package.json
│  │  │  ├─ 📁multer
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  └─ 📄package.json
│  │  │  ├─ 📁node
│  │  │  │  ├─ 📁assert
│  │  │  │  │  └─ 📄strict.d.ts
│  │  │  │  ├─ 📁compatibility
│  │  │  │  │  └─ 📄iterators.d.ts
│  │  │  │  ├─ 📁dns
│  │  │  │  │  └─ 📄promises.d.ts
│  │  │  │  ├─ 📁fs
│  │  │  │  │  └─ 📄promises.d.ts
│  │  │  │  ├─ 📁readline
│  │  │  │  │  └─ 📄promises.d.ts
│  │  │  │  ├─ 📁stream
│  │  │  │  │  ├─ 📄consumers.d.ts
│  │  │  │  │  ├─ 📄promises.d.ts
│  │  │  │  │  └─ 📄web.d.ts
│  │  │  │  ├─ 📁timers
│  │  │  │  │  └─ 📄promises.d.ts
│  │  │  │  ├─ 📁ts5.1
│  │  │  │  │  ├─ 📁compatibility
│  │  │  │  │  │  └─ 📄disposable.d.ts
│  │  │  │  │  └─ 📄index.d.ts
│  │  │  │  ├─ 📁ts5.6
│  │  │  │  │  ├─ 📁compatibility
│  │  │  │  │  │  └─ 📄float16array.d.ts
│  │  │  │  │  ├─ 📄buffer.buffer.d.ts
│  │  │  │  │  ├─ 📄globals.typedarray.d.ts
│  │  │  │  │  └─ 📄index.d.ts
│  │  │  │  ├─ 📁ts5.7
│  │  │  │  │  ├─ 📁compatibility
│  │  │  │  │  │  └─ 📄float16array.d.ts
│  │  │  │  │  └─ 📄index.d.ts
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄assert.d.ts
│  │  │  │  ├─ 📄async_hooks.d.ts
│  │  │  │  ├─ 📄buffer.buffer.d.ts
│  │  │  │  ├─ 📄buffer.d.ts
│  │  │  │  ├─ 📄child_process.d.ts
│  │  │  │  ├─ 📄cluster.d.ts
│  │  │  │  ├─ 📄console.d.ts
│  │  │  │  ├─ 📄constants.d.ts
│  │  │  │  ├─ 📄crypto.d.ts
│  │  │  │  ├─ 📄dgram.d.ts
│  │  │  │  ├─ 📄diagnostics_channel.d.ts
│  │  │  │  ├─ 📄dns.d.ts
│  │  │  │  ├─ 📄dom-events.d.ts
│  │  │  │  ├─ 📄domain.d.ts
│  │  │  │  ├─ 📄events.d.ts
│  │  │  │  ├─ 📄fs.d.ts
│  │  │  │  ├─ 📄globals.d.ts
│  │  │  │  ├─ 📄globals.typedarray.d.ts
│  │  │  │  ├─ 📄http.d.ts
│  │  │  │  ├─ 📄http2.d.ts
│  │  │  │  ├─ 📄https.d.ts
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  ├─ 📄inspector.d.ts
│  │  │  │  ├─ 📄module.d.ts
│  │  │  │  ├─ 📄net.d.ts
│  │  │  │  ├─ 📄os.d.ts
│  │  │  │  ├─ 📄package.json
│  │  │  │  ├─ 📄path.d.ts
│  │  │  │  ├─ 📄perf_hooks.d.ts
│  │  │  │  ├─ 📄process.d.ts
│  │  │  │  ├─ 📄punycode.d.ts
│  │  │  │  ├─ 📄querystring.d.ts
│  │  │  │  ├─ 📄readline.d.ts
│  │  │  │  ├─ 📄repl.d.ts
│  │  │  │  ├─ 📄sea.d.ts
│  │  │  │  ├─ 📄sqlite.d.ts
│  │  │  │  ├─ 📄stream.d.ts
│  │  │  │  ├─ 📄string_decoder.d.ts
│  │  │  │  ├─ 📄test.d.ts
│  │  │  │  ├─ 📄timers.d.ts
│  │  │  │  ├─ 📄tls.d.ts
│  │  │  │  ├─ 📄trace_events.d.ts
│  │  │  │  ├─ 📄tty.d.ts
│  │  │  │  ├─ 📄url.d.ts
│  │  │  │  ├─ 📄util.d.ts
│  │  │  │  ├─ 📄v8.d.ts
│  │  │  │  ├─ 📄vm.d.ts
│  │  │  │  ├─ 📄wasi.d.ts
│  │  │  │  ├─ 📄worker_threads.d.ts
│  │  │  │  └─ 📄zlib.d.ts
│  │  │  ├─ 📁qs
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  └─ 📄package.json
│  │  │  ├─ 📁range-parser
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  └─ 📄package.json
│  │  │  ├─ 📁send
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  └─ 📄package.json
│  │  │  ├─ 📁serve-static
│  │  │  │  ├─ 📄LICENSE
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  └─ 📄package.json
│  │  │  ├─ 📁strip-bom
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  ├─ 📄package.json
│  │  │  │  └─ 📄types-metadata.json
│  │  │  └─ 📁strip-json-comments
│  │  │     ├─ 📄LICENSE
│  │  │     ├─ 📄README.md
│  │  │     ├─ 📄index.d.ts
│  │  │     └─ 📄package.json
│  │  ├─ 📁accepts
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁acorn
│  │  │  ├─ 📁bin
│  │  │  │  └─ 📄acorn
│  │  │  ├─ 📁dist
│  │  │  │  ├─ 📄acorn.d.mts
│  │  │  │  ├─ 📄acorn.d.ts
│  │  │  │  ├─ 📄acorn.js
│  │  │  │  ├─ 📄acorn.mjs
│  │  │  │  └─ 📄bin.js
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  └─ 📄package.json
│  │  ├─ 📁acorn-walk
│  │  │  ├─ 📁dist
│  │  │  │  ├─ 📄walk.d.mts
│  │  │  │  ├─ 📄walk.d.ts
│  │  │  │  ├─ 📄walk.js
│  │  │  │  └─ 📄walk.mjs
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  └─ 📄package.json
│  │  ├─ 📁anymatch
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁append-field
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄parse-path.js
│  │  │  │  └─ 📄set-value.js
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄forms.js
│  │  │  ├─ 📄.npmignore
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁arg
│  │  │  ├─ 📄LICENSE.md
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁balanced-match
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📄LICENSE.md
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁bcrypt
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📁workflows
│  │  │  │     ├─ 📄build-pack-publish.yml
│  │  │  │     └─ 📄ci.yaml
│  │  │  ├─ 📁examples
│  │  │  │  ├─ 📄async_compare.js
│  │  │  │  └─ 📄forever_gen_salt.js
│  │  │  ├─ 📁prebuilds
│  │  │  │  ├─ 📁darwin-arm64
│  │  │  │  │  └─ 📄bcrypt.node
│  │  │  │  ├─ 📁darwin-x64
│  │  │  │  │  └─ 📄bcrypt.node
│  │  │  │  ├─ 📁linux-arm
│  │  │  │  │  ├─ 📄bcrypt.glibc.node
│  │  │  │  │  └─ 📄bcrypt.musl.node
│  │  │  │  ├─ 📁linux-arm64
│  │  │  │  │  ├─ 📄bcrypt.glibc.node
│  │  │  │  │  └─ 📄bcrypt.musl.node
│  │  │  │  ├─ 📁linux-x64
│  │  │  │  │  ├─ 📄bcrypt.glibc.node
│  │  │  │  │  └─ 📄bcrypt.musl.node
│  │  │  │  ├─ 📁win32-arm64
│  │  │  │  │  └─ 📄bcrypt.node
│  │  │  │  └─ 📁win32-x64
│  │  │  │     └─ 📄bcrypt.node
│  │  │  ├─ 📁src
│  │  │  │  ├─ 📄bcrypt.cc
│  │  │  │  ├─ 📄bcrypt_node.cc
│  │  │  │  ├─ 📄blowfish.cc
│  │  │  │  └─ 📄node_blf.h
│  │  │  ├─ 📁test
│  │  │  │  ├─ 📄async.test.js
│  │  │  │  ├─ 📄implementation.test.js
│  │  │  │  ├─ 📄promise.test.js
│  │  │  │  ├─ 📄repetitions.test.js
│  │  │  │  └─ 📄sync.test.js
│  │  │  ├─ 📄.dockerignore
│  │  │  ├─ 📄.editorconfig
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄Dockerfile
│  │  │  ├─ 📄Dockerfile-alpine
│  │  │  ├─ 📄ISSUE_TEMPLATE.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄Makefile
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄SECURITY.md
│  │  │  ├─ 📄bcrypt.js
│  │  │  ├─ 📄binding.gyp
│  │  │  ├─ 📄build-all.sh
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄promises.js
│  │  ├─ 📁binary-extensions
│  │  │  ├─ 📄binary-extensions.json
│  │  │  ├─ 📄binary-extensions.json.d.ts
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄license
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄readme.md
│  │  ├─ 📁body-parser
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📁types
│  │  │  │  │  ├─ 📄json.js
│  │  │  │  │  ├─ 📄raw.js
│  │  │  │  │  ├─ 📄text.js
│  │  │  │  │  └─ 📄urlencoded.js
│  │  │  │  ├─ 📄read.js
│  │  │  │  └─ 📄utils.js
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁brace-expansion
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁braces
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄compile.js
│  │  │  │  ├─ 📄constants.js
│  │  │  │  ├─ 📄expand.js
│  │  │  │  ├─ 📄parse.js
│  │  │  │  ├─ 📄stringify.js
│  │  │  │  └─ 📄utils.js
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁buffer-equal-constant-time
│  │  │  ├─ 📄.npmignore
│  │  │  ├─ 📄.travis.yml
│  │  │  ├─ 📄LICENSE.txt
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄test.js
│  │  ├─ 📁buffer-from
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄readme.md
│  │  ├─ 📁busboy
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📁workflows
│  │  │  │     ├─ 📄ci.yml
│  │  │  │     └─ 📄lint.yml
│  │  │  ├─ 📁bench
│  │  │  │  ├─ 📄bench-multipart-fields-100mb-big.js
│  │  │  │  ├─ 📄bench-multipart-fields-100mb-small.js
│  │  │  │  ├─ 📄bench-multipart-files-100mb-big.js
│  │  │  │  ├─ 📄bench-multipart-files-100mb-small.js
│  │  │  │  ├─ 📄bench-urlencoded-fields-100pairs-small.js
│  │  │  │  └─ 📄bench-urlencoded-fields-900pairs-small-alt.js
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📁types
│  │  │  │  │  ├─ 📄multipart.js
│  │  │  │  │  └─ 📄urlencoded.js
│  │  │  │  ├─ 📄index.js
│  │  │  │  └─ 📄utils.js
│  │  │  ├─ 📁test
│  │  │  │  ├─ 📄common.js
│  │  │  │  ├─ 📄test-types-multipart-charsets.js
│  │  │  │  ├─ 📄test-types-multipart-stream-pause.js
│  │  │  │  ├─ 📄test-types-multipart.js
│  │  │  │  ├─ 📄test-types-urlencoded.js
│  │  │  │  └─ 📄test.js
│  │  │  ├─ 📄.eslintrc.js
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  └─ 📄package.json
│  │  ├─ 📁bytes
│  │  │  ├─ 📄History.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄Readme.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁call-bind-apply-helpers
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄.nycrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄actualApply.d.ts
│  │  │  ├─ 📄actualApply.js
│  │  │  ├─ 📄applyBind.d.ts
│  │  │  ├─ 📄applyBind.js
│  │  │  ├─ 📄functionApply.d.ts
│  │  │  ├─ 📄functionApply.js
│  │  │  ├─ 📄functionCall.d.ts
│  │  │  ├─ 📄functionCall.js
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  ├─ 📄reflectApply.d.ts
│  │  │  ├─ 📄reflectApply.js
│  │  │  └─ 📄tsconfig.json
│  │  ├─ 📁call-bound
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄.nycrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄tsconfig.json
│  │  ├─ 📁chokidar
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄constants.js
│  │  │  │  ├─ 📄fsevents-handler.js
│  │  │  │  └─ 📄nodefs-handler.js
│  │  │  ├─ 📁types
│  │  │  │  └─ 📄index.d.ts
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁concat-map
│  │  │  ├─ 📁example
│  │  │  │  └─ 📄map.js
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄map.js
│  │  │  ├─ 📄.travis.yml
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.markdown
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁concat-stream
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄readme.md
│  │  ├─ 📁content-disposition
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁content-type
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁cookie
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄SECURITY.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁cookie-signature
│  │  │  ├─ 📄History.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄Readme.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁cors
│  │  │  ├─ 📁lib
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄CONTRIBUTING.md
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  └─ 📄package.json
│  │  ├─ 📁create-require
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄create-require.d.ts
│  │  │  ├─ 📄create-require.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁debug
│  │  │  ├─ 📁src
│  │  │  │  ├─ 📄browser.js
│  │  │  │  ├─ 📄common.js
│  │  │  │  ├─ 📄index.js
│  │  │  │  └─ 📄node.js
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  └─ 📄package.json
│  │  ├─ 📁depd
│  │  │  ├─ 📁lib
│  │  │  │  └─ 📁browser
│  │  │  │     └─ 📄index.js
│  │  │  ├─ 📄History.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄Readme.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁diff
│  │  │  ├─ 📁dist
│  │  │  │  ├─ 📄diff.js
│  │  │  │  └─ 📄diff.min.js
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📁convert
│  │  │  │  │  ├─ 📄dmp.js
│  │  │  │  │  └─ 📄xml.js
│  │  │  │  ├─ 📁diff
│  │  │  │  │  ├─ 📄array.js
│  │  │  │  │  ├─ 📄base.js
│  │  │  │  │  ├─ 📄character.js
│  │  │  │  │  ├─ 📄css.js
│  │  │  │  │  ├─ 📄json.js
│  │  │  │  │  ├─ 📄line.js
│  │  │  │  │  ├─ 📄sentence.js
│  │  │  │  │  └─ 📄word.js
│  │  │  │  ├─ 📁patch
│  │  │  │  │  ├─ 📄apply.js
│  │  │  │  │  ├─ 📄create.js
│  │  │  │  │  ├─ 📄merge.js
│  │  │  │  │  └─ 📄parse.js
│  │  │  │  ├─ 📁util
│  │  │  │  │  ├─ 📄array.js
│  │  │  │  │  ├─ 📄distance-iterator.js
│  │  │  │  │  └─ 📄params.js
│  │  │  │  ├─ 📄index.es6.js
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄CONTRIBUTING.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄package.json
│  │  │  ├─ 📄release-notes.md
│  │  │  └─ 📄runtime.js
│  │  ├─ 📁dotenv
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄cli-options.js
│  │  │  │  ├─ 📄env-options.js
│  │  │  │  ├─ 📄main.d.ts
│  │  │  │  └─ 📄main.js
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README-es.md
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄SECURITY.md
│  │  │  ├─ 📄config.d.ts
│  │  │  ├─ 📄config.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁dunder-proto
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁test
│  │  │  │  ├─ 📄get.js
│  │  │  │  ├─ 📄index.js
│  │  │  │  └─ 📄set.js
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄.nycrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄get.d.ts
│  │  │  ├─ 📄get.js
│  │  │  ├─ 📄package.json
│  │  │  ├─ 📄set.d.ts
│  │  │  ├─ 📄set.js
│  │  │  └─ 📄tsconfig.json
│  │  ├─ 📁dynamic-dedupe
│  │  │  ├─ 📁example
│  │  │  │  ├─ 📁pack1
│  │  │  │  │  └─ 📁common
│  │  │  │  │     └─ 📁dep-uno
│  │  │  │  │        └─ 📄foo.js
│  │  │  │  ├─ 📁pack2
│  │  │  │  │  └─ 📁common
│  │  │  │  │     └─ 📁dep-uno
│  │  │  │  │        └─ 📄foo.js
│  │  │  │  ├─ 📄deduped.js
│  │  │  │  └─ 📄not-deduped.js
│  │  │  ├─ 📁test
│  │  │  │  ├─ 📁fixtures
│  │  │  │  │  ├─ 📁pack1
│  │  │  │  │  │  └─ 📁common
│  │  │  │  │  │     ├─ 📁dep-dos
│  │  │  │  │  │     │  └─ 📄foo.js
│  │  │  │  │  │     └─ 📁dep-uno
│  │  │  │  │  │        ├─ 📄bar.js
│  │  │  │  │  │        └─ 📄foo.js
│  │  │  │  │  ├─ 📁pack2
│  │  │  │  │  │  └─ 📁common
│  │  │  │  │  │     └─ 📁dep-uno
│  │  │  │  │  │        ├─ 📄bar.js
│  │  │  │  │  │        └─ 📄foo.js
│  │  │  │  │  └─ 📄count.js
│  │  │  │  └─ 📄dedupe.js
│  │  │  ├─ 📄.jshintrc
│  │  │  ├─ 📄.npmignore
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁ecdsa-sig-formatter
│  │  │  ├─ 📁src
│  │  │  │  ├─ 📄ecdsa-sig-formatter.d.ts
│  │  │  │  ├─ 📄ecdsa-sig-formatter.js
│  │  │  │  └─ 📄param-bytes-for-alg.js
│  │  │  ├─ 📄CODEOWNERS
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  └─ 📄package.json
│  │  ├─ 📁ee-first
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁encodeurl
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁es-define-property
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄.nycrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄tsconfig.json
│  │  ├─ 📁es-errors
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄eval.d.ts
│  │  │  ├─ 📄eval.js
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  ├─ 📄range.d.ts
│  │  │  ├─ 📄range.js
│  │  │  ├─ 📄ref.d.ts
│  │  │  ├─ 📄ref.js
│  │  │  ├─ 📄syntax.d.ts
│  │  │  ├─ 📄syntax.js
│  │  │  ├─ 📄tsconfig.json
│  │  │  ├─ 📄type.d.ts
│  │  │  ├─ 📄type.js
│  │  │  ├─ 📄uri.d.ts
│  │  │  └─ 📄uri.js
│  │  ├─ 📁es-object-atoms
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄RequireObjectCoercible.d.ts
│  │  │  ├─ 📄RequireObjectCoercible.js
│  │  │  ├─ 📄ToObject.d.ts
│  │  │  ├─ 📄ToObject.js
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄isObject.d.ts
│  │  │  ├─ 📄isObject.js
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄tsconfig.json
│  │  ├─ 📁escape-html
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄Readme.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁etag
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁express
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄application.js
│  │  │  │  ├─ 📄express.js
│  │  │  │  ├─ 📄request.js
│  │  │  │  ├─ 📄response.js
│  │  │  │  ├─ 📄utils.js
│  │  │  │  └─ 📄view.js
│  │  │  ├─ 📄History.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄Readme.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁fill-range
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁finalhandler
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁forwarded
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁fresh
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁fs.realpath
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄old.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁fsevents
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄fsevents.d.ts
│  │  │  ├─ 📄fsevents.js
│  │  │  ├─ 📄fsevents.node
│  │  │  └─ 📄package.json
│  │  ├─ 📁function-bind
│  │  │  ├─ 📁.github
│  │  │  │  ├─ 📄FUNDING.yml
│  │  │  │  └─ 📄SECURITY.md
│  │  │  ├─ 📁test
│  │  │  │  ├─ 📄.eslintrc
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄.nycrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄implementation.js
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁get-intrinsic
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄GetIntrinsic.js
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄.nycrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁get-proto
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄.nycrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄Object.getPrototypeOf.d.ts
│  │  │  ├─ 📄Object.getPrototypeOf.js
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄Reflect.getPrototypeOf.d.ts
│  │  │  ├─ 📄Reflect.getPrototypeOf.js
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄tsconfig.json
│  │  ├─ 📁glob
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄common.js
│  │  │  ├─ 📄glob.js
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄sync.js
│  │  ├─ 📁glob-parent
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁gopd
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄gOPD.d.ts
│  │  │  ├─ 📄gOPD.js
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄tsconfig.json
│  │  ├─ 📁has-symbols
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁test
│  │  │  │  ├─ 📁shams
│  │  │  │  │  ├─ 📄core-js.js
│  │  │  │  │  └─ 📄get-own-property-symbols.js
│  │  │  │  ├─ 📄index.js
│  │  │  │  └─ 📄tests.js
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄.nycrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  ├─ 📄shams.d.ts
│  │  │  ├─ 📄shams.js
│  │  │  └─ 📄tsconfig.json
│  │  ├─ 📁hasown
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄.nycrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄tsconfig.json
│  │  ├─ 📁http-errors
│  │  │  ├─ 📁node_modules
│  │  │  │  └─ 📁statuses
│  │  │  │     ├─ 📄HISTORY.md
│  │  │  │     ├─ 📄LICENSE
│  │  │  │     ├─ 📄README.md
│  │  │  │     ├─ 📄codes.json
│  │  │  │     ├─ 📄index.js
│  │  │  │     └─ 📄package.json
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁iconv-lite
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄dependabot.yml
│  │  │  ├─ 📁.idea
│  │  │  │  ├─ 📁codeStyles
│  │  │  │  │  ├─ 📄Project.xml
│  │  │  │  │  └─ 📄codeStyleConfig.xml
│  │  │  │  ├─ 📁inspectionProfiles
│  │  │  │  │  └─ 📄Project_Default.xml
│  │  │  │  ├─ 📄iconv-lite.iml
│  │  │  │  ├─ 📄modules.xml
│  │  │  │  └─ 📄vcs.xml
│  │  │  ├─ 📁encodings
│  │  │  │  ├─ 📁tables
│  │  │  │  │  ├─ 📄big5-added.json
│  │  │  │  │  ├─ 📄cp936.json
│  │  │  │  │  ├─ 📄cp949.json
│  │  │  │  │  ├─ 📄cp950.json
│  │  │  │  │  ├─ 📄eucjp.json
│  │  │  │  │  ├─ 📄gb18030-ranges.json
│  │  │  │  │  ├─ 📄gbk-added.json
│  │  │  │  │  └─ 📄shiftjis.json
│  │  │  │  ├─ 📄dbcs-codec.js
│  │  │  │  ├─ 📄dbcs-data.js
│  │  │  │  ├─ 📄index.js
│  │  │  │  ├─ 📄internal.js
│  │  │  │  ├─ 📄sbcs-codec.js
│  │  │  │  ├─ 📄sbcs-data-generated.js
│  │  │  │  ├─ 📄sbcs-data.js
│  │  │  │  ├─ 📄utf16.js
│  │  │  │  ├─ 📄utf32.js
│  │  │  │  └─ 📄utf7.js
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄bom-handling.js
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  ├─ 📄index.js
│  │  │  │  └─ 📄streams.js
│  │  │  ├─ 📄Changelog.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  └─ 📄package.json
│  │  ├─ 📁inflight
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄inflight.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁inherits
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄inherits.js
│  │  │  ├─ 📄inherits_browser.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁ipaddr.js
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄ipaddr.js
│  │  │  │  └─ 📄ipaddr.js.d.ts
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄ipaddr.min.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁is-binary-path
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄license
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄readme.md
│  │  ├─ 📁is-core-module
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄.nycrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄core.json
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁is-extglob
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁is-glob
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁is-number
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁is-promise
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄index.mjs
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄readme.md
│  │  ├─ 📁jiti
│  │  │  ├─ 📁dist
│  │  │  │  ├─ 📄babel.cjs
│  │  │  │  └─ 📄jiti.cjs
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄jiti-cli.mjs
│  │  │  │  ├─ 📄jiti-hooks.mjs
│  │  │  │  ├─ 📄jiti-native.mjs
│  │  │  │  ├─ 📄jiti-register.d.mts
│  │  │  │  ├─ 📄jiti-register.mjs
│  │  │  │  ├─ 📄jiti.cjs
│  │  │  │  ├─ 📄jiti.d.cts
│  │  │  │  ├─ 📄jiti.d.mts
│  │  │  │  ├─ 📄jiti.mjs
│  │  │  │  └─ 📄types.d.ts
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  └─ 📄package.json
│  │  ├─ 📁jsonwebtoken
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄JsonWebTokenError.js
│  │  │  │  ├─ 📄NotBeforeError.js
│  │  │  │  ├─ 📄TokenExpiredError.js
│  │  │  │  ├─ 📄asymmetricKeyDetailsSupported.js
│  │  │  │  ├─ 📄psSupported.js
│  │  │  │  ├─ 📄rsaPssKeyDetailsSupported.js
│  │  │  │  ├─ 📄timespan.js
│  │  │  │  └─ 📄validateAsymmetricKey.js
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄decode.js
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  ├─ 📄sign.js
│  │  │  └─ 📄verify.js
│  │  ├─ 📁jwa
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁jws
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄data-stream.js
│  │  │  │  ├─ 📄sign-stream.js
│  │  │  │  ├─ 📄tostring.js
│  │  │  │  └─ 📄verify-stream.js
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄readme.md
│  │  ├─ 📁lodash.includes
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁lodash.isboolean
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁lodash.isinteger
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁lodash.isnumber
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁lodash.isplainobject
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁lodash.isstring
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁lodash.once
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁make-error
│  │  │  ├─ 📁dist
│  │  │  │  └─ 📄make-error.js
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁math-intrinsics
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁constants
│  │  │  │  ├─ 📄maxArrayLength.d.ts
│  │  │  │  ├─ 📄maxArrayLength.js
│  │  │  │  ├─ 📄maxSafeInteger.d.ts
│  │  │  │  ├─ 📄maxSafeInteger.js
│  │  │  │  ├─ 📄maxValue.d.ts
│  │  │  │  └─ 📄maxValue.js
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄abs.d.ts
│  │  │  ├─ 📄abs.js
│  │  │  ├─ 📄floor.d.ts
│  │  │  ├─ 📄floor.js
│  │  │  ├─ 📄isFinite.d.ts
│  │  │  ├─ 📄isFinite.js
│  │  │  ├─ 📄isInteger.d.ts
│  │  │  ├─ 📄isInteger.js
│  │  │  ├─ 📄isNaN.d.ts
│  │  │  ├─ 📄isNaN.js
│  │  │  ├─ 📄isNegativeZero.d.ts
│  │  │  ├─ 📄isNegativeZero.js
│  │  │  ├─ 📄max.d.ts
│  │  │  ├─ 📄max.js
│  │  │  ├─ 📄min.d.ts
│  │  │  ├─ 📄min.js
│  │  │  ├─ 📄mod.d.ts
│  │  │  ├─ 📄mod.js
│  │  │  ├─ 📄package.json
│  │  │  ├─ 📄pow.d.ts
│  │  │  ├─ 📄pow.js
│  │  │  ├─ 📄round.d.ts
│  │  │  ├─ 📄round.js
│  │  │  ├─ 📄sign.d.ts
│  │  │  ├─ 📄sign.js
│  │  │  └─ 📄tsconfig.json
│  │  ├─ 📁media-typer
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁merge-descriptors
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄license
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄readme.md
│  │  ├─ 📁mime-db
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄db.json
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁mime-types
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄mimeScore.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁minimatch
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄minimatch.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁minimist
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁example
│  │  │  │  └─ 📄parse.js
│  │  │  ├─ 📁test
│  │  │  │  ├─ 📄all_bool.js
│  │  │  │  ├─ 📄bool.js
│  │  │  │  ├─ 📄dash.js
│  │  │  │  ├─ 📄default_bool.js
│  │  │  │  ├─ 📄dotted.js
│  │  │  │  ├─ 📄kv_short.js
│  │  │  │  ├─ 📄long.js
│  │  │  │  ├─ 📄num.js
│  │  │  │  ├─ 📄parse.js
│  │  │  │  ├─ 📄parse_modified.js
│  │  │  │  ├─ 📄proto.js
│  │  │  │  ├─ 📄short.js
│  │  │  │  ├─ 📄stop_early.js
│  │  │  │  ├─ 📄unknown.js
│  │  │  │  └─ 📄whitespace.js
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄.nycrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁mkdirp
│  │  │  ├─ 📁bin
│  │  │  │  └─ 📄cmd.js
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄find-made.js
│  │  │  │  ├─ 📄mkdirp-manual.js
│  │  │  │  ├─ 📄mkdirp-native.js
│  │  │  │  ├─ 📄opts-arg.js
│  │  │  │  ├─ 📄path-arg.js
│  │  │  │  └─ 📄use-native.js
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄readme.markdown
│  │  ├─ 📁ms
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄license.md
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄readme.md
│  │  ├─ 📁multer
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄counter.js
│  │  │  │  ├─ 📄file-appender.js
│  │  │  │  ├─ 📄make-middleware.js
│  │  │  │  ├─ 📄multer-error.js
│  │  │  │  └─ 📄remove-uploaded-files.js
│  │  │  ├─ 📁node_modules
│  │  │  │  ├─ 📁.bin
│  │  │  │  │  └─ 📄mkdirp
│  │  │  │  ├─ 📁media-typer
│  │  │  │  │  ├─ 📄HISTORY.md
│  │  │  │  │  ├─ 📄LICENSE
│  │  │  │  │  ├─ 📄README.md
│  │  │  │  │  ├─ 📄index.js
│  │  │  │  │  └─ 📄package.json
│  │  │  │  ├─ 📁mime-db
│  │  │  │  │  ├─ 📄HISTORY.md
│  │  │  │  │  ├─ 📄LICENSE
│  │  │  │  │  ├─ 📄README.md
│  │  │  │  │  ├─ 📄db.json
│  │  │  │  │  ├─ 📄index.js
│  │  │  │  │  └─ 📄package.json
│  │  │  │  ├─ 📁mime-types
│  │  │  │  │  ├─ 📄HISTORY.md
│  │  │  │  │  ├─ 📄LICENSE
│  │  │  │  │  ├─ 📄README.md
│  │  │  │  │  ├─ 📄index.js
│  │  │  │  │  └─ 📄package.json
│  │  │  │  ├─ 📁mkdirp
│  │  │  │  │  ├─ 📁bin
│  │  │  │  │  │  ├─ 📄cmd.js
│  │  │  │  │  │  └─ 📄usage.txt
│  │  │  │  │  ├─ 📄LICENSE
│  │  │  │  │  ├─ 📄index.js
│  │  │  │  │  ├─ 📄package.json
│  │  │  │  │  └─ 📄readme.markdown
│  │  │  │  └─ 📁type-is
│  │  │  │     ├─ 📄HISTORY.md
│  │  │  │     ├─ 📄LICENSE
│  │  │  │     ├─ 📄README.md
│  │  │  │     ├─ 📄index.js
│  │  │  │     └─ 📄package.json
│  │  │  ├─ 📁storage
│  │  │  │  ├─ 📄disk.js
│  │  │  │  └─ 📄memory.js
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁negotiator
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄charset.js
│  │  │  │  ├─ 📄encoding.js
│  │  │  │  ├─ 📄language.js
│  │  │  │  └─ 📄mediaType.js
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁node-addon-api
│  │  │  ├─ 📁tools
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄check-napi.js
│  │  │  │  ├─ 📄clang-format.js
│  │  │  │  └─ 📄conversion.js
│  │  │  ├─ 📄LICENSE.md
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄common.gypi
│  │  │  ├─ 📄except.gypi
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄napi-inl.deprecated.h
│  │  │  ├─ 📄napi-inl.h
│  │  │  ├─ 📄napi.h
│  │  │  ├─ 📄node_addon_api.gyp
│  │  │  ├─ 📄node_api.gyp
│  │  │  ├─ 📄noexcept.gypi
│  │  │  ├─ 📄nothing.c
│  │  │  ├─ 📄package-support.json
│  │  │  └─ 📄package.json
│  │  ├─ 📁node-gyp-build
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄SECURITY.md
│  │  │  ├─ 📄bin.js
│  │  │  ├─ 📄build-test.js
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄node-gyp-build.js
│  │  │  ├─ 📄optional.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁normalize-path
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁object-assign
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄license
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄readme.md
│  │  ├─ 📁object-inspect
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁example
│  │  │  │  ├─ 📄all.js
│  │  │  │  ├─ 📄circular.js
│  │  │  │  ├─ 📄fn.js
│  │  │  │  └─ 📄inspect.js
│  │  │  ├─ 📁test
│  │  │  │  ├─ 📁browser
│  │  │  │  │  └─ 📄dom.js
│  │  │  │  ├─ 📄bigint.js
│  │  │  │  ├─ 📄circular.js
│  │  │  │  ├─ 📄deep.js
│  │  │  │  ├─ 📄element.js
│  │  │  │  ├─ 📄err.js
│  │  │  │  ├─ 📄fakes.js
│  │  │  │  ├─ 📄fn.js
│  │  │  │  ├─ 📄global.js
│  │  │  │  ├─ 📄has.js
│  │  │  │  ├─ 📄holes.js
│  │  │  │  ├─ 📄indent-option.js
│  │  │  │  ├─ 📄inspect.js
│  │  │  │  ├─ 📄lowbyte.js
│  │  │  │  ├─ 📄number.js
│  │  │  │  ├─ 📄quoteStyle.js
│  │  │  │  ├─ 📄toStringTag.js
│  │  │  │  ├─ 📄undef.js
│  │  │  │  └─ 📄values.js
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄.nycrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package-support.json
│  │  │  ├─ 📄package.json
│  │  │  ├─ 📄readme.markdown
│  │  │  ├─ 📄test-core-js.js
│  │  │  └─ 📄util.inspect.js
│  │  ├─ 📁on-finished
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁once
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄once.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁parseurl
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁path-is-absolute
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄license
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄readme.md
│  │  ├─ 📁path-parse
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁path-to-regexp
│  │  │  ├─ 📁dist
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  ├─ 📄index.js
│  │  │  │  └─ 📄index.js.map
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄Readme.md
│  │  │  └─ 📄package.json
│  │  ├─ 📁picomatch
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄constants.js
│  │  │  │  ├─ 📄parse.js
│  │  │  │  ├─ 📄picomatch.js
│  │  │  │  ├─ 📄scan.js
│  │  │  │  └─ 📄utils.js
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁prisma
│  │  │  ├─ 📁build
│  │  │  ├─ 📁dist
│  │  │  │  └─ 📁cli
│  │  │  │     └─ 📁src
│  │  │  │        └─ 📄types.d.ts
│  │  │  ├─ 📁engines
│  │  │  │  └─ 📁f40f79ec31188888a2e33acda0ecc8fd10a853a9
│  │  │  │     └─ 📄libquery_engine-darwin-arm64.dylib.node
│  │  │  ├─ 📁preinstall
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📁prisma-client
│  │  │  │  ├─ 📁generator-build
│  │  │  │  │  └─ 📄index.js
│  │  │  │  ├─ 📁runtime
│  │  │  │  │  ├─ 📄binary.d.ts
│  │  │  │  │  ├─ 📄binary.js
│  │  │  │  │  ├─ 📄binary.mjs
│  │  │  │  │  ├─ 📄client.d.mts
│  │  │  │  │  ├─ 📄client.d.ts
│  │  │  │  │  ├─ 📄client.js
│  │  │  │  │  ├─ 📄client.mjs
│  │  │  │  │  ├─ 📄edge-esm.js
│  │  │  │  │  ├─ 📄edge.d.ts
│  │  │  │  │  ├─ 📄edge.js
│  │  │  │  │  ├─ 📄index-browser.d.ts
│  │  │  │  │  ├─ 📄index-browser.js
│  │  │  │  │  ├─ 📄library.d.mts
│  │  │  │  │  ├─ 📄library.d.ts
│  │  │  │  │  ├─ 📄library.js
│  │  │  │  │  ├─ 📄library.mjs
│  │  │  │  │  ├─ 📄query_compiler_bg.cockroachdb.js
│  │  │  │  │  ├─ 📄query_compiler_bg.cockroachdb.mjs
│  │  │  │  │  ├─ 📄query_compiler_bg.mysql.js
│  │  │  │  │  ├─ 📄query_compiler_bg.mysql.mjs
│  │  │  │  │  ├─ 📄query_compiler_bg.postgresql.js
│  │  │  │  │  ├─ 📄query_compiler_bg.postgresql.mjs
│  │  │  │  │  ├─ 📄query_compiler_bg.sqlite.js
│  │  │  │  │  ├─ 📄query_compiler_bg.sqlite.mjs
│  │  │  │  │  ├─ 📄query_compiler_bg.sqlserver.js
│  │  │  │  │  ├─ 📄query_compiler_bg.sqlserver.mjs
│  │  │  │  │  ├─ 📄query_engine_bg.cockroachdb.js
│  │  │  │  │  ├─ 📄query_engine_bg.cockroachdb.mjs
│  │  │  │  │  ├─ 📄query_engine_bg.mysql.js
│  │  │  │  │  ├─ 📄query_engine_bg.mysql.mjs
│  │  │  │  │  ├─ 📄query_engine_bg.postgresql.js
│  │  │  │  │  ├─ 📄query_engine_bg.postgresql.mjs
│  │  │  │  │  ├─ 📄query_engine_bg.sqlite.js
│  │  │  │  │  ├─ 📄query_engine_bg.sqlite.mjs
│  │  │  │  │  ├─ 📄query_engine_bg.sqlserver.js
│  │  │  │  │  ├─ 📄query_engine_bg.sqlserver.mjs
│  │  │  │  │  ├─ 📄react-native.d.ts
│  │  │  │  │  └─ 📄react-native.js
│  │  │  │  ├─ 📁scripts
│  │  │  │  │  ├─ 📄colors.js
│  │  │  │  │  ├─ 📄default-index.d.ts
│  │  │  │  │  ├─ 📄default-index.js
│  │  │  │  │  ├─ 📄postinstall.d.ts
│  │  │  │  │  └─ 📄postinstall.js
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄default.d.ts
│  │  │  │  ├─ 📄default.js
│  │  │  │  ├─ 📄edge.d.ts
│  │  │  │  ├─ 📄edge.js
│  │  │  │  ├─ 📄extension.d.ts
│  │  │  │  ├─ 📄extension.js
│  │  │  │  ├─ 📄index-browser.js
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  ├─ 📄index.js
│  │  │  │  ├─ 📄package.json
│  │  │  │  ├─ 📄react-native.d.ts
│  │  │  │  ├─ 📄react-native.js
│  │  │  │  ├─ 📄sql.d.ts
│  │  │  │  ├─ 📄sql.js
│  │  │  │  └─ 📄sql.mjs
│  │  │  ├─ 📁scripts
│  │  │  │  └─ 📄preinstall-entry.js
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄config.d.ts
│  │  │  ├─ 📄config.js
│  │  │  ├─ 📄libquery_engine-darwin-arm64.dylib.node
│  │  │  └─ 📄package.json
│  │  ├─ 📁proxy-addr
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁qs
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁dist
│  │  │  │  └─ 📄qs.js
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄formats.js
│  │  │  │  ├─ 📄index.js
│  │  │  │  ├─ 📄parse.js
│  │  │  │  ├─ 📄stringify.js
│  │  │  │  └─ 📄utils.js
│  │  │  ├─ 📁test
│  │  │  │  ├─ 📄empty-keys-cases.js
│  │  │  │  ├─ 📄parse.js
│  │  │  │  ├─ 📄stringify.js
│  │  │  │  └─ 📄utils.js
│  │  │  ├─ 📄.editorconfig
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄.nycrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE.md
│  │  │  ├─ 📄README.md
│  │  │  └─ 📄package.json
│  │  ├─ 📁range-parser
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁raw-body
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄SECURITY.md
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁readable-stream
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📁internal
│  │  │  │  │  └─ 📁streams
│  │  │  │  │     ├─ 📄async_iterator.js
│  │  │  │  │     ├─ 📄buffer_list.js
│  │  │  │  │     ├─ 📄destroy.js
│  │  │  │  │     ├─ 📄end-of-stream.js
│  │  │  │  │     ├─ 📄from-browser.js
│  │  │  │  │     ├─ 📄from.js
│  │  │  │  │     ├─ 📄pipeline.js
│  │  │  │  │     ├─ 📄state.js
│  │  │  │  │     ├─ 📄stream-browser.js
│  │  │  │  │     └─ 📄stream.js
│  │  │  │  ├─ 📄_stream_duplex.js
│  │  │  │  ├─ 📄_stream_passthrough.js
│  │  │  │  ├─ 📄_stream_readable.js
│  │  │  │  ├─ 📄_stream_transform.js
│  │  │  │  └─ 📄_stream_writable.js
│  │  │  ├─ 📄CONTRIBUTING.md
│  │  │  ├─ 📄GOVERNANCE.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄errors-browser.js
│  │  │  ├─ 📄errors.js
│  │  │  ├─ 📄experimentalWarning.js
│  │  │  ├─ 📄package.json
│  │  │  ├─ 📄readable-browser.js
│  │  │  └─ 📄readable.js
│  │  ├─ 📁readdirp
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁resolve
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁bin
│  │  │  │  └─ 📄resolve
│  │  │  ├─ 📁example
│  │  │  │  ├─ 📄async.js
│  │  │  │  └─ 📄sync.js
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄async.js
│  │  │  │  ├─ 📄caller.js
│  │  │  │  ├─ 📄core.js
│  │  │  │  ├─ 📄core.json
│  │  │  │  ├─ 📄homedir.js
│  │  │  │  ├─ 📄is-core.js
│  │  │  │  ├─ 📄node-modules-paths.js
│  │  │  │  ├─ 📄normalize-options.js
│  │  │  │  └─ 📄sync.js
│  │  │  ├─ 📁test
│  │  │  │  ├─ 📁dotdot
│  │  │  │  │  ├─ 📁abc
│  │  │  │  │  │  └─ 📄index.js
│  │  │  │  │  └─ 📄index.js
│  │  │  │  ├─ 📁module_dir
│  │  │  │  │  ├─ 📁xmodules
│  │  │  │  │  │  └─ 📁aaa
│  │  │  │  │  │     └─ 📄index.js
│  │  │  │  │  ├─ 📁ymodules
│  │  │  │  │  │  └─ 📁aaa
│  │  │  │  │  │     └─ 📄index.js
│  │  │  │  │  └─ 📁zmodules
│  │  │  │  │     └─ 📁bbb
│  │  │  │  │        ├─ 📄main.js
│  │  │  │  │        └─ 📄package.json
│  │  │  │  ├─ 📁node_path
│  │  │  │  │  ├─ 📁x
│  │  │  │  │  │  ├─ 📁aaa
│  │  │  │  │  │  │  └─ 📄index.js
│  │  │  │  │  │  └─ 📁ccc
│  │  │  │  │  │     └─ 📄index.js
│  │  │  │  │  └─ 📁y
│  │  │  │  │     ├─ 📁bbb
│  │  │  │  │     │  └─ 📄index.js
│  │  │  │  │     └─ 📁ccc
│  │  │  │  │        └─ 📄index.js
│  │  │  │  ├─ 📁pathfilter
│  │  │  │  │  └─ 📁deep_ref
│  │  │  │  │     └─ 📄main.js
│  │  │  │  ├─ 📁precedence
│  │  │  │  │  ├─ 📁aaa
│  │  │  │  │  │  ├─ 📄index.js
│  │  │  │  │  │  └─ 📄main.js
│  │  │  │  │  ├─ 📁bbb
│  │  │  │  │  │  └─ 📄main.js
│  │  │  │  │  ├─ 📄aaa.js
│  │  │  │  │  └─ 📄bbb.js
│  │  │  │  ├─ 📁resolver
│  │  │  │  │  ├─ 📁baz
│  │  │  │  │  │  ├─ 📄doom.js
│  │  │  │  │  │  ├─ 📄package.json
│  │  │  │  │  │  └─ 📄quux.js
│  │  │  │  │  ├─ 📁browser_field
│  │  │  │  │  │  ├─ 📄a.js
│  │  │  │  │  │  ├─ 📄b.js
│  │  │  │  │  │  └─ 📄package.json
│  │  │  │  │  ├─ 📁dot_main
│  │  │  │  │  │  ├─ 📄index.js
│  │  │  │  │  │  └─ 📄package.json
│  │  │  │  │  ├─ 📁dot_slash_main
│  │  │  │  │  │  ├─ 📄index.js
│  │  │  │  │  │  └─ 📄package.json
│  │  │  │  │  ├─ 📁false_main
│  │  │  │  │  │  ├─ 📄index.js
│  │  │  │  │  │  └─ 📄package.json
│  │  │  │  │  ├─ 📁incorrect_main
│  │  │  │  │  │  ├─ 📄index.js
│  │  │  │  │  │  └─ 📄package.json
│  │  │  │  │  ├─ 📁invalid_main
│  │  │  │  │  │  └─ 📄package.json
│  │  │  │  │  ├─ 📁multirepo
│  │  │  │  │  │  ├─ 📁packages
│  │  │  │  │  │  │  ├─ 📁package-a
│  │  │  │  │  │  │  │  ├─ 📄index.js
│  │  │  │  │  │  │  │  └─ 📄package.json
│  │  │  │  │  │  │  └─ 📁package-b
│  │  │  │  │  │  │     ├─ 📄index.js
│  │  │  │  │  │  │     └─ 📄package.json
│  │  │  │  │  │  ├─ 📄lerna.json
│  │  │  │  │  │  └─ 📄package.json
│  │  │  │  │  ├─ 📁nested_symlinks
│  │  │  │  │  │  └─ 📁mylib
│  │  │  │  │  │     ├─ 📄async.js
│  │  │  │  │  │     ├─ 📄package.json
│  │  │  │  │  │     └─ 📄sync.js
│  │  │  │  │  ├─ 📁other_path
│  │  │  │  │  │  ├─ 📁lib
│  │  │  │  │  │  │  └─ 📄other-lib.js
│  │  │  │  │  │  └─ 📄root.js
│  │  │  │  │  ├─ 📁quux
│  │  │  │  │  │  └─ 📁foo
│  │  │  │  │  │     └─ 📄index.js
│  │  │  │  │  ├─ 📁same_names
│  │  │  │  │  │  ├─ 📁foo
│  │  │  │  │  │  │  └─ 📄index.js
│  │  │  │  │  │  └─ 📄foo.js
│  │  │  │  │  ├─ 📁symlinked
│  │  │  │  │  │  ├─ 📁_
│  │  │  │  │  │  │  ├─ 📁node_modules
│  │  │  │  │  │  │  │  └─ 📄foo.js
│  │  │  │  │  │  │  └─ 📁symlink_target
│  │  │  │  │  │  │     └─ 📄.gitkeep
│  │  │  │  │  │  └─ 📁package
│  │  │  │  │  │     ├─ 📄bar.js
│  │  │  │  │  │     └─ 📄package.json
│  │  │  │  │  ├─ 📁without_basedir
│  │  │  │  │  │  └─ 📄main.js
│  │  │  │  │  ├─ 📄cup.coffee
│  │  │  │  │  ├─ 📄foo.js
│  │  │  │  │  ├─ 📄mug.coffee
│  │  │  │  │  └─ 📄mug.js
│  │  │  │  ├─ 📁shadowed_core
│  │  │  │  │  └─ 📁node_modules
│  │  │  │  │     └─ 📁util
│  │  │  │  │        └─ 📄index.js
│  │  │  │  ├─ 📄core.js
│  │  │  │  ├─ 📄dotdot.js
│  │  │  │  ├─ 📄faulty_basedir.js
│  │  │  │  ├─ 📄filter.js
│  │  │  │  ├─ 📄filter_sync.js
│  │  │  │  ├─ 📄home_paths.js
│  │  │  │  ├─ 📄home_paths_sync.js
│  │  │  │  ├─ 📄mock.js
│  │  │  │  ├─ 📄mock_sync.js
│  │  │  │  ├─ 📄module_dir.js
│  │  │  │  ├─ 📄node-modules-paths.js
│  │  │  │  ├─ 📄node_path.js
│  │  │  │  ├─ 📄nonstring.js
│  │  │  │  ├─ 📄pathfilter.js
│  │  │  │  ├─ 📄precedence.js
│  │  │  │  ├─ 📄resolver.js
│  │  │  │  ├─ 📄resolver_sync.js
│  │  │  │  ├─ 📄shadowed_core.js
│  │  │  │  ├─ 📄subdirs.js
│  │  │  │  └─ 📄symlinks.js
│  │  │  ├─ 📄.editorconfig
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄SECURITY.md
│  │  │  ├─ 📄async.js
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  ├─ 📄readme.markdown
│  │  │  └─ 📄sync.js
│  │  ├─ 📁rimraf
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄bin.js
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄rimraf.js
│  │  ├─ 📁router
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄layer.js
│  │  │  │  └─ 📄route.js
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁safe-buffer
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁safer-buffer
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄Porting-Buffer.md
│  │  │  ├─ 📄Readme.md
│  │  │  ├─ 📄dangerous.js
│  │  │  ├─ 📄package.json
│  │  │  ├─ 📄safer.js
│  │  │  └─ 📄tests.js
│  │  ├─ 📁semver
│  │  │  ├─ 📁bin
│  │  │  │  └─ 📄semver.js
│  │  │  ├─ 📁classes
│  │  │  │  ├─ 📄comparator.js
│  │  │  │  ├─ 📄index.js
│  │  │  │  ├─ 📄range.js
│  │  │  │  └─ 📄semver.js
│  │  │  ├─ 📁functions
│  │  │  │  ├─ 📄clean.js
│  │  │  │  ├─ 📄cmp.js
│  │  │  │  ├─ 📄coerce.js
│  │  │  │  ├─ 📄compare-build.js
│  │  │  │  ├─ 📄compare-loose.js
│  │  │  │  ├─ 📄compare.js
│  │  │  │  ├─ 📄diff.js
│  │  │  │  ├─ 📄eq.js
│  │  │  │  ├─ 📄gt.js
│  │  │  │  ├─ 📄gte.js
│  │  │  │  ├─ 📄inc.js
│  │  │  │  ├─ 📄lt.js
│  │  │  │  ├─ 📄lte.js
│  │  │  │  ├─ 📄major.js
│  │  │  │  ├─ 📄minor.js
│  │  │  │  ├─ 📄neq.js
│  │  │  │  ├─ 📄parse.js
│  │  │  │  ├─ 📄patch.js
│  │  │  │  ├─ 📄prerelease.js
│  │  │  │  ├─ 📄rcompare.js
│  │  │  │  ├─ 📄rsort.js
│  │  │  │  ├─ 📄satisfies.js
│  │  │  │  ├─ 📄sort.js
│  │  │  │  └─ 📄valid.js
│  │  │  ├─ 📁internal
│  │  │  │  ├─ 📄constants.js
│  │  │  │  ├─ 📄debug.js
│  │  │  │  ├─ 📄identifiers.js
│  │  │  │  ├─ 📄lrucache.js
│  │  │  │  ├─ 📄parse-options.js
│  │  │  │  └─ 📄re.js
│  │  │  ├─ 📁ranges
│  │  │  │  ├─ 📄gtr.js
│  │  │  │  ├─ 📄intersects.js
│  │  │  │  ├─ 📄ltr.js
│  │  │  │  ├─ 📄max-satisfying.js
│  │  │  │  ├─ 📄min-satisfying.js
│  │  │  │  ├─ 📄min-version.js
│  │  │  │  ├─ 📄outside.js
│  │  │  │  ├─ 📄simplify.js
│  │  │  │  ├─ 📄subset.js
│  │  │  │  ├─ 📄to-comparators.js
│  │  │  │  └─ 📄valid.js
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  ├─ 📄preload.js
│  │  │  └─ 📄range.bnf
│  │  ├─ 📁send
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁serve-static
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁setprototypeof
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁side-channel
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄.editorconfig
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄.nycrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄tsconfig.json
│  │  ├─ 📁side-channel-list
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄.editorconfig
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄.nycrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄list.d.ts
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄tsconfig.json
│  │  ├─ 📁side-channel-map
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄.editorconfig
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄.nycrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄tsconfig.json
│  │  ├─ 📁side-channel-weakmap
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄.editorconfig
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄.nycrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄tsconfig.json
│  │  ├─ 📁source-map
│  │  │  ├─ 📁dist
│  │  │  │  ├─ 📄source-map.debug.js
│  │  │  │  ├─ 📄source-map.js
│  │  │  │  ├─ 📄source-map.min.js
│  │  │  │  └─ 📄source-map.min.js.map
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄array-set.js
│  │  │  │  ├─ 📄base64-vlq.js
│  │  │  │  ├─ 📄base64.js
│  │  │  │  ├─ 📄binary-search.js
│  │  │  │  ├─ 📄mapping-list.js
│  │  │  │  ├─ 📄quick-sort.js
│  │  │  │  ├─ 📄source-map-consumer.js
│  │  │  │  ├─ 📄source-map-generator.js
│  │  │  │  ├─ 📄source-node.js
│  │  │  │  └─ 📄util.js
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄package.json
│  │  │  ├─ 📄source-map.d.ts
│  │  │  └─ 📄source-map.js
│  │  ├─ 📁source-map-support
│  │  │  ├─ 📄LICENSE.md
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄browser-source-map-support.js
│  │  │  ├─ 📄package.json
│  │  │  ├─ 📄register-hook-require.js
│  │  │  ├─ 📄register.js
│  │  │  └─ 📄source-map-support.js
│  │  ├─ 📁statuses
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄codes.json
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁streamsearch
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📁workflows
│  │  │  │     ├─ 📄ci.yml
│  │  │  │     └─ 📄lint.yml
│  │  │  ├─ 📁lib
│  │  │  │  └─ 📄sbmh.js
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄test.js
│  │  │  ├─ 📄.eslintrc.js
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  └─ 📄package.json
│  │  ├─ 📁string_decoder
│  │  │  ├─ 📁lib
│  │  │  │  └─ 📄string_decoder.js
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  └─ 📄package.json
│  │  ├─ 📁strip-bom
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄license
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄readme.md
│  │  ├─ 📁strip-json-comments
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄license
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄readme.md
│  │  ├─ 📁supports-preserve-symlinks-flag
│  │  │  ├─ 📁.github
│  │  │  │  └─ 📄FUNDING.yml
│  │  │  ├─ 📁test
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄.eslintrc
│  │  │  ├─ 📄.nycrc
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄browser.js
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁to-regex-range
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁toidentifier
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁tree-kill
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄cli.js
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁ts-node
│  │  │  ├─ 📁dist
│  │  │  │  ├─ 📁child
│  │  │  │  │  ├─ 📄argv-payload.d.ts
│  │  │  │  │  ├─ 📄argv-payload.js
│  │  │  │  │  ├─ 📄argv-payload.js.map
│  │  │  │  │  ├─ 📄child-entrypoint.d.ts
│  │  │  │  │  ├─ 📄child-entrypoint.js
│  │  │  │  │  ├─ 📄child-entrypoint.js.map
│  │  │  │  │  ├─ 📄child-loader.d.ts
│  │  │  │  │  ├─ 📄child-loader.js
│  │  │  │  │  ├─ 📄child-loader.js.map
│  │  │  │  │  ├─ 📄child-require.d.ts
│  │  │  │  │  ├─ 📄child-require.js
│  │  │  │  │  ├─ 📄child-require.js.map
│  │  │  │  │  ├─ 📄spawn-child.d.ts
│  │  │  │  │  ├─ 📄spawn-child.js
│  │  │  │  │  └─ 📄spawn-child.js.map
│  │  │  │  ├─ 📁transpilers
│  │  │  │  │  ├─ 📄swc.d.ts
│  │  │  │  │  ├─ 📄swc.js
│  │  │  │  │  ├─ 📄swc.js.map
│  │  │  │  │  ├─ 📄types.d.ts
│  │  │  │  │  ├─ 📄types.js
│  │  │  │  │  └─ 📄types.js.map
│  │  │  │  ├─ 📄bin-cwd.d.ts
│  │  │  │  ├─ 📄bin-cwd.js
│  │  │  │  ├─ 📄bin-cwd.js.map
│  │  │  │  ├─ 📄bin-esm.d.ts
│  │  │  │  ├─ 📄bin-esm.js
│  │  │  │  ├─ 📄bin-esm.js.map
│  │  │  │  ├─ 📄bin-script-deprecated.d.ts
│  │  │  │  ├─ 📄bin-script-deprecated.js
│  │  │  │  ├─ 📄bin-script-deprecated.js.map
│  │  │  │  ├─ 📄bin-script.d.ts
│  │  │  │  ├─ 📄bin-script.js
│  │  │  │  ├─ 📄bin-script.js.map
│  │  │  │  ├─ 📄bin-transpile.d.ts
│  │  │  │  ├─ 📄bin-transpile.js
│  │  │  │  ├─ 📄bin-transpile.js.map
│  │  │  │  ├─ 📄bin.d.ts
│  │  │  │  ├─ 📄bin.js
│  │  │  │  ├─ 📄bin.js.map
│  │  │  │  ├─ 📄cjs-resolve-hooks.d.ts
│  │  │  │  ├─ 📄cjs-resolve-hooks.js
│  │  │  │  ├─ 📄cjs-resolve-hooks.js.map
│  │  │  │  ├─ 📄configuration.d.ts
│  │  │  │  ├─ 📄configuration.js
│  │  │  │  ├─ 📄configuration.js.map
│  │  │  │  ├─ 📄esm.d.ts
│  │  │  │  ├─ 📄esm.js
│  │  │  │  ├─ 📄esm.js.map
│  │  │  │  ├─ 📄file-extensions.d.ts
│  │  │  │  ├─ 📄file-extensions.js
│  │  │  │  ├─ 📄file-extensions.js.map
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  ├─ 📄index.js
│  │  │  │  ├─ 📄index.js.map
│  │  │  │  ├─ 📄module-type-classifier.d.ts
│  │  │  │  ├─ 📄module-type-classifier.js
│  │  │  │  ├─ 📄module-type-classifier.js.map
│  │  │  │  ├─ 📄node-module-type-classifier.d.ts
│  │  │  │  ├─ 📄node-module-type-classifier.js
│  │  │  │  ├─ 📄node-module-type-classifier.js.map
│  │  │  │  ├─ 📄repl.d.ts
│  │  │  │  ├─ 📄repl.js
│  │  │  │  ├─ 📄repl.js.map
│  │  │  │  ├─ 📄resolver-functions.d.ts
│  │  │  │  ├─ 📄resolver-functions.js
│  │  │  │  ├─ 📄resolver-functions.js.map
│  │  │  │  ├─ 📄ts-compiler-types.d.ts
│  │  │  │  ├─ 📄ts-compiler-types.js
│  │  │  │  ├─ 📄ts-compiler-types.js.map
│  │  │  │  ├─ 📄ts-internals.d.ts
│  │  │  │  ├─ 📄ts-internals.js
│  │  │  │  ├─ 📄ts-internals.js.map
│  │  │  │  ├─ 📄ts-transpile-module.d.ts
│  │  │  │  ├─ 📄ts-transpile-module.js
│  │  │  │  ├─ 📄ts-transpile-module.js.map
│  │  │  │  ├─ 📄tsconfig-schema.d.ts
│  │  │  │  ├─ 📄tsconfig-schema.js
│  │  │  │  ├─ 📄tsconfig-schema.js.map
│  │  │  │  ├─ 📄tsconfigs.d.ts
│  │  │  │  ├─ 📄tsconfigs.js
│  │  │  │  ├─ 📄tsconfigs.js.map
│  │  │  │  ├─ 📄util.d.ts
│  │  │  │  ├─ 📄util.js
│  │  │  │  └─ 📄util.js.map
│  │  │  ├─ 📁dist-raw
│  │  │  │  ├─ 📄NODE-LICENSE.md
│  │  │  │  ├─ 📄README.md
│  │  │  │  ├─ 📄node-internal-constants.js
│  │  │  │  ├─ 📄node-internal-errors.js
│  │  │  │  ├─ 📄node-internal-modules-cjs-helpers.js
│  │  │  │  ├─ 📄node-internal-modules-cjs-loader.js
│  │  │  │  ├─ 📄node-internal-modules-esm-get_format.js
│  │  │  │  ├─ 📄node-internal-modules-esm-resolve.js
│  │  │  │  ├─ 📄node-internal-modules-package_json_reader.js
│  │  │  │  ├─ 📄node-internal-repl-await.js
│  │  │  │  ├─ 📄node-internalBinding-fs.js
│  │  │  │  ├─ 📄node-nativemodule.js
│  │  │  │  ├─ 📄node-options.js
│  │  │  │  ├─ 📄node-primordials.js
│  │  │  │  └─ 📄runmain-hack.js
│  │  │  ├─ 📁esm
│  │  │  │  └─ 📄transpile-only.mjs
│  │  │  ├─ 📁node10
│  │  │  │  └─ 📄tsconfig.json
│  │  │  ├─ 📁node12
│  │  │  │  └─ 📄tsconfig.json
│  │  │  ├─ 📁node14
│  │  │  │  └─ 📄tsconfig.json
│  │  │  ├─ 📁node16
│  │  │  │  └─ 📄tsconfig.json
│  │  │  ├─ 📁register
│  │  │  │  ├─ 📄files.js
│  │  │  │  ├─ 📄index.js
│  │  │  │  ├─ 📄transpile-only.js
│  │  │  │  └─ 📄type-check.js
│  │  │  ├─ 📁transpilers
│  │  │  │  ├─ 📄swc-experimental.js
│  │  │  │  └─ 📄swc.js
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄child-loader.mjs
│  │  │  ├─ 📄esm.mjs
│  │  │  ├─ 📄package.json
│  │  │  ├─ 📄tsconfig.schema.json
│  │  │  └─ 📄tsconfig.schemastore-schema.json
│  │  ├─ 📁ts-node-dev
│  │  │  ├─ 📁icons
│  │  │  │  ├─ 📄node_error.png
│  │  │  │  └─ 📄node_info.png
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📄bin.js
│  │  │  │  ├─ 📄cfg.js
│  │  │  │  ├─ 📄check-file-exists.js
│  │  │  │  ├─ 📄child-require-hook.js
│  │  │  │  ├─ 📄compiler.js
│  │  │  │  ├─ 📄dedupe.js
│  │  │  │  ├─ 📄get-compiled-path.js
│  │  │  │  ├─ 📄get-cwd.js
│  │  │  │  ├─ 📄hook.js
│  │  │  │  ├─ 📄index.js
│  │  │  │  ├─ 📄ipc.js
│  │  │  │  ├─ 📄log.js
│  │  │  │  ├─ 📄notify.js
│  │  │  │  ├─ 📄resolveMain.js
│  │  │  │  └─ 📄wrap.js
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  └─ 📄package.json
│  │  ├─ 📁tsconfig
│  │  │  ├─ 📁dist
│  │  │  │  ├─ 📄tsconfig.d.ts
│  │  │  │  ├─ 📄tsconfig.js
│  │  │  │  ├─ 📄tsconfig.js.map
│  │  │  │  ├─ 📄tsconfig.spec.d.ts
│  │  │  │  ├─ 📄tsconfig.spec.js
│  │  │  │  └─ 📄tsconfig.spec.js.map
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  └─ 📄package.json
│  │  ├─ 📁type-is
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁typedarray
│  │  │  ├─ 📁example
│  │  │  │  └─ 📄tarray.js
│  │  │  ├─ 📁test
│  │  │  │  ├─ 📁server
│  │  │  │  │  └─ 📄undef_globals.js
│  │  │  │  └─ 📄tarray.js
│  │  │  ├─ 📄.travis.yml
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄readme.markdown
│  │  ├─ 📁typescript
│  │  │  ├─ 📁bin
│  │  │  │  ├─ 📄tsc
│  │  │  │  └─ 📄tsserver
│  │  │  ├─ 📁lib
│  │  │  │  ├─ 📁cs
│  │  │  │  │  └─ 📄diagnosticMessages.generated.json
│  │  │  │  ├─ 📁de
│  │  │  │  │  └─ 📄diagnosticMessages.generated.json
│  │  │  │  ├─ 📁es
│  │  │  │  │  └─ 📄diagnosticMessages.generated.json
│  │  │  │  ├─ 📁fr
│  │  │  │  │  └─ 📄diagnosticMessages.generated.json
│  │  │  │  ├─ 📁it
│  │  │  │  │  └─ 📄diagnosticMessages.generated.json
│  │  │  │  ├─ 📁ja
│  │  │  │  │  └─ 📄diagnosticMessages.generated.json
│  │  │  │  ├─ 📁ko
│  │  │  │  │  └─ 📄diagnosticMessages.generated.json
│  │  │  │  ├─ 📁pl
│  │  │  │  │  └─ 📄diagnosticMessages.generated.json
│  │  │  │  ├─ 📁pt-br
│  │  │  │  │  └─ 📄diagnosticMessages.generated.json
│  │  │  │  ├─ 📁ru
│  │  │  │  │  └─ 📄diagnosticMessages.generated.json
│  │  │  │  ├─ 📁tr
│  │  │  │  │  └─ 📄diagnosticMessages.generated.json
│  │  │  │  ├─ 📁zh-cn
│  │  │  │  │  └─ 📄diagnosticMessages.generated.json
│  │  │  │  ├─ 📁zh-tw
│  │  │  │  │  └─ 📄diagnosticMessages.generated.json
│  │  │  │  ├─ 📄_tsc.js
│  │  │  │  ├─ 📄_tsserver.js
│  │  │  │  ├─ 📄_typingsInstaller.js
│  │  │  │  ├─ 📄lib.d.ts
│  │  │  │  ├─ 📄lib.decorators.d.ts
│  │  │  │  ├─ 📄lib.decorators.legacy.d.ts
│  │  │  │  ├─ 📄lib.dom.asynciterable.d.ts
│  │  │  │  ├─ 📄lib.dom.d.ts
│  │  │  │  ├─ 📄lib.dom.iterable.d.ts
│  │  │  │  ├─ 📄lib.es2015.collection.d.ts
│  │  │  │  ├─ 📄lib.es2015.core.d.ts
│  │  │  │  ├─ 📄lib.es2015.d.ts
│  │  │  │  ├─ 📄lib.es2015.generator.d.ts
│  │  │  │  ├─ 📄lib.es2015.iterable.d.ts
│  │  │  │  ├─ 📄lib.es2015.promise.d.ts
│  │  │  │  ├─ 📄lib.es2015.proxy.d.ts
│  │  │  │  ├─ 📄lib.es2015.reflect.d.ts
│  │  │  │  ├─ 📄lib.es2015.symbol.d.ts
│  │  │  │  ├─ 📄lib.es2015.symbol.wellknown.d.ts
│  │  │  │  ├─ 📄lib.es2016.array.include.d.ts
│  │  │  │  ├─ 📄lib.es2016.d.ts
│  │  │  │  ├─ 📄lib.es2016.full.d.ts
│  │  │  │  ├─ 📄lib.es2016.intl.d.ts
│  │  │  │  ├─ 📄lib.es2017.arraybuffer.d.ts
│  │  │  │  ├─ 📄lib.es2017.d.ts
│  │  │  │  ├─ 📄lib.es2017.date.d.ts
│  │  │  │  ├─ 📄lib.es2017.full.d.ts
│  │  │  │  ├─ 📄lib.es2017.intl.d.ts
│  │  │  │  ├─ 📄lib.es2017.object.d.ts
│  │  │  │  ├─ 📄lib.es2017.sharedmemory.d.ts
│  │  │  │  ├─ 📄lib.es2017.string.d.ts
│  │  │  │  ├─ 📄lib.es2017.typedarrays.d.ts
│  │  │  │  ├─ 📄lib.es2018.asyncgenerator.d.ts
│  │  │  │  ├─ 📄lib.es2018.asynciterable.d.ts
│  │  │  │  ├─ 📄lib.es2018.d.ts
│  │  │  │  ├─ 📄lib.es2018.full.d.ts
│  │  │  │  ├─ 📄lib.es2018.intl.d.ts
│  │  │  │  ├─ 📄lib.es2018.promise.d.ts
│  │  │  │  ├─ 📄lib.es2018.regexp.d.ts
│  │  │  │  ├─ 📄lib.es2019.array.d.ts
│  │  │  │  ├─ 📄lib.es2019.d.ts
│  │  │  │  ├─ 📄lib.es2019.full.d.ts
│  │  │  │  ├─ 📄lib.es2019.intl.d.ts
│  │  │  │  ├─ 📄lib.es2019.object.d.ts
│  │  │  │  ├─ 📄lib.es2019.string.d.ts
│  │  │  │  ├─ 📄lib.es2019.symbol.d.ts
│  │  │  │  ├─ 📄lib.es2020.bigint.d.ts
│  │  │  │  ├─ 📄lib.es2020.d.ts
│  │  │  │  ├─ 📄lib.es2020.date.d.ts
│  │  │  │  ├─ 📄lib.es2020.full.d.ts
│  │  │  │  ├─ 📄lib.es2020.intl.d.ts
│  │  │  │  ├─ 📄lib.es2020.number.d.ts
│  │  │  │  ├─ 📄lib.es2020.promise.d.ts
│  │  │  │  ├─ 📄lib.es2020.sharedmemory.d.ts
│  │  │  │  ├─ 📄lib.es2020.string.d.ts
│  │  │  │  ├─ 📄lib.es2020.symbol.wellknown.d.ts
│  │  │  │  ├─ 📄lib.es2021.d.ts
│  │  │  │  ├─ 📄lib.es2021.full.d.ts
│  │  │  │  ├─ 📄lib.es2021.intl.d.ts
│  │  │  │  ├─ 📄lib.es2021.promise.d.ts
│  │  │  │  ├─ 📄lib.es2021.string.d.ts
│  │  │  │  ├─ 📄lib.es2021.weakref.d.ts
│  │  │  │  ├─ 📄lib.es2022.array.d.ts
│  │  │  │  ├─ 📄lib.es2022.d.ts
│  │  │  │  ├─ 📄lib.es2022.error.d.ts
│  │  │  │  ├─ 📄lib.es2022.full.d.ts
│  │  │  │  ├─ 📄lib.es2022.intl.d.ts
│  │  │  │  ├─ 📄lib.es2022.object.d.ts
│  │  │  │  ├─ 📄lib.es2022.regexp.d.ts
│  │  │  │  ├─ 📄lib.es2022.string.d.ts
│  │  │  │  ├─ 📄lib.es2023.array.d.ts
│  │  │  │  ├─ 📄lib.es2023.collection.d.ts
│  │  │  │  ├─ 📄lib.es2023.d.ts
│  │  │  │  ├─ 📄lib.es2023.full.d.ts
│  │  │  │  ├─ 📄lib.es2023.intl.d.ts
│  │  │  │  ├─ 📄lib.es2024.arraybuffer.d.ts
│  │  │  │  ├─ 📄lib.es2024.collection.d.ts
│  │  │  │  ├─ 📄lib.es2024.d.ts
│  │  │  │  ├─ 📄lib.es2024.full.d.ts
│  │  │  │  ├─ 📄lib.es2024.object.d.ts
│  │  │  │  ├─ 📄lib.es2024.promise.d.ts
│  │  │  │  ├─ 📄lib.es2024.regexp.d.ts
│  │  │  │  ├─ 📄lib.es2024.sharedmemory.d.ts
│  │  │  │  ├─ 📄lib.es2024.string.d.ts
│  │  │  │  ├─ 📄lib.es5.d.ts
│  │  │  │  ├─ 📄lib.es6.d.ts
│  │  │  │  ├─ 📄lib.esnext.array.d.ts
│  │  │  │  ├─ 📄lib.esnext.collection.d.ts
│  │  │  │  ├─ 📄lib.esnext.d.ts
│  │  │  │  ├─ 📄lib.esnext.decorators.d.ts
│  │  │  │  ├─ 📄lib.esnext.disposable.d.ts
│  │  │  │  ├─ 📄lib.esnext.float16.d.ts
│  │  │  │  ├─ 📄lib.esnext.full.d.ts
│  │  │  │  ├─ 📄lib.esnext.intl.d.ts
│  │  │  │  ├─ 📄lib.esnext.iterator.d.ts
│  │  │  │  ├─ 📄lib.esnext.promise.d.ts
│  │  │  │  ├─ 📄lib.scripthost.d.ts
│  │  │  │  ├─ 📄lib.webworker.asynciterable.d.ts
│  │  │  │  ├─ 📄lib.webworker.d.ts
│  │  │  │  ├─ 📄lib.webworker.importscripts.d.ts
│  │  │  │  ├─ 📄lib.webworker.iterable.d.ts
│  │  │  │  ├─ 📄tsc.js
│  │  │  │  ├─ 📄tsserver.js
│  │  │  │  ├─ 📄tsserverlibrary.d.ts
│  │  │  │  ├─ 📄tsserverlibrary.js
│  │  │  │  ├─ 📄typesMap.json
│  │  │  │  ├─ 📄typescript.d.ts
│  │  │  │  ├─ 📄typescript.js
│  │  │  │  ├─ 📄typingsInstaller.js
│  │  │  │  └─ 📄watchGuard.js
│  │  │  ├─ 📄LICENSE.txt
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄SECURITY.md
│  │  │  ├─ 📄ThirdPartyNoticeText.txt
│  │  │  └─ 📄package.json
│  │  ├─ 📁undici-types
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄agent.d.ts
│  │  │  ├─ 📄api.d.ts
│  │  │  ├─ 📄balanced-pool.d.ts
│  │  │  ├─ 📄cache-interceptor.d.ts
│  │  │  ├─ 📄cache.d.ts
│  │  │  ├─ 📄client.d.ts
│  │  │  ├─ 📄connector.d.ts
│  │  │  ├─ 📄content-type.d.ts
│  │  │  ├─ 📄cookies.d.ts
│  │  │  ├─ 📄diagnostics-channel.d.ts
│  │  │  ├─ 📄dispatcher.d.ts
│  │  │  ├─ 📄env-http-proxy-agent.d.ts
│  │  │  ├─ 📄errors.d.ts
│  │  │  ├─ 📄eventsource.d.ts
│  │  │  ├─ 📄fetch.d.ts
│  │  │  ├─ 📄formdata.d.ts
│  │  │  ├─ 📄global-dispatcher.d.ts
│  │  │  ├─ 📄global-origin.d.ts
│  │  │  ├─ 📄h2c-client.d.ts
│  │  │  ├─ 📄handlers.d.ts
│  │  │  ├─ 📄header.d.ts
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄interceptors.d.ts
│  │  │  ├─ 📄mock-agent.d.ts
│  │  │  ├─ 📄mock-call-history.d.ts
│  │  │  ├─ 📄mock-client.d.ts
│  │  │  ├─ 📄mock-errors.d.ts
│  │  │  ├─ 📄mock-interceptor.d.ts
│  │  │  ├─ 📄mock-pool.d.ts
│  │  │  ├─ 📄package.json
│  │  │  ├─ 📄patch.d.ts
│  │  │  ├─ 📄pool-stats.d.ts
│  │  │  ├─ 📄pool.d.ts
│  │  │  ├─ 📄proxy-agent.d.ts
│  │  │  ├─ 📄readable.d.ts
│  │  │  ├─ 📄retry-agent.d.ts
│  │  │  ├─ 📄retry-handler.d.ts
│  │  │  ├─ 📄util.d.ts
│  │  │  ├─ 📄utility.d.ts
│  │  │  ├─ 📄webidl.d.ts
│  │  │  └─ 📄websocket.d.ts
│  │  ├─ 📁unpipe
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁util-deprecate
│  │  │  ├─ 📄History.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄browser.js
│  │  │  ├─ 📄node.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁v8-compile-cache-lib
│  │  │  ├─ 📄CHANGELOG.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄package.json
│  │  │  ├─ 📄v8-compile-cache.d.ts
│  │  │  └─ 📄v8-compile-cache.js
│  │  ├─ 📁vary
│  │  │  ├─ 📄HISTORY.md
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  ├─ 📁wrappy
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄wrappy.js
│  │  ├─ 📁xtend
│  │  │  ├─ 📄.jshintrc
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄immutable.js
│  │  │  ├─ 📄mutable.js
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄test.js
│  │  ├─ 📁yn
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  ├─ 📄lenient.js
│  │  │  ├─ 📄license
│  │  │  ├─ 📄package.json
│  │  │  └─ 📄readme.md
│  │  ├─ 📁zod
│  │  │  ├─ 📁locales
│  │  │  │  ├─ 📄index.cjs
│  │  │  │  ├─ 📄index.d.cts
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📁mini
│  │  │  │  ├─ 📄index.cjs
│  │  │  │  ├─ 📄index.d.cts
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📁src
│  │  │  │  ├─ 📁locales
│  │  │  │  │  └─ 📄index.ts
│  │  │  │  ├─ 📁mini
│  │  │  │  │  └─ 📄index.ts
│  │  │  │  ├─ 📁v3
│  │  │  │  │  ├─ 📁benchmarks
│  │  │  │  │  │  ├─ 📄datetime.ts
│  │  │  │  │  │  ├─ 📄discriminatedUnion.ts
│  │  │  │  │  │  ├─ 📄index.ts
│  │  │  │  │  │  ├─ 📄ipv4.ts
│  │  │  │  │  │  ├─ 📄object.ts
│  │  │  │  │  │  ├─ 📄primitives.ts
│  │  │  │  │  │  ├─ 📄realworld.ts
│  │  │  │  │  │  ├─ 📄string.ts
│  │  │  │  │  │  └─ 📄union.ts
│  │  │  │  │  ├─ 📁helpers
│  │  │  │  │  │  ├─ 📄enumUtil.ts
│  │  │  │  │  │  ├─ 📄errorUtil.ts
│  │  │  │  │  │  ├─ 📄parseUtil.ts
│  │  │  │  │  │  ├─ 📄partialUtil.ts
│  │  │  │  │  │  ├─ 📄typeAliases.ts
│  │  │  │  │  │  └─ 📄util.ts
│  │  │  │  │  ├─ 📁locales
│  │  │  │  │  │  └─ 📄en.ts
│  │  │  │  │  ├─ 📁tests
│  │  │  │  │  │  ├─ 📄Mocker.ts
│  │  │  │  │  │  ├─ 📄all-errors.test.ts
│  │  │  │  │  │  ├─ 📄anyunknown.test.ts
│  │  │  │  │  │  ├─ 📄array.test.ts
│  │  │  │  │  │  ├─ 📄async-parsing.test.ts
│  │  │  │  │  │  ├─ 📄async-refinements.test.ts
│  │  │  │  │  │  ├─ 📄base.test.ts
│  │  │  │  │  │  ├─ 📄bigint.test.ts
│  │  │  │  │  │  ├─ 📄branded.test.ts
│  │  │  │  │  │  ├─ 📄catch.test.ts
│  │  │  │  │  │  ├─ 📄coerce.test.ts
│  │  │  │  │  │  ├─ 📄complex.test.ts
│  │  │  │  │  │  ├─ 📄custom.test.ts
│  │  │  │  │  │  ├─ 📄date.test.ts
│  │  │  │  │  │  ├─ 📄deepmasking.test.ts
│  │  │  │  │  │  ├─ 📄default.test.ts
│  │  │  │  │  │  ├─ 📄description.test.ts
│  │  │  │  │  │  ├─ 📄discriminated-unions.test.ts
│  │  │  │  │  │  ├─ 📄enum.test.ts
│  │  │  │  │  │  ├─ 📄error.test.ts
│  │  │  │  │  │  ├─ 📄firstparty.test.ts
│  │  │  │  │  │  ├─ 📄firstpartyschematypes.test.ts
│  │  │  │  │  │  ├─ 📄function.test.ts
│  │  │  │  │  │  ├─ 📄generics.test.ts
│  │  │  │  │  │  ├─ 📄instanceof.test.ts
│  │  │  │  │  │  ├─ 📄intersection.test.ts
│  │  │  │  │  │  ├─ 📄language-server.source.ts
│  │  │  │  │  │  ├─ 📄language-server.test.ts
│  │  │  │  │  │  ├─ 📄literal.test.ts
│  │  │  │  │  │  ├─ 📄map.test.ts
│  │  │  │  │  │  ├─ 📄masking.test.ts
│  │  │  │  │  │  ├─ 📄mocker.test.ts
│  │  │  │  │  │  ├─ 📄nan.test.ts
│  │  │  │  │  │  ├─ 📄nativeEnum.test.ts
│  │  │  │  │  │  ├─ 📄nullable.test.ts
│  │  │  │  │  │  ├─ 📄number.test.ts
│  │  │  │  │  │  ├─ 📄object-augmentation.test.ts
│  │  │  │  │  │  ├─ 📄object-in-es5-env.test.ts
│  │  │  │  │  │  ├─ 📄object.test.ts
│  │  │  │  │  │  ├─ 📄optional.test.ts
│  │  │  │  │  │  ├─ 📄parseUtil.test.ts
│  │  │  │  │  │  ├─ 📄parser.test.ts
│  │  │  │  │  │  ├─ 📄partials.test.ts
│  │  │  │  │  │  ├─ 📄pickomit.test.ts
│  │  │  │  │  │  ├─ 📄pipeline.test.ts
│  │  │  │  │  │  ├─ 📄preprocess.test.ts
│  │  │  │  │  │  ├─ 📄primitive.test.ts
│  │  │  │  │  │  ├─ 📄promise.test.ts
│  │  │  │  │  │  ├─ 📄readonly.test.ts
│  │  │  │  │  │  ├─ 📄record.test.ts
│  │  │  │  │  │  ├─ 📄recursive.test.ts
│  │  │  │  │  │  ├─ 📄refine.test.ts
│  │  │  │  │  │  ├─ 📄safeparse.test.ts
│  │  │  │  │  │  ├─ 📄set.test.ts
│  │  │  │  │  │  ├─ 📄standard-schema.test.ts
│  │  │  │  │  │  ├─ 📄string.test.ts
│  │  │  │  │  │  ├─ 📄transformer.test.ts
│  │  │  │  │  │  ├─ 📄tuple.test.ts
│  │  │  │  │  │  ├─ 📄unions.test.ts
│  │  │  │  │  │  ├─ 📄validations.test.ts
│  │  │  │  │  │  └─ 📄void.test.ts
│  │  │  │  │  ├─ 📄ZodError.ts
│  │  │  │  │  ├─ 📄errors.ts
│  │  │  │  │  ├─ 📄external.ts
│  │  │  │  │  ├─ 📄index.ts
│  │  │  │  │  ├─ 📄standard-schema.ts
│  │  │  │  │  └─ 📄types.ts
│  │  │  │  ├─ 📁v4
│  │  │  │  │  ├─ 📁classic
│  │  │  │  │  │  ├─ 📁tests
│  │  │  │  │  │  │  ├─ 📄anyunknown.test.ts
│  │  │  │  │  │  │  ├─ 📄array.test.ts
│  │  │  │  │  │  │  ├─ 📄assignability.test.ts
│  │  │  │  │  │  │  ├─ 📄async-parsing.test.ts
│  │  │  │  │  │  │  ├─ 📄async-refinements.test.ts
│  │  │  │  │  │  │  ├─ 📄base.test.ts
│  │  │  │  │  │  │  ├─ 📄bigint.test.ts
│  │  │  │  │  │  │  ├─ 📄brand.test.ts
│  │  │  │  │  │  │  ├─ 📄catch.test.ts
│  │  │  │  │  │  │  ├─ 📄coalesce.test.ts
│  │  │  │  │  │  │  ├─ 📄coerce.test.ts
│  │  │  │  │  │  │  ├─ 📄continuability.test.ts
│  │  │  │  │  │  │  ├─ 📄custom.test.ts
│  │  │  │  │  │  │  ├─ 📄date.test.ts
│  │  │  │  │  │  │  ├─ 📄datetime.test.ts
│  │  │  │  │  │  │  ├─ 📄default.test.ts
│  │  │  │  │  │  │  ├─ 📄description.test.ts
│  │  │  │  │  │  │  ├─ 📄discriminated-unions.test.ts
│  │  │  │  │  │  │  ├─ 📄enum.test.ts
│  │  │  │  │  │  │  ├─ 📄error-utils.test.ts
│  │  │  │  │  │  │  ├─ 📄error.test.ts
│  │  │  │  │  │  │  ├─ 📄file.test.ts
│  │  │  │  │  │  │  ├─ 📄firstparty.test.ts
│  │  │  │  │  │  │  ├─ 📄function.test.ts
│  │  │  │  │  │  │  ├─ 📄generics.test.ts
│  │  │  │  │  │  │  ├─ 📄index.test.ts
│  │  │  │  │  │  │  ├─ 📄instanceof.test.ts
│  │  │  │  │  │  │  ├─ 📄intersection.test.ts
│  │  │  │  │  │  │  ├─ 📄json.test.ts
│  │  │  │  │  │  │  ├─ 📄lazy.test.ts
│  │  │  │  │  │  │  ├─ 📄literal.test.ts
│  │  │  │  │  │  │  ├─ 📄map.test.ts
│  │  │  │  │  │  │  ├─ 📄nan.test.ts
│  │  │  │  │  │  │  ├─ 📄nested-refine.test.ts
│  │  │  │  │  │  │  ├─ 📄nonoptional.test.ts
│  │  │  │  │  │  │  ├─ 📄nullable.test.ts
│  │  │  │  │  │  │  ├─ 📄number.test.ts
│  │  │  │  │  │  │  ├─ 📄object.test.ts
│  │  │  │  │  │  │  ├─ 📄optional.test.ts
│  │  │  │  │  │  │  ├─ 📄partial.test.ts
│  │  │  │  │  │  │  ├─ 📄pickomit.test.ts
│  │  │  │  │  │  │  ├─ 📄pipe.test.ts
│  │  │  │  │  │  │  ├─ 📄prefault.test.ts
│  │  │  │  │  │  │  ├─ 📄preprocess.test.ts
│  │  │  │  │  │  │  ├─ 📄primitive.test.ts
│  │  │  │  │  │  │  ├─ 📄promise.test.ts
│  │  │  │  │  │  │  ├─ 📄prototypes.test.ts
│  │  │  │  │  │  │  ├─ 📄readonly.test.ts
│  │  │  │  │  │  │  ├─ 📄record.test.ts
│  │  │  │  │  │  │  ├─ 📄recursive-types.test.ts
│  │  │  │  │  │  │  ├─ 📄refine.test.ts
│  │  │  │  │  │  │  ├─ 📄registries.test.ts
│  │  │  │  │  │  │  ├─ 📄set.test.ts
│  │  │  │  │  │  │  ├─ 📄standard-schema.test.ts
│  │  │  │  │  │  │  ├─ 📄string-formats.test.ts
│  │  │  │  │  │  │  ├─ 📄string.test.ts
│  │  │  │  │  │  │  ├─ 📄stringbool.test.ts
│  │  │  │  │  │  │  ├─ 📄template-literal.test.ts
│  │  │  │  │  │  │  ├─ 📄to-json-schema.test.ts
│  │  │  │  │  │  │  ├─ 📄transform.test.ts
│  │  │  │  │  │  │  ├─ 📄tuple.test.ts
│  │  │  │  │  │  │  ├─ 📄union.test.ts
│  │  │  │  │  │  │  ├─ 📄validations.test.ts
│  │  │  │  │  │  │  └─ 📄void.test.ts
│  │  │  │  │  │  ├─ 📄checks.ts
│  │  │  │  │  │  ├─ 📄coerce.ts
│  │  │  │  │  │  ├─ 📄compat.ts
│  │  │  │  │  │  ├─ 📄errors.ts
│  │  │  │  │  │  ├─ 📄external.ts
│  │  │  │  │  │  ├─ 📄index.ts
│  │  │  │  │  │  ├─ 📄iso.ts
│  │  │  │  │  │  ├─ 📄parse.ts
│  │  │  │  │  │  └─ 📄schemas.ts
│  │  │  │  │  ├─ 📁core
│  │  │  │  │  │  ├─ 📁tests
│  │  │  │  │  │  │  ├─ 📁locales
│  │  │  │  │  │  │  │  ├─ 📄be.test.ts
│  │  │  │  │  │  │  │  ├─ 📄en.test.ts
│  │  │  │  │  │  │  │  ├─ 📄ru.test.ts
│  │  │  │  │  │  │  │  └─ 📄tr.test.ts
│  │  │  │  │  │  │  ├─ 📄extend.test.ts
│  │  │  │  │  │  │  └─ 📄index.test.ts
│  │  │  │  │  │  ├─ 📄api.ts
│  │  │  │  │  │  ├─ 📄checks.ts
│  │  │  │  │  │  ├─ 📄config.ts
│  │  │  │  │  │  ├─ 📄core.ts
│  │  │  │  │  │  ├─ 📄doc.ts
│  │  │  │  │  │  ├─ 📄errors.ts
│  │  │  │  │  │  ├─ 📄function.ts
│  │  │  │  │  │  ├─ 📄index.ts
│  │  │  │  │  │  ├─ 📄json-schema.ts
│  │  │  │  │  │  ├─ 📄parse.ts
│  │  │  │  │  │  ├─ 📄regexes.ts
│  │  │  │  │  │  ├─ 📄registries.ts
│  │  │  │  │  │  ├─ 📄schemas.ts
│  │  │  │  │  │  ├─ 📄standard-schema.ts
│  │  │  │  │  │  ├─ 📄to-json-schema.ts
│  │  │  │  │  │  ├─ 📄util.ts
│  │  │  │  │  │  ├─ 📄versions.ts
│  │  │  │  │  │  └─ 📄zsf.ts
│  │  │  │  │  ├─ 📁locales
│  │  │  │  │  │  ├─ 📄ar.ts
│  │  │  │  │  │  ├─ 📄az.ts
│  │  │  │  │  │  ├─ 📄be.ts
│  │  │  │  │  │  ├─ 📄bg.ts
│  │  │  │  │  │  ├─ 📄ca.ts
│  │  │  │  │  │  ├─ 📄cs.ts
│  │  │  │  │  │  ├─ 📄da.ts
│  │  │  │  │  │  ├─ 📄de.ts
│  │  │  │  │  │  ├─ 📄en.ts
│  │  │  │  │  │  ├─ 📄eo.ts
│  │  │  │  │  │  ├─ 📄es.ts
│  │  │  │  │  │  ├─ 📄fa.ts
│  │  │  │  │  │  ├─ 📄fi.ts
│  │  │  │  │  │  ├─ 📄fr-CA.ts
│  │  │  │  │  │  ├─ 📄fr.ts
│  │  │  │  │  │  ├─ 📄he.ts
│  │  │  │  │  │  ├─ 📄hu.ts
│  │  │  │  │  │  ├─ 📄id.ts
│  │  │  │  │  │  ├─ 📄index.ts
│  │  │  │  │  │  ├─ 📄is.ts
│  │  │  │  │  │  ├─ 📄it.ts
│  │  │  │  │  │  ├─ 📄ja.ts
│  │  │  │  │  │  ├─ 📄kh.ts
│  │  │  │  │  │  ├─ 📄ko.ts
│  │  │  │  │  │  ├─ 📄mk.ts
│  │  │  │  │  │  ├─ 📄ms.ts
│  │  │  │  │  │  ├─ 📄nl.ts
│  │  │  │  │  │  ├─ 📄no.ts
│  │  │  │  │  │  ├─ 📄ota.ts
│  │  │  │  │  │  ├─ 📄pl.ts
│  │  │  │  │  │  ├─ 📄ps.ts
│  │  │  │  │  │  ├─ 📄pt.ts
│  │  │  │  │  │  ├─ 📄ru.ts
│  │  │  │  │  │  ├─ 📄sl.ts
│  │  │  │  │  │  ├─ 📄sv.ts
│  │  │  │  │  │  ├─ 📄ta.ts
│  │  │  │  │  │  ├─ 📄th.ts
│  │  │  │  │  │  ├─ 📄tr.ts
│  │  │  │  │  │  ├─ 📄ua.ts
│  │  │  │  │  │  ├─ 📄ur.ts
│  │  │  │  │  │  ├─ 📄vi.ts
│  │  │  │  │  │  ├─ 📄yo.ts
│  │  │  │  │  │  ├─ 📄zh-CN.ts
│  │  │  │  │  │  └─ 📄zh-TW.ts
│  │  │  │  │  ├─ 📁mini
│  │  │  │  │  │  ├─ 📁tests
│  │  │  │  │  │  │  ├─ 📄assignability.test.ts
│  │  │  │  │  │  │  ├─ 📄brand.test.ts
│  │  │  │  │  │  │  ├─ 📄checks.test.ts
│  │  │  │  │  │  │  ├─ 📄computed.test.ts
│  │  │  │  │  │  │  ├─ 📄error.test.ts
│  │  │  │  │  │  │  ├─ 📄functions.test.ts
│  │  │  │  │  │  │  ├─ 📄index.test.ts
│  │  │  │  │  │  │  ├─ 📄number.test.ts
│  │  │  │  │  │  │  ├─ 📄object.test.ts
│  │  │  │  │  │  │  ├─ 📄prototypes.test.ts
│  │  │  │  │  │  │  ├─ 📄recursive-types.test.ts
│  │  │  │  │  │  │  └─ 📄string.test.ts
│  │  │  │  │  │  ├─ 📄checks.ts
│  │  │  │  │  │  ├─ 📄coerce.ts
│  │  │  │  │  │  ├─ 📄external.ts
│  │  │  │  │  │  ├─ 📄index.ts
│  │  │  │  │  │  ├─ 📄iso.ts
│  │  │  │  │  │  ├─ 📄parse.ts
│  │  │  │  │  │  └─ 📄schemas.ts
│  │  │  │  │  └─ 📄index.ts
│  │  │  │  ├─ 📁v4-mini
│  │  │  │  │  └─ 📄index.ts
│  │  │  │  └─ 📄index.ts
│  │  │  ├─ 📁v3
│  │  │  │  ├─ 📁helpers
│  │  │  │  │  ├─ 📄enumUtil.cjs
│  │  │  │  │  ├─ 📄enumUtil.d.cts
│  │  │  │  │  ├─ 📄enumUtil.d.ts
│  │  │  │  │  ├─ 📄enumUtil.js
│  │  │  │  │  ├─ 📄errorUtil.cjs
│  │  │  │  │  ├─ 📄errorUtil.d.cts
│  │  │  │  │  ├─ 📄errorUtil.d.ts
│  │  │  │  │  ├─ 📄errorUtil.js
│  │  │  │  │  ├─ 📄parseUtil.cjs
│  │  │  │  │  ├─ 📄parseUtil.d.cts
│  │  │  │  │  ├─ 📄parseUtil.d.ts
│  │  │  │  │  ├─ 📄parseUtil.js
│  │  │  │  │  ├─ 📄partialUtil.cjs
│  │  │  │  │  ├─ 📄partialUtil.d.cts
│  │  │  │  │  ├─ 📄partialUtil.d.ts
│  │  │  │  │  ├─ 📄partialUtil.js
│  │  │  │  │  ├─ 📄typeAliases.cjs
│  │  │  │  │  ├─ 📄typeAliases.d.cts
│  │  │  │  │  ├─ 📄typeAliases.d.ts
│  │  │  │  │  ├─ 📄typeAliases.js
│  │  │  │  │  ├─ 📄util.cjs
│  │  │  │  │  ├─ 📄util.d.cts
│  │  │  │  │  ├─ 📄util.d.ts
│  │  │  │  │  └─ 📄util.js
│  │  │  │  ├─ 📁locales
│  │  │  │  │  ├─ 📄en.cjs
│  │  │  │  │  ├─ 📄en.d.cts
│  │  │  │  │  ├─ 📄en.d.ts
│  │  │  │  │  └─ 📄en.js
│  │  │  │  ├─ 📄ZodError.cjs
│  │  │  │  ├─ 📄ZodError.d.cts
│  │  │  │  ├─ 📄ZodError.d.ts
│  │  │  │  ├─ 📄ZodError.js
│  │  │  │  ├─ 📄errors.cjs
│  │  │  │  ├─ 📄errors.d.cts
│  │  │  │  ├─ 📄errors.d.ts
│  │  │  │  ├─ 📄errors.js
│  │  │  │  ├─ 📄external.cjs
│  │  │  │  ├─ 📄external.d.cts
│  │  │  │  ├─ 📄external.d.ts
│  │  │  │  ├─ 📄external.js
│  │  │  │  ├─ 📄index.cjs
│  │  │  │  ├─ 📄index.d.cts
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  ├─ 📄index.js
│  │  │  │  ├─ 📄standard-schema.cjs
│  │  │  │  ├─ 📄standard-schema.d.cts
│  │  │  │  ├─ 📄standard-schema.d.ts
│  │  │  │  ├─ 📄standard-schema.js
│  │  │  │  ├─ 📄types.cjs
│  │  │  │  ├─ 📄types.d.cts
│  │  │  │  ├─ 📄types.d.ts
│  │  │  │  └─ 📄types.js
│  │  │  ├─ 📁v4
│  │  │  │  ├─ 📁classic
│  │  │  │  │  ├─ 📄checks.cjs
│  │  │  │  │  ├─ 📄checks.d.cts
│  │  │  │  │  ├─ 📄checks.d.ts
│  │  │  │  │  ├─ 📄checks.js
│  │  │  │  │  ├─ 📄coerce.cjs
│  │  │  │  │  ├─ 📄coerce.d.cts
│  │  │  │  │  ├─ 📄coerce.d.ts
│  │  │  │  │  ├─ 📄coerce.js
│  │  │  │  │  ├─ 📄compat.cjs
│  │  │  │  │  ├─ 📄compat.d.cts
│  │  │  │  │  ├─ 📄compat.d.ts
│  │  │  │  │  ├─ 📄compat.js
│  │  │  │  │  ├─ 📄errors.cjs
│  │  │  │  │  ├─ 📄errors.d.cts
│  │  │  │  │  ├─ 📄errors.d.ts
│  │  │  │  │  ├─ 📄errors.js
│  │  │  │  │  ├─ 📄external.cjs
│  │  │  │  │  ├─ 📄external.d.cts
│  │  │  │  │  ├─ 📄external.d.ts
│  │  │  │  │  ├─ 📄external.js
│  │  │  │  │  ├─ 📄index.cjs
│  │  │  │  │  ├─ 📄index.d.cts
│  │  │  │  │  ├─ 📄index.d.ts
│  │  │  │  │  ├─ 📄index.js
│  │  │  │  │  ├─ 📄iso.cjs
│  │  │  │  │  ├─ 📄iso.d.cts
│  │  │  │  │  ├─ 📄iso.d.ts
│  │  │  │  │  ├─ 📄iso.js
│  │  │  │  │  ├─ 📄parse.cjs
│  │  │  │  │  ├─ 📄parse.d.cts
│  │  │  │  │  ├─ 📄parse.d.ts
│  │  │  │  │  ├─ 📄parse.js
│  │  │  │  │  ├─ 📄schemas.cjs
│  │  │  │  │  ├─ 📄schemas.d.cts
│  │  │  │  │  ├─ 📄schemas.d.ts
│  │  │  │  │  └─ 📄schemas.js
│  │  │  │  ├─ 📁core
│  │  │  │  │  ├─ 📄api.cjs
│  │  │  │  │  ├─ 📄api.d.cts
│  │  │  │  │  ├─ 📄api.d.ts
│  │  │  │  │  ├─ 📄api.js
│  │  │  │  │  ├─ 📄checks.cjs
│  │  │  │  │  ├─ 📄checks.d.cts
│  │  │  │  │  ├─ 📄checks.d.ts
│  │  │  │  │  ├─ 📄checks.js
│  │  │  │  │  ├─ 📄core.cjs
│  │  │  │  │  ├─ 📄core.d.cts
│  │  │  │  │  ├─ 📄core.d.ts
│  │  │  │  │  ├─ 📄core.js
│  │  │  │  │  ├─ 📄doc.cjs
│  │  │  │  │  ├─ 📄doc.d.cts
│  │  │  │  │  ├─ 📄doc.d.ts
│  │  │  │  │  ├─ 📄doc.js
│  │  │  │  │  ├─ 📄errors.cjs
│  │  │  │  │  ├─ 📄errors.d.cts
│  │  │  │  │  ├─ 📄errors.d.ts
│  │  │  │  │  ├─ 📄errors.js
│  │  │  │  │  ├─ 📄function.cjs
│  │  │  │  │  ├─ 📄function.d.cts
│  │  │  │  │  ├─ 📄function.d.ts
│  │  │  │  │  ├─ 📄function.js
│  │  │  │  │  ├─ 📄index.cjs
│  │  │  │  │  ├─ 📄index.d.cts
│  │  │  │  │  ├─ 📄index.d.ts
│  │  │  │  │  ├─ 📄index.js
│  │  │  │  │  ├─ 📄json-schema.cjs
│  │  │  │  │  ├─ 📄json-schema.d.cts
│  │  │  │  │  ├─ 📄json-schema.d.ts
│  │  │  │  │  ├─ 📄json-schema.js
│  │  │  │  │  ├─ 📄parse.cjs
│  │  │  │  │  ├─ 📄parse.d.cts
│  │  │  │  │  ├─ 📄parse.d.ts
│  │  │  │  │  ├─ 📄parse.js
│  │  │  │  │  ├─ 📄regexes.cjs
│  │  │  │  │  ├─ 📄regexes.d.cts
│  │  │  │  │  ├─ 📄regexes.d.ts
│  │  │  │  │  ├─ 📄regexes.js
│  │  │  │  │  ├─ 📄registries.cjs
│  │  │  │  │  ├─ 📄registries.d.cts
│  │  │  │  │  ├─ 📄registries.d.ts
│  │  │  │  │  ├─ 📄registries.js
│  │  │  │  │  ├─ 📄schemas.cjs
│  │  │  │  │  ├─ 📄schemas.d.cts
│  │  │  │  │  ├─ 📄schemas.d.ts
│  │  │  │  │  ├─ 📄schemas.js
│  │  │  │  │  ├─ 📄standard-schema.cjs
│  │  │  │  │  ├─ 📄standard-schema.d.cts
│  │  │  │  │  ├─ 📄standard-schema.d.ts
│  │  │  │  │  ├─ 📄standard-schema.js
│  │  │  │  │  ├─ 📄to-json-schema.cjs
│  │  │  │  │  ├─ 📄to-json-schema.d.cts
│  │  │  │  │  ├─ 📄to-json-schema.d.ts
│  │  │  │  │  ├─ 📄to-json-schema.js
│  │  │  │  │  ├─ 📄util.cjs
│  │  │  │  │  ├─ 📄util.d.cts
│  │  │  │  │  ├─ 📄util.d.ts
│  │  │  │  │  ├─ 📄util.js
│  │  │  │  │  ├─ 📄versions.cjs
│  │  │  │  │  ├─ 📄versions.d.cts
│  │  │  │  │  ├─ 📄versions.d.ts
│  │  │  │  │  └─ 📄versions.js
│  │  │  │  ├─ 📁locales
│  │  │  │  │  ├─ 📄ar.cjs
│  │  │  │  │  ├─ 📄ar.d.cts
│  │  │  │  │  ├─ 📄ar.d.ts
│  │  │  │  │  ├─ 📄ar.js
│  │  │  │  │  ├─ 📄az.cjs
│  │  │  │  │  ├─ 📄az.d.cts
│  │  │  │  │  ├─ 📄az.d.ts
│  │  │  │  │  ├─ 📄az.js
│  │  │  │  │  ├─ 📄be.cjs
│  │  │  │  │  ├─ 📄be.d.cts
│  │  │  │  │  ├─ 📄be.d.ts
│  │  │  │  │  ├─ 📄be.js
│  │  │  │  │  ├─ 📄bg.cjs
│  │  │  │  │  ├─ 📄bg.d.cts
│  │  │  │  │  ├─ 📄bg.d.ts
│  │  │  │  │  ├─ 📄bg.js
│  │  │  │  │  ├─ 📄ca.cjs
│  │  │  │  │  ├─ 📄ca.d.cts
│  │  │  │  │  ├─ 📄ca.d.ts
│  │  │  │  │  ├─ 📄ca.js
│  │  │  │  │  ├─ 📄cs.cjs
│  │  │  │  │  ├─ 📄cs.d.cts
│  │  │  │  │  ├─ 📄cs.d.ts
│  │  │  │  │  ├─ 📄cs.js
│  │  │  │  │  ├─ 📄da.cjs
│  │  │  │  │  ├─ 📄da.d.cts
│  │  │  │  │  ├─ 📄da.d.ts
│  │  │  │  │  ├─ 📄da.js
│  │  │  │  │  ├─ 📄de.cjs
│  │  │  │  │  ├─ 📄de.d.cts
│  │  │  │  │  ├─ 📄de.d.ts
│  │  │  │  │  ├─ 📄de.js
│  │  │  │  │  ├─ 📄en.cjs
│  │  │  │  │  ├─ 📄en.d.cts
│  │  │  │  │  ├─ 📄en.d.ts
│  │  │  │  │  ├─ 📄en.js
│  │  │  │  │  ├─ 📄eo.cjs
│  │  │  │  │  ├─ 📄eo.d.cts
│  │  │  │  │  ├─ 📄eo.d.ts
│  │  │  │  │  ├─ 📄eo.js
│  │  │  │  │  ├─ 📄es.cjs
│  │  │  │  │  ├─ 📄es.d.cts
│  │  │  │  │  ├─ 📄es.d.ts
│  │  │  │  │  ├─ 📄es.js
│  │  │  │  │  ├─ 📄fa.cjs
│  │  │  │  │  ├─ 📄fa.d.cts
│  │  │  │  │  ├─ 📄fa.d.ts
│  │  │  │  │  ├─ 📄fa.js
│  │  │  │  │  ├─ 📄fi.cjs
│  │  │  │  │  ├─ 📄fi.d.cts
│  │  │  │  │  ├─ 📄fi.d.ts
│  │  │  │  │  ├─ 📄fi.js
│  │  │  │  │  ├─ 📄fr-CA.cjs
│  │  │  │  │  ├─ 📄fr-CA.d.cts
│  │  │  │  │  ├─ 📄fr-CA.d.ts
│  │  │  │  │  ├─ 📄fr-CA.js
│  │  │  │  │  ├─ 📄fr.cjs
│  │  │  │  │  ├─ 📄fr.d.cts
│  │  │  │  │  ├─ 📄fr.d.ts
│  │  │  │  │  ├─ 📄fr.js
│  │  │  │  │  ├─ 📄he.cjs
│  │  │  │  │  ├─ 📄he.d.cts
│  │  │  │  │  ├─ 📄he.d.ts
│  │  │  │  │  ├─ 📄he.js
│  │  │  │  │  ├─ 📄hu.cjs
│  │  │  │  │  ├─ 📄hu.d.cts
│  │  │  │  │  ├─ 📄hu.d.ts
│  │  │  │  │  ├─ 📄hu.js
│  │  │  │  │  ├─ 📄id.cjs
│  │  │  │  │  ├─ 📄id.d.cts
│  │  │  │  │  ├─ 📄id.d.ts
│  │  │  │  │  ├─ 📄id.js
│  │  │  │  │  ├─ 📄index.cjs
│  │  │  │  │  ├─ 📄index.d.cts
│  │  │  │  │  ├─ 📄index.d.ts
│  │  │  │  │  ├─ 📄index.js
│  │  │  │  │  ├─ 📄is.cjs
│  │  │  │  │  ├─ 📄is.d.cts
│  │  │  │  │  ├─ 📄is.d.ts
│  │  │  │  │  ├─ 📄is.js
│  │  │  │  │  ├─ 📄it.cjs
│  │  │  │  │  ├─ 📄it.d.cts
│  │  │  │  │  ├─ 📄it.d.ts
│  │  │  │  │  ├─ 📄it.js
│  │  │  │  │  ├─ 📄ja.cjs
│  │  │  │  │  ├─ 📄ja.d.cts
│  │  │  │  │  ├─ 📄ja.d.ts
│  │  │  │  │  ├─ 📄ja.js
│  │  │  │  │  ├─ 📄kh.cjs
│  │  │  │  │  ├─ 📄kh.d.cts
│  │  │  │  │  ├─ 📄kh.d.ts
│  │  │  │  │  ├─ 📄kh.js
│  │  │  │  │  ├─ 📄ko.cjs
│  │  │  │  │  ├─ 📄ko.d.cts
│  │  │  │  │  ├─ 📄ko.d.ts
│  │  │  │  │  ├─ 📄ko.js
│  │  │  │  │  ├─ 📄mk.cjs
│  │  │  │  │  ├─ 📄mk.d.cts
│  │  │  │  │  ├─ 📄mk.d.ts
│  │  │  │  │  ├─ 📄mk.js
│  │  │  │  │  ├─ 📄ms.cjs
│  │  │  │  │  ├─ 📄ms.d.cts
│  │  │  │  │  ├─ 📄ms.d.ts
│  │  │  │  │  ├─ 📄ms.js
│  │  │  │  │  ├─ 📄nl.cjs
│  │  │  │  │  ├─ 📄nl.d.cts
│  │  │  │  │  ├─ 📄nl.d.ts
│  │  │  │  │  ├─ 📄nl.js
│  │  │  │  │  ├─ 📄no.cjs
│  │  │  │  │  ├─ 📄no.d.cts
│  │  │  │  │  ├─ 📄no.d.ts
│  │  │  │  │  ├─ 📄no.js
│  │  │  │  │  ├─ 📄ota.cjs
│  │  │  │  │  ├─ 📄ota.d.cts
│  │  │  │  │  ├─ 📄ota.d.ts
│  │  │  │  │  ├─ 📄ota.js
│  │  │  │  │  ├─ 📄pl.cjs
│  │  │  │  │  ├─ 📄pl.d.cts
│  │  │  │  │  ├─ 📄pl.d.ts
│  │  │  │  │  ├─ 📄pl.js
│  │  │  │  │  ├─ 📄ps.cjs
│  │  │  │  │  ├─ 📄ps.d.cts
│  │  │  │  │  ├─ 📄ps.d.ts
│  │  │  │  │  ├─ 📄ps.js
│  │  │  │  │  ├─ 📄pt.cjs
│  │  │  │  │  ├─ 📄pt.d.cts
│  │  │  │  │  ├─ 📄pt.d.ts
│  │  │  │  │  ├─ 📄pt.js
│  │  │  │  │  ├─ 📄ru.cjs
│  │  │  │  │  ├─ 📄ru.d.cts
│  │  │  │  │  ├─ 📄ru.d.ts
│  │  │  │  │  ├─ 📄ru.js
│  │  │  │  │  ├─ 📄sl.cjs
│  │  │  │  │  ├─ 📄sl.d.cts
│  │  │  │  │  ├─ 📄sl.d.ts
│  │  │  │  │  ├─ 📄sl.js
│  │  │  │  │  ├─ 📄sv.cjs
│  │  │  │  │  ├─ 📄sv.d.cts
│  │  │  │  │  ├─ 📄sv.d.ts
│  │  │  │  │  ├─ 📄sv.js
│  │  │  │  │  ├─ 📄ta.cjs
│  │  │  │  │  ├─ 📄ta.d.cts
│  │  │  │  │  ├─ 📄ta.d.ts
│  │  │  │  │  ├─ 📄ta.js
│  │  │  │  │  ├─ 📄th.cjs
│  │  │  │  │  ├─ 📄th.d.cts
│  │  │  │  │  ├─ 📄th.d.ts
│  │  │  │  │  ├─ 📄th.js
│  │  │  │  │  ├─ 📄tr.cjs
│  │  │  │  │  ├─ 📄tr.d.cts
│  │  │  │  │  ├─ 📄tr.d.ts
│  │  │  │  │  ├─ 📄tr.js
│  │  │  │  │  ├─ 📄ua.cjs
│  │  │  │  │  ├─ 📄ua.d.cts
│  │  │  │  │  ├─ 📄ua.d.ts
│  │  │  │  │  ├─ 📄ua.js
│  │  │  │  │  ├─ 📄ur.cjs
│  │  │  │  │  ├─ 📄ur.d.cts
│  │  │  │  │  ├─ 📄ur.d.ts
│  │  │  │  │  ├─ 📄ur.js
│  │  │  │  │  ├─ 📄vi.cjs
│  │  │  │  │  ├─ 📄vi.d.cts
│  │  │  │  │  ├─ 📄vi.d.ts
│  │  │  │  │  ├─ 📄vi.js
│  │  │  │  │  ├─ 📄yo.cjs
│  │  │  │  │  ├─ 📄yo.d.cts
│  │  │  │  │  ├─ 📄yo.d.ts
│  │  │  │  │  ├─ 📄yo.js
│  │  │  │  │  ├─ 📄zh-CN.cjs
│  │  │  │  │  ├─ 📄zh-CN.d.cts
│  │  │  │  │  ├─ 📄zh-CN.d.ts
│  │  │  │  │  ├─ 📄zh-CN.js
│  │  │  │  │  ├─ 📄zh-TW.cjs
│  │  │  │  │  ├─ 📄zh-TW.d.cts
│  │  │  │  │  ├─ 📄zh-TW.d.ts
│  │  │  │  │  └─ 📄zh-TW.js
│  │  │  │  ├─ 📁mini
│  │  │  │  │  ├─ 📄checks.cjs
│  │  │  │  │  ├─ 📄checks.d.cts
│  │  │  │  │  ├─ 📄checks.d.ts
│  │  │  │  │  ├─ 📄checks.js
│  │  │  │  │  ├─ 📄coerce.cjs
│  │  │  │  │  ├─ 📄coerce.d.cts
│  │  │  │  │  ├─ 📄coerce.d.ts
│  │  │  │  │  ├─ 📄coerce.js
│  │  │  │  │  ├─ 📄external.cjs
│  │  │  │  │  ├─ 📄external.d.cts
│  │  │  │  │  ├─ 📄external.d.ts
│  │  │  │  │  ├─ 📄external.js
│  │  │  │  │  ├─ 📄index.cjs
│  │  │  │  │  ├─ 📄index.d.cts
│  │  │  │  │  ├─ 📄index.d.ts
│  │  │  │  │  ├─ 📄index.js
│  │  │  │  │  ├─ 📄iso.cjs
│  │  │  │  │  ├─ 📄iso.d.cts
│  │  │  │  │  ├─ 📄iso.d.ts
│  │  │  │  │  ├─ 📄iso.js
│  │  │  │  │  ├─ 📄parse.cjs
│  │  │  │  │  ├─ 📄parse.d.cts
│  │  │  │  │  ├─ 📄parse.d.ts
│  │  │  │  │  ├─ 📄parse.js
│  │  │  │  │  ├─ 📄schemas.cjs
│  │  │  │  │  ├─ 📄schemas.d.cts
│  │  │  │  │  ├─ 📄schemas.d.ts
│  │  │  │  │  └─ 📄schemas.js
│  │  │  │  ├─ 📄index.cjs
│  │  │  │  ├─ 📄index.d.cts
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📁v4-mini
│  │  │  │  ├─ 📄index.cjs
│  │  │  │  ├─ 📄index.d.cts
│  │  │  │  ├─ 📄index.d.ts
│  │  │  │  └─ 📄index.js
│  │  │  ├─ 📄LICENSE
│  │  │  ├─ 📄README.md
│  │  │  ├─ 📄index.cjs
│  │  │  ├─ 📄index.d.cts
│  │  │  ├─ 📄index.d.ts
│  │  │  ├─ 📄index.js
│  │  │  └─ 📄package.json
│  │  └─ 📄.package-lock.json
│  ├─ 📁prisma
│  │  └─ 📄schema.prisma
│  ├─ 📁src
│  │  ├─ 📁controllers
│  │  │  ├─ 📄auth.controller.ts
│  │  │  └─ 📄portfolio.controller.ts
│  │  ├─ 📁middleware
│  │  │  ├─ 📄auth.middleware.ts
│  │  │  └─ 📄validate.ts
│  │  ├─ 📁routes
│  │  │  ├─ 📄auth.routes.ts
│  │  │  └─ 📄portfolio.routes.ts
│  │  ├─ 📁utils
│  │  │  └─ 📄jwt.ts
│  │  ├─ 📁validators
│  │  │  └─ 📄portfolio.validator.ts
│  │  └─ 📄index.ts
│  ├─ 📁uploads
│  ├─ 📄.env
│  ├─ 📄.gitignore
│  ├─ 📄package-lock.json
│  ├─ 📄package.json
│  └─ 📄tsconfig.json
├─ 📁frontend
│  ├─ 📁.dart_tool
│  ├─ 📁android
│  │  ├─ 📁.gradle
│  │  │  ├─ 📁8.10.2
│  │  │  │  ├─ 📁checksums
│  │  │  │  │  ├─ 📄checksums.lock
│  │  │  │  │  ├─ 📄md5-checksums.bin
│  │  │  │  │  └─ 📄sha1-checksums.bin
│  │  │  │  ├─ 📁dependencies-accessors
│  │  │  │  │  └─ 📄gc.properties
│  │  │  │  ├─ 📁executionHistory
│  │  │  │  │  ├─ 📄executionHistory.bin
│  │  │  │  │  └─ 📄executionHistory.lock
│  │  │  │  ├─ 📁expanded
│  │  │  │  ├─ 📁fileChanges
│  │  │  │  │  └─ 📄last-build.bin
│  │  │  │  ├─ 📁fileHashes
│  │  │  │  │  ├─ 📄fileHashes.bin
│  │  │  │  │  ├─ 📄fileHashes.lock
│  │  │  │  │  └─ 📄resourceHashesCache.bin
│  │  │  │  ├─ 📁vcsMetadata
│  │  │  │  └─ 📄gc.properties
│  │  │  ├─ 📁buildOutputCleanup
│  │  │  │  ├─ 📄buildOutputCleanup.lock
│  │  │  │  ├─ 📄cache.properties
│  │  │  │  └─ 📄outputFiles.bin
│  │  │  ├─ 📁kotlin
│  │  │  │  ├─ 📁errors
│  │  │  │  └─ 📁sessions
│  │  │  ├─ 📁noVersion
│  │  │  │  └─ 📄buildLogic.lock
│  │  │  ├─ 📁vcs-1
│  │  │  │  └─ 📄gc.properties
│  │  │  └─ 📄file-system.probe
│  │  ├─ 📁app
│  │  │  ├─ 📁src
│  │  │  │  ├─ 📁debug
│  │  │  │  │  └─ 📄AndroidManifest.xml
│  │  │  │  ├─ 📁main
│  │  │  │  │  ├─ 📁java
│  │  │  │  │  │  └─ 📁io
│  │  │  │  │  │     └─ 📁flutter
│  │  │  │  │  │        └─ 📁plugins
│  │  │  │  │  ├─ 📁kotlin
│  │  │  │  │  │  └─ 📁com
│  │  │  │  │  │     └─ 📁example
│  │  │  │  │  │        └─ 📁udhann_grok
│  │  │  │  │  │           └─ 📄MainActivity.kt
│  │  │  │  │  ├─ 📁res
│  │  │  │  │  │  ├─ 📁drawable
│  │  │  │  │  │  │  └─ 📄launch_background.xml
│  │  │  │  │  │  ├─ 📁drawable-v21
│  │  │  │  │  │  │  └─ 📄launch_background.xml
│  │  │  │  │  │  ├─ 📁mipmap-hdpi
│  │  │  │  │  │  │  └─ 📄ic_launcher.png
│  │  │  │  │  │  ├─ 📁mipmap-mdpi
│  │  │  │  │  │  │  └─ 📄ic_launcher.png
│  │  │  │  │  │  ├─ 📁mipmap-xhdpi
│  │  │  │  │  │  │  └─ 📄ic_launcher.png
│  │  │  │  │  │  ├─ 📁mipmap-xxhdpi
│  │  │  │  │  │  │  └─ 📄ic_launcher.png
│  │  │  │  │  │  ├─ 📁mipmap-xxxhdpi
│  │  │  │  │  │  │  └─ 📄ic_launcher.png
│  │  │  │  │  │  ├─ 📁values
│  │  │  │  │  │  │  └─ 📄styles.xml
│  │  │  │  │  │  └─ 📁values-night
│  │  │  │  │  │     └─ 📄styles.xml
│  │  │  │  │  └─ 📄AndroidManifest.xml
│  │  │  │  └─ 📁profile
│  │  │  │     └─ 📄AndroidManifest.xml
│  │  │  └─ 📄build.gradle.kts
│  │  ├─ 📁gradle
│  │  │  └─ 📁wrapper
│  │  │     ├─ 📄gradle-wrapper.jar
│  │  │     └─ 📄gradle-wrapper.properties
│  │  ├─ 📄.gitignore
│  │  ├─ 📄build.gradle.kts
│  │  ├─ 📄gradle.properties
│  │  ├─ 📄gradlew
│  │  ├─ 📄gradlew.bat
│  │  ├─ 📄local.properties
│  │  └─ 📄settings.gradle.kts
│  ├─ 📁build
│  ├─ 📁ios
│  │  ├─ 📁Flutter
│  │  │  ├─ 📁ephemeral
│  │  │  │  ├─ 📄flutter_lldb_helper.py
│  │  │  │  └─ 📄flutter_lldbinit
│  │  │  ├─ 📄AppFrameworkInfo.plist
│  │  │  ├─ 📄Debug.xcconfig
│  │  │  ├─ 📄Generated.xcconfig
│  │  │  ├─ 📄Release.xcconfig
│  │  │  └─ 📄flutter_export_environment.sh
│  │  ├─ 📁Runner
│  │  │  ├─ 📁Assets.xcassets
│  │  │  │  ├─ 📁AppIcon.appiconset
│  │  │  │  │  ├─ 📄Contents.json
│  │  │  │  │  ├─ 📄Icon-App-1024x1024@1x.png
│  │  │  │  │  ├─ 📄Icon-App-20x20@1x.png
│  │  │  │  │  ├─ 📄Icon-App-20x20@2x.png
│  │  │  │  │  ├─ 📄Icon-App-20x20@3x.png
│  │  │  │  │  ├─ 📄Icon-App-29x29@1x.png
│  │  │  │  │  ├─ 📄Icon-App-29x29@2x.png
│  │  │  │  │  ├─ 📄Icon-App-29x29@3x.png
│  │  │  │  │  ├─ 📄Icon-App-40x40@1x.png
│  │  │  │  │  ├─ 📄Icon-App-40x40@2x.png
│  │  │  │  │  ├─ 📄Icon-App-40x40@3x.png
│  │  │  │  │  ├─ 📄Icon-App-60x60@2x.png
│  │  │  │  │  ├─ 📄Icon-App-60x60@3x.png
│  │  │  │  │  ├─ 📄Icon-App-76x76@1x.png
│  │  │  │  │  ├─ 📄Icon-App-76x76@2x.png
│  │  │  │  │  └─ 📄Icon-App-83.5x83.5@2x.png
│  │  │  │  └─ 📁LaunchImage.imageset
│  │  │  │     ├─ 📄Contents.json
│  │  │  │     ├─ 📄LaunchImage.png
│  │  │  │     ├─ 📄LaunchImage@2x.png
│  │  │  │     ├─ 📄LaunchImage@3x.png
│  │  │  │     └─ 📄README.md
│  │  │  ├─ 📁Base.lproj
│  │  │  │  ├─ 📄LaunchScreen.storyboard
│  │  │  │  └─ 📄Main.storyboard
│  │  │  ├─ 📄AppDelegate.swift
│  │  │  ├─ 📄Info.plist
│  │  │  └─ 📄Runner-Bridging-Header.h
│  │  ├─ 📁Runner.xcodeproj
│  │  │  ├─ 📁project.xcworkspace
│  │  │  │  ├─ 📁xcshareddata
│  │  │  │  │  ├─ 📄IDEWorkspaceChecks.plist
│  │  │  │  │  └─ 📄WorkspaceSettings.xcsettings
│  │  │  │  └─ 📄contents.xcworkspacedata
│  │  │  ├─ 📁xcshareddata
│  │  │  │  └─ 📁xcschemes
│  │  │  │     └─ 📄Runner.xcscheme
│  │  │  └─ 📄project.pbxproj
│  │  ├─ 📁Runner.xcworkspace
│  │  │  ├─ 📁xcshareddata
│  │  │  │  ├─ 📄IDEWorkspaceChecks.plist
│  │  │  │  └─ 📄WorkspaceSettings.xcsettings
│  │  │  └─ 📄contents.xcworkspacedata
│  │  ├─ 📁RunnerTests
│  │  │  └─ 📄RunnerTests.swift
│  │  ├─ 📄.gitignore
│  │  ├─ 📄Podfile
│  │  └─ 📄Podfile.lock
│  ├─ 📁lib
│  │  ├─ 📁screens
│  │  │  ├─ 📄home_screen.dart
│  │  │  ├─ 📄login_screen.dart
│  │  │  ├─ 📄portfolio_screen.dart
│  │  │  ├─ 📄registration_screen.dart
│  │  │  ├─ 📄scholarship_screen.dart
│  │  │  └─ 📄university_matches_screen.dart
│  │  ├─ 📁services
│  │  ├─ 📁state
│  │  │  └─ 📄profile_notifier.dart
│  │  ├─ 📁utils
│  │  │  └─ 📄global_state.dart
│  │  └─ 📄main.dart
│  ├─ 📁linux
│  ├─ 📁macos
│  │  ├─ 📁Flutter
│  │  │  ├─ 📁ephemeral
│  │  │  │  ├─ 📄Flutter-Generated.xcconfig
│  │  │  │  └─ 📄flutter_export_environment.sh
│  │  │  ├─ 📄Flutter-Debug.xcconfig
│  │  │  └─ 📄Flutter-Release.xcconfig
│  │  ├─ 📁Runner
│  │  │  ├─ 📁Assets.xcassets
│  │  │  │  └─ 📁AppIcon.appiconset
│  │  │  │     ├─ 📄Contents.json
│  │  │  │     ├─ 📄app_icon_1024.png
│  │  │  │     ├─ 📄app_icon_128.png
│  │  │  │     ├─ 📄app_icon_16.png
│  │  │  │     ├─ 📄app_icon_256.png
│  │  │  │     ├─ 📄app_icon_32.png
│  │  │  │     ├─ 📄app_icon_512.png
│  │  │  │     └─ 📄app_icon_64.png
│  │  │  ├─ 📁Base.lproj
│  │  │  │  └─ 📄MainMenu.xib
│  │  │  ├─ 📁Configs
│  │  │  │  ├─ 📄AppInfo.xcconfig
│  │  │  │  ├─ 📄Debug.xcconfig
│  │  │  │  ├─ 📄Release.xcconfig
│  │  │  │  └─ 📄Warnings.xcconfig
│  │  │  ├─ 📄AppDelegate.swift
│  │  │  ├─ 📄DebugProfile.entitlements
│  │  │  ├─ 📄Info.plist
│  │  │  ├─ 📄MainFlutterWindow.swift
│  │  │  └─ 📄Release.entitlements
│  │  ├─ 📁Runner.xcodeproj
│  │  │  ├─ 📁project.xcworkspace
│  │  │  │  └─ 📁xcshareddata
│  │  │  │     └─ 📄IDEWorkspaceChecks.plist
│  │  │  ├─ 📁xcshareddata
│  │  │  │  └─ 📁xcschemes
│  │  │  │     └─ 📄Runner.xcscheme
│  │  │  └─ 📄project.pbxproj
│  │  ├─ 📁Runner.xcworkspace
│  │  │  ├─ 📁xcshareddata
│  │  │  │  └─ 📄IDEWorkspaceChecks.plist
│  │  │  └─ 📄contents.xcworkspacedata
│  │  ├─ 📁RunnerTests
│  │  │  └─ 📄RunnerTests.swift
│  │  ├─ 📄.gitignore
│  │  └─ 📄Podfile
│  ├─ 📁test
│  │  └─ 📄widget_test.dart
│  ├─ 📁web
│  │  ├─ 📁icons
│  │  │  ├─ 📄Icon-192.png
│  │  │  ├─ 📄Icon-512.png
│  │  │  ├─ 📄Icon-maskable-192.png
│  │  │  └─ 📄Icon-maskable-512.png
│  │  ├─ 📄favicon.png
│  │  ├─ 📄index.html
│  │  └─ 📄manifest.json
│  ├─ 📁windows
│  ├─ 📄.flutter-plugins-dependencies
│  ├─ 📄.gitignore
│  ├─ 📄README.md
│  ├─ 📄analysis_options.yaml
│  ├─ 📄pubspec.lock
│  └─ 📄pubspec.yaml
├─ 📄.DS_Store
├─ 📄.gitignore
├─ 📄CancelTency-Presentation.key
└─ 📄README.md
```