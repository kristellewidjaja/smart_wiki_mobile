# Smart Wiki Mobile (rebranded to FinGuru) 

Client‑side mobile application for FinGuru knowledge‑base ecosystem that contains financial literacy information curated for teenagers.  
Designed to give users on‑the‑go access to curated knowledge, search functionality, and content created/managed by the backend API.

## Table of Contents  
- [Overview](#overview)  
- [Features](#features)  
- [Tech Stack](#tech-stack)  
- [Getting Started](#getting-started)  
- [Project Structure](#project-structure)  
- [Configuration & Environment Variables](#configuration--environment-variables)  
- [Contributing](#contributing)  
- [License](#license)  

## Overview  
Smart Wiki Mobile serves as the mobile frontend (iOS & Android) for the Smart Wiki backend API. It connects to the backend to fetch and display knowledge‑base entries, allows full-text search, supports user navigation, and delivers a smooth, native‑app experience. The mobile app aims to make FinGuru’s curated knowledge accessible anytime, anywhere.

## Features  
- Cross-platform Flutter app for iOS and Android  
- Fetches and displays articles / knowledge‑base entries served by Smart Wiki API  
- Search functionality — query backend and view results in-app  
- Clean UI for browsing, reading, and navigating knowledge-base content  
- Offline support: caches recent content for read‑later when offline (where applicable)  
- Extensible architecture, enabling future integration (e.g. embedding-based search, AI‑powered summarization, user notes)  

## Tech Stack  
- Flutter & Dart — UI and cross-platform logic  
- HTTP networking (via Flutter’s http / Dio / equivalent) to call Smart Wiki API  
- Local storage/caching (e.g. SQLite, SharedPreferences, or similar) for offline reads & persistence  
- (Optional) Native platform modules — if required by platform-specific features  

## Getting Started  

### Prerequisites  
- Flutter SDK (matching the version in `pubspec.yaml`)  
- Xcode for iOS builds or Android Studio + Android SDK for Android builds  
- Access to Smart Wiki backend (running or reachable via network)  

### Installation & Setup  

```bash
git clone https://github.com/kristellewidjaja/smart_wiki_mobile.git  
cd smart_wiki_mobile  
flutter pub get  
