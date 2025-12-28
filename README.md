# Server-Driven UI (SDUI) Flutter App

This project is a demonstration of a **Server-Driven UI (SDUI)** architecture using **Flutter** and **Dart**.

In this system, the **server defines the UI structure, components, and actions**, while the **Flutter client dynamically renders the UI** based on the JSON response received from the server.  
The client contains no hardcoded screens or navigation logic.

---

## 📌 Project Overview

The repository contains **three independent modules**:

sdui_sample_app/
├── sdui_models/ # Shared UI models (used by server & client)
├── sdui_server/ # Dart backend that emits UI JSON
└── sdui_client/ # Flutter app that renders UI dynamically


Each module has its own `pubspec.yaml` and can be developed and run independently.

---

## 🎯 Objective

- Demonstrate understanding of **Server-Driven UI**
- Build **dynamic screens** controlled entirely by the server
- Implement **generic UI rendering and action handling** on the client
- Support runtime UI changes without modifying client code

---

## 🧩 Features Implemented

### Screens (Server-Driven)
- **Home**
- **Profile**
- **Settings**

### Supported Components
- Title
- Spacer
- Image Banner
- Card
- Horizontal List
- Info Tile
- Divider
- Button

### Supported Actions
- Navigate to another screen
- Go back
- Show Snackbar
- Open URL
- Log Event

All components and actions are **defined by the server** and interpreted dynamically by the Flutter client.

---

## 🏗 Architecture

### 1. Shared Models (`sdui_models`)
- Screen models (`VerticalScreen`, `ErrorScreen`)
- Component models
- Action models
- Shared between server and client

### 2. Server (`sdui_server`)
- Dart backend using `shelf`
- Endpoint: POST /screens/{screen_name}
- Builds screen models and returns JSON
- Controls:
- UI layout
- Component order
- Navigation flow
- Actions

### 3. Client (`sdui_client`)
- Flutter application
- Fetches screen JSON dynamically
- Renders UI using:
- Screen Mapper
- Component Mapper
- Action Handler
- Contains a generic `SDUIScreen` widget

---

## 🔁 Navigation Flow

All navigation is **server-controlled** via actions:

- Home → Profile
- Home → Settings
- Profile → Back to Home
- Settings → Back to Home

The Flutter client does not hardcode any navigation logic.

---

## ▶️ How to Run the Project

### Prerequisites
- Flutter SDK
- Dart SDK
- Android Emulator / iOS Simulator / Physical Device

---

### 1️⃣ Run the Server

```bash
cd sdui_server
dart pub get
dart run bin/server.dart

```

### 2️⃣ Server will start at

```bash
http://localhost:8080

```

### 3️⃣ Run the Flutter App

```bash
cd sdui_client
flutter pub get
flutter run

```

## 📌 Note:

- Android Emulator uses http://10.0.2.2:8080
- iOS Simulator uses http://localhost:8080

