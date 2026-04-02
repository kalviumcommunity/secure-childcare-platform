# Secure Childcare Platform

A **production-ready Flutter application** for secure, role-based childcare management with offline support, real-time Firebase integration, and accessible UI/UX.

## 📋 Overview

**Secure Childcare** is a comprehensive mobile and web platform designed for childcare centers, staff, and parents. It provides role-based dashboards, real-time attendance tracking, activity logging, and secure communication—all with a modern Material Design 3 interface supporting dark mode.

### Key Highlights
- ✅ **Cross-platform**: Android, iOS, Web, and Windows (Flutter)
- ✅ **Role-based access**: Parent, Staff, and Admin dashboards with tailored features
- ✅ **Offline-first**: Local fallback data when Firebase is unavailable
- ✅ **Dark mode & accessibility**: System theme support, high contrast, large tap targets
- ✅ **Real-time data**: Firebase Firestore for live updates
- ✅ **Production code**: Analyzer clean, tests passing, professional architecture

---

## 🎯 Features

### Dashboard
- **Role-aware views** - Each user type (Parent/Staff/Admin) sees customized content
- **Quick actions** - Role-specific buttons (Pickup Pass, Secure Check-In, Attendance Board, etc.)
- **Child status cards** - Real-time check-in status, room assignment, arrival time
- **Activity timeline** - Chronological log of snacks, learning activities, messages, rest time
- **Health notices** - Alerts for wellness checks, pickup updates, incidents
- **Settings panel** - Notification preferences, accessibility toggles

### Data & Sync
- **Firebase Firestore** - Real-time child data, notices, activity logs
- **Local seeded fallback** - Works offline; demo data for immediate demo/testing
- **Responsive layout** - Adapts to mobile, tablet, desktop widths
- **Stateful management** - Tab navigation (Home / Activity / Profile)

### Accessibility
- **Dark mode** - System theme detection (light/dark)
- **High contrast** - Clear text hierarchy and color coding
- **Material 3** - Modern design system with semantic colors
- **Large touch targets** - 44dp+ buttons and interactive elements

---

## 🛠️ Tech Stack

| Component | Technology | Version |
|-----------|-----------|---------|
| **Framework** | Flutter | 2.10.5 |
| **Language** | Dart | 2.16.2 |
| **Backend** | Firebase Firestore | Latest |
| **Auth** | Firebase Auth | 3.3.19 |
| **Storage** | Firebase Storage | 10.2.17 |
| **UI Framework** | Material 3 | Built-in |
| **Testing** | Flutter Test | 2.10.5 |

---

## 📁 Project Structure

```
secure-childcare-platform/
├── frontend/                          # Flutter app
│   ├── lib/
│   │   ├── main.dart                  # App entry point, theme config
│   │   ├── screens/
│   │   │   ├── welcome_screen.dart    # Main dashboard (700+ lines)
│   │   │   ├── login_screen.dart
│   │   │   └── signup_screen.dart
│   │   └── services/
│   │       ├── dashboard_repository.dart  # Data layer, role-based models
│   │       ├── auth_service.dart          # Firebase authentication
│   │       ├── firestore_service.dart     # Firestore wrapper
│   │       └── firebase_config.dart
│   ├── test/
│   │   └── widget_test.dart           # UI tests (PASSING ✅)
│   ├── android/                       # Android-specific config
│   ├── ios/                           # iOS-specific config
│   ├── web/                           # Web build assets
│   ├── pubspec.yaml                   # Dependencies
│   └── analysis_options.yaml          # Lint configuration
├── backend/                           # (Optional) Backend services
└── README.md                          # This file
```

---

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK**: 2.10.5+ ([Download](https://flutter.dev/docs/get-started/install))
- **Dart SDK**: 2.16.2+ (included with Flutter)
- **Java Development Kit (JDK)**: 11+ (for Android builds)
  - [Oracle JDK 11](https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html)
  - Or OpenJDK 11
- **Android SDK** (optional, for Android builds): API 19+
- **Git**: For version control

### Environment Setup

#### 1. Verify Flutter Installation
```bash
flutter --version
flutter doctor
```

#### 2. Set Java Home (Required for Android)
**Windows (PowerShell)**:
```powershell
$env:JAVA_HOME = "C:\Program Files\Java\jdk-11"
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
java -version  # Verify
```

**Windows (Command Prompt)**:
```cmd
set JAVA_HOME=C:\Program Files\Java\jdk-11
set PATH=%JAVA_HOME%\bin;%PATH%
java -version
```

**macOS/Linux**:
```bash
export JAVA_HOME=/path/to/jdk-11
export PATH=$JAVA_HOME/bin:$PATH
java -version
```

#### 3. Clone & Setup Project
```bash
git clone https://github.com/your-org/secure-childcare-platform.git
cd secure-childcare-platform/frontend
flutter pub get
```

#### 4. Configure Firebase (Optional)
To connect to live Firebase:
1. Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
2. Download `google-services.json` and place in `android/app/`
3. Download `GoogleService-Info.plist` and place in `ios/Runner/`
4. Update `pubspec.yaml` with your Firebase project details

---

## 📱 Running the App

### Android (Mobile Device/Emulator)
```bash
cd frontend
flutter run -d emulator-5554      # Replace with your device ID
# Or for APK build:
flutter build apk --debug
```

**Output**: `build/app/outputs/flutter-apk/app-debug.apk`

### Web (Chrome/Edge/Firefox)
```bash
cd frontend
flutter run -d chrome             # Requires ~500MB disk space
```

Runs at `http://localhost:56789`

### Windows (Desktop)
Requires Visual Studio with C++ workload:
```bash
cd frontend
flutter run -d windows
```

---

## ✅ Testing & Validation

### Run Tests
```bash
cd frontend
flutter test -r expanded
```

**Expected Output**:
```
00:00 +0: App renders welcome screen
00:00 +1: All tests passed!
```

### Static Analysis
```bash
cd frontend
flutter analyze
```

**Expected Output**: `No issues found!`

---

## 📊 Code Quality

| Metric | Status |
|--------|--------|
| **Analysis** | ✅ Clean (0 issues) |
| **Tests** | ✅ Passing (1/1) |
| **Dart Format** | ✅ Compliant |
| **Null Safety** | ✅ Sound |

---

## 🎨 UI/UX Features

### Theming
- **Light theme**: Seed color `#0E6BA8` (professional blue)
- **Dark theme**: Seed color `#5CC8FF` (high contrast)
- **System detection**: Respects device dark mode setting
- **Material 3**: Semantic colors, rounded surfaces, elevation

### Navigation
- **Bottom navigation bar** with 3 tabs:
  - 🏠 **Home** - Dashboard overview
  - 📋 **Activity** - Timeline of events
  - 👤 **Profile** - Settings & preferences
- **Role switcher** - Change between Parent/Staff/Admin at the top
- **Refresh indicator** - Pull-to-refresh dashboard

### Components
- **Stat cards** - Present, Check-ins, Alerts, Role (grid layout)
- **Quick action cards** - Role-specific actions in a responsive layout
- **Notice alerts** - Color-coded health/administrative notifications
- **Child profile cards** - Circular avatar, status badge, details
- **Settings toggles** - Daily digest, instant alerts, pickup code
- **Timeline cards** - Activity log with timestamps

---

## 📡 Data Model

### UserRole (Enum)
```dart
enum UserRole { parent, staff, admin }
```

### DashboardSnapshot
```
- headline: String (e.g., "Parent Dashboard")
- subheadline: String (role description)
- childrenPresent: int
- alerts: int
- checkIns: int
- children: List<ChildProfileData>
- notices: List<NoticeData>
- timeline: List<TimelineEventData>
- quickActions: List<QuickActionData>
```

### Data Sources
1. **Firebase Firestore** (if available):
   - Collection: `dashboard`
   - Documents: `parent`, `staff`, `admin`
2. **Local fallback** (always available):
   - Seeded data in `dashboard_repository.dart`
   - Demo children: Emma, Noah, Mia
   - Demo notices, timeline, actions

---

## 🔐 Security & Privacy

- **Firebase Auth** - Secure user authentication
- **Firestore rules** - Role-based access control (to be configured)
- **Data encryption** - Firebase provides in-transit encryption
- **Null safety** - Prevents null reference vulnerabilities
- **Sensitive data** - Never logged or cached in plain text

---

## 🐛 Troubleshooting

### Issue: "No Java Development Kit (JDK) found"
**Solution**: 
```powershell
# Set JAVA_HOME for current session
$env:JAVA_HOME = "C:\Program Files\Java\jdk-11"
flutter build apk --debug
```

### Issue: "Disk space full" (Web build fails)
**Solution**: Free up 1-2GB on C: drive
```powershell
Remove-Item -Path $env:TEMP\* -Recurse -Force
```

### Issue: "Unable to load dashboard" screen shows
**Cause**: Firebase not configured or network unavailable  
**Fix**: App automatically falls back to local demo data. Check Firebase project setup.

### Issue: Tests fail with "Cannot find widget X"
**Solution**: Ensure app runs with `flutter run` first, then rebuild with `flutter test`.

---

## 📚 Documentation

- [Flutter Docs](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Firebase for Flutter](https://firebase.flutter.dev/docs/overview)
- [Material 3 Design](https://m3.material.io/)

---

## 🤝 Contributing

1. **Code style**: Run `flutter format .` before committing
2. **Testing**: Ensure `flutter test` passes
3. **Analysis**: Run `flutter analyze` and fix warnings
4. **Commits**: Use clear, descriptive commit messages

### Branch strategy
- `main` - Production-ready code
- `develop` - Integration branch
- `feature/*` - Feature branches

---

## 📋 Future Enhancements

- [ ] Push notifications for alerts
- [ ] Video streaming for classroom activity
- [ ] Offline message queueing
- [ ] Biometric authentication
- [ ] Export reports (PDF/CSV)
- [ ] Multi-language support (i18n)
- [ ] Analytics dashboard for admin
- [ ] Parent-to-staff messaging
- [ ] Photo/document sharing

---

## 📄 License

Licensed under the MIT License. See LICENSE file for details.

---

## 📧 Support

For issues, questions, or contributions:
- **Open an issue** on GitHub
- **Email**: support@secure-childcare.dev
- **Discord**: [Join our community](https://discord.gg/example)

---

**Built with ❤️ using Flutter & Dart**

### Stateless vs. Stateful Widgets
| Feature | StatelessWidget | StatefulWidget |
| :--- | :--- | :--- |
| **State** | Immutable (cannot change). | Mutable (can change). |
| **Rebuild** | Only builds once unless parent changes. | Rebuilds whenever `setState()` is called. |
| **Use Case** | Static text, icons, simple layouts. | Forms, animations, counters, dynamic lists. |

### How Flutter Build Reactive UIs
Flutter uses a reactive model. When the state of a widget changes (e.g., via `setState()`):
1.  The widget calls its `build()` method.
2.  Flutter constructs a new widget tree based on the new state.
3.  It compares the new tree with the old one (diffing).
4.  It strictly updates only the render objects that changed (e.g., just the text "Count: 1"), making it extremely efficient.

### Why Dart is Ideal for Flutter
1.  **AOT Compilation**: Compiles to native ARM/x64 machine code for fast startup and performance on mobile.
2.  **JIT Compilation**: Enables **Hot Reload** during development for sub-second iteration cycles.
3.  **UI Optimized**: Features like the spread operator for collections and named parameters make building complex widget trees readable and concise.
4.  **Null Safety**: Prevents a class of common bugs, ensuring robust apps.

## 6. Demo Notes (Mock Walkthrough)
*   **Simple UI Demo**: Shows a standard Material app with a blue "Hello Flutter" AppBar and centered "Welcome to Flutter!" text. It demonstrates the basic `Scaffold` structure.
    *   The UI updates dynamically to show "Count: 1", then "2", etc.
    *   This proves the reactive nature of the framework.

---

# Lesson 2: Firebase Services and Real-Time Data

## 1. Set Up Firebase for Your Flutter App
To connect your app to Firebase:
1.  Go to the [Firebase Console](https://console.firebase.google.com/).
2.  Click **Add Project** and give it a name.
3.  Add an Android/iOS app to your project.
4.  Download the config file (`google-services.json` for Android or `GoogleService-Info.plist` for iOS) and place it in your app directory.
5.  Add dependencies in `pubspec.yaml` (see `pubspec_copy.yaml` for example):
    ```yaml
    dependencies:
      firebase_core: ^3.0.0
      cloud_firestore: ^5.0.0
      firebase_auth: ^5.0.0
    ```
6.  Initialize Firebase in `main.dart`:
    ```dart
    void main() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      runApp(MyApp());
    }
    ```

## 2. Key Firebase Services
| Service | Purpose | Example Use Case |
| :--- | :--- | :--- |
| **Firebase Authentication** | Manages user identities (Sign up/Login). | Login with Email, Google, or Phone. |
| **Cloud Firestore** | NoSQL database with real-time syncing. | Chat apps, live dashboards, shared lists. |
| **Firebase Storage** | Stores user-generated files. | Profile pictures, video uploads. |

## 3. Firebase Authentication
We use `FirebaseAuth` to manage users.
*   **Sign Up**: Creates a new account in your Firebase project.
*   **Sign In**: Authenticates an existing user and returns a `User` object.
*   *Code Example*: See `firebase_auth_example.dart`.

## 4. Cloud Firestore (Real-Time Database)
Firestore stores data in **Documents** arranged in **Collections**.
*   **Real-time Updates**: Using `snapshots()`, your app listens to the database. When data changes on the server (or by another user), your app updates *instantly* without a refresh.
*   *Code Example*: See `firestore_example.dart`. The `StreamBuilder` widget rebuilds the UI every time a new snapshot arrives.

## 5. Firebase Storage
Used for uploading and retrieving large files.
*   *Code Example*: See `storage_example.dart`. It demonstrates uploading a file and getting a download URL.

---

# Lesson 3: Design Thinking & Responsive UI

## 1. The 5 Stages of Design Thinking
An approach to problem-solving that centers on the user.
1.  **Empathize**: Understand user needs (e.g., users want quick access to tasks).
2.  **Define**: State the core problem.
3.  **Ideate**: Brainstorm solutions.
4.  **Prototype**: Create mockups in **Figma**.
5.  **Test**: Build in Flutter and refine.

## 2. Figma to Flutter Translation
How to map design concepts to widgets:
| Design Element | Flutter Widget | Notes |
| :--- | :--- | :--- |
| Text / Headings | `Text` | Use `TextStyle` for font, weight, color. |
| Buttons | `ElevatedButton` | Style with `ElevatedButton.styleFrom`. |
| Layout Grid | `Row`, `Column` | Use `Expanded` for flexible sizing. |
| Cards / Shadows | `Card`, `Container` | Add 'elevation' or `BoxDecoration`. |

*   *Code Example*: See `design_translation_example.dart`. It maps a specific color palette and typography spec to a Flutter Theme.

## 3. Responsive & Adaptive Design
Your app runs on phones, tablets, and web. It needs to adapt.

### Key Techniques
1.  **MediaQuery**:
    *   Gets the screen size (`MediaQuery.of(context).size.width`).
    *   *Usage*: "If width < 600px, show mobile layout. Else, show tablet layout."
2.  **LayoutBuilder**:
    *   Similar to MediaQuery but works on the parent widget's constraints, not the whole screen.
3.  **Flexible / Expanded**:
    *   Allows widgets to fill available space proportionally.

*   *Code Example*: See `responsive_layout_example.dart`.
    *   **Mobile (< 600px)**: Shows a single `Column` with a summary card and list.
    *   **Tablet (>= 600px)**: Shows a `Row` with the summary card on the left and list on the right.

---

# Sprint 2: Flutter & Dart Basics

## 1. Project Folder Structure
A clean structure scales well.
*   **`lib/main.dart`**: The entry point. Sets up the `MaterialApp` and Theme.
*   **`lib/screens/`**: Contains full-page widgets (e.g., `WelcomeScreen`).
*   **`lib/widgets/`**: Contains reusable UI components (e.g., `CustomButton`).
*   **`lib/models/`**: (Future use) for data classes.

## 2. Setup Instructions
To run this project:
1.  **Install Flutter**: Follow guides at [flutter.dev](https://flutter.dev/docs/get-started/install).
2.  **Verify Install**: Run `flutter doctor`.
3.  **Create Project**: `flutter create sprint_2_basics`.
4.  **Add Code**: Copy the `lib/` folder from this repo into your new project.
5.  **Run**: `flutter run`.

## 3. Demo Description
The "Welcome Screen" demonstrates:
*   **scaffold**: Standard app layout with AppBar and Body.
*   **Column**: Vertical layout of elements.
*   **State Management**: Clicking "Click Me!" toggles the text and icon, showing how `setState` rebuilds the UI.

---

# Sprint 2: Responsive Mobile Interfaces

## 1. Responsiveness Strategy
We use `MediaQuery` to detect screen width and switch layouts.
*   **Breakpoint**: `600px`.
*   **Mobile (< 600px)**: Uses a `Column` layout typical for narrow screens.
*   **Tablet (> 600px)**: Introduces a `NavigationRail` and expands content horizontally using `Row` and `Expanded`.

## 2. Adaptive Widgets Used
*   **`LayoutBuilder` / `MediaQuery`**: For conditional layout logic.
*   **`GridView`**: Dynamically changes `crossAxisCount` (2 columns on mobile, 4 on tablet).
*   **`NavigationRail`**: Standard navigation component for larger screens.

## 3. How to Test
1.  Run `lib/main_responsive.dart`.
2.  Resize your browser window (if using Web) or rotate your emulator/device.
3.  Observe the header text change and the navigation menu appear/disappear.

---

# Sprint 2: Firebase Integration (Auth & Firestore)

## 1. Setup Instructions
**Crucial**: This code requires a Firebase project.
1.  Go to [Firebase Console](https://console.firebase.google.com/).
2.  Create a project and add an Android/iOS app.
3.  **Download Config**:
    *   `google-services.json` (Android) -> place in `android/app/`.
    *   `GoogleService-Info.plist` (iOS) -> place in `ios/Runner/`.
4.  **Dependencies**: Already added in `pubspec.yaml` (`firebase_auth`, `cloud_firestore`).
5.  **Uncomment Code**: In `lib/main_firebase.dart`, uncomment `await Firebase.initializeApp();`.

## 2. Features Implemented
*   **Authentication**: `AuthService` handles Sign Up and Login.
*   **Cloud Firestore**: `FirestoreService` stores user details (name, email) in a `users` collection upon sign up.
*   **UI Flow**: Login Screen -> Sign Up Screen.

## 3. How to Test
1.  Configure the Firebase project as above.
2.  Run `lib/main_firebase.dart`.
3.  Click "Create an Account", fill details, and Sign Up.
4.  Check Firebase Console -> Authentication (User created) & Firestore (Data saved).

---

# Sprint 2: Environment Setup

## 1. Setup Guide
Since this environment doesn't have Flutter installed, follow these steps on your local machine:

1.  **Download Flutter SDK**: [flutter.dev/install](https://docs.flutter.dev/get-started/install)
2.  **Add to PATH**: Ensure `flutter/bin` is in your system PATH variables.
3.  **Run Doctor**: Execute `flutter doctor` in your terminal. All checkmarks should be green.
4.  **Install Android Studio**: [developer.android.com/studio](https://developer.android.com/studio)
    *   Install "Flutter" and "Dart" plugins.
    *   Create a Virtual Device (AVD).

## 2. Setup Verification
**Task**: Replace the images below with your own screenshots after completing setup.

### A. Flutter Doctor Output
![Flutter Doctor Output](PLACEHOLDER_FLUTTER_DOCTOR_SCREENSHOT)
*Goal: Show that Flutter, Android toolchain, and Android Studio are installed and healthy.*

### B. Emulator Running App
![Running App on Emulator](PLACEHOLDER_EMULATOR_SCREENSHOT)
*Goal: Show the default counter app running on on Android Emulator.*

## 3. Reflection
*   **Challenges**: (Write your reflection here - e.g., "Setting up JAVA_HOME was tricky...")
*   **Preparation**: This setup ensures a stable environment for building complex UIs and integrating Firebase later.

---

# Sprint 2: Folder Structure Exploration

## 1. Monorepo Structure
We have restructured the project to separate concerns:

*   **`frontend/`**: Contains the Flutter application code (`lib`, `assets`, tests).
*   **`backend/`**: Reserved for server-side logic and configuration.

## 2. Structure Overview
We have documented the role of every file and folder in the Flutter project (`frontend/`) in a dedicated guide.

👉 **[Read the Frontend Structure Guide](PROJECT_STRUCTURE.md)**


## 2. Key Takeaways
*   **`lib/`**: Contains all your Dart code.
*   **`pubspec.yaml`**: Manages dependencies and assets.
*   **`android/` & `ios/`**: Platform-specific configuration.

## 3. Ide Setup
**Task**: Replace the image below with a screenshot of your IDE's file explorer showing the folder tree.

![IDE Folder Structure](PLACEHOLDER_FOLDER_STRUCTURE_SCREENSHOT)

---

# Sprint 2: Widget Tree & Reactive UI

## 1. The Widget Tree
Everything in Flutter is a widget. They are arranged in a hierarchy (Tree).
Here is the structure of our `ReactiveDemo` app:

```text
MaterialApp
 ┗ Scaffold
    ┣ AppBar
    ┗ Center
       ┗ Column
          ┣ Text (Counter)
          ┣ SizedBox
          ┣ Container (Colored Box)
          │  ┗ Text (Status)
          ┗ ElevatedButton
```

## 2. Reactive Model
Flutter does not update the screen by modifying pixels directly. It relies on **State**.
1.  **State Change**: We change a variable (e.g., `_boxColor`).
2.  **Trigger**: We call `setState()`.
3.  **Rebuild**: Flutter re-runs the `build()` method.
4.  **Update**: Flutter compares the new widget tree with the old one and updates *only* what changed (the Container color and Text).

## 3. Demo Evidence
**Task**: Add screenshots of the app in "Blue" state and "Green" state.

| State A (Blue) | State B (Green) |
| :---: | :---: |
| ![Blue State](PLACEHOLDER_BLUE_STATE) | ![Green State](PLACEHOLDER_GREEN_STATE) |

---

# Sprint 2: Stateless vs Stateful Widgets

## 1. Concept Overview

### A. Stateless Widgets
*   **Definition**: Widgets that describe part of the UI which is **constant**.
*   **Behavior**: Built once. Does *not* store mutable state.
*   **Use Case**: Icons, Labels, Static Text, Simple wrappers.
*   **Example**: `StatelessHeader` in our demo simply renders the title passed to it.

### B. Stateful Widgets
*   **Definition**: Widgets that describe part of the UI which can **change**.
*   **Behavior**: Maintains a mutable `State` object. Can be rebuilt multiple times.
*   **Use Case**: Checkboxes, Forms, Sliders, Counters, Animations.
*   **Example**: `StatefulCounter` maintains a `_count` variable and updates the UI when `setState` is called.

## 2. Demo & Evidence
**Task**: Replace the screenshots below.

| Initial State (Dynamic part is Orange) | Interaction State (Dynamic part is Green) |
| :---: | :---: |
| ![Initial](PLACEHOLDER_INITIAL_STATE) | ![Interacted](PLACEHOLDER_INTERACTED_STATE) |

---

# Sprint 2: Hot Reload & DevTools

## 1. Hot Reload (⚡)
**Why it matters**: It allows you to see changes instantly without restarting the app.
*   **Try it**: Run the app, change the text "Modify this text" in `devtools_demo.dart`, save the file, and watch the app update instantly.

## 2. Debug Console
**Why it matters**: It shows logs (`debugPrint`) and errors.
*   **Try it**: Click the "Log to Console" button. Look at your IDE's terminal/debug console to see `"Current Counter Value: X"`.

## 3. Flutter DevTools
**Why it matters**: It lets you inspect the widget tree layout and debug UI issues visually.
*   **Try it**: Open DevTools (in VS Code: `Ctrl+Shift+P` -> `Open DevTools`). Use the **Widget Inspector** to click on the "Inspect me" widget.

## 4. Evidence
**Task**: Replace the screenshots below.

| Debug Console Log | Widget Inspector View |
| :---: | :---: |
| ![Console](PLACEHOLDER_CONSOLE_SCREENSHOT) | ![Inspector](PLACEHOLDER_INSPECTOR_SCREENSHOT) |

### 🎥 Video Demo
[**Link to My Video Demo**](PLACEHOLDER_VIDEO_LINK)











