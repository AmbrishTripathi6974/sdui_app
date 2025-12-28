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
- Endpoint:
