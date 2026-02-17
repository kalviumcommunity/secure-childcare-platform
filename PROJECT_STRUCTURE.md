# Flutter Project Structure Guide

A comprehensive guide to understanding the role of every file and folder in your Flutter project.

## 📂 Project Hierarchy

```text
my_flutter_app/
├── android/             # Android-specific files
├── ios/                 # iOS-specific files
├── lib/                 # Main Dart code (Where you work 99% of the time)
│   ├── main.dart        # Entry point of the app
│   ├── screens/         # UI Screens (Best Practice)
│   ├── widgets/         # Reusable Components (Best Practice)
│   └── models/          # Data Models (Best Practice)
├── test/                # Unit and Widget tests
├── assets/              # Images, fonts, etc. (Manual creation)
├── pubspec.yaml         # Dependencies and Assets config
├── analysis_options.yaml # Linter rules
└── .gitignore           # Git ignore rules
```

## 📝 Key Folders & Files

| Directory/File | Purpose |
| :--- | :--- |
| **`lib/`** | The heart of your application. Contains all Dart code suitable for cross-platform execution. |
| `lib/main.dart` | The entry point. Contains the `main()` function that calls `runApp()`. |
| **`android/`** | Native Android project files. Contains `build.gradle` (SDK versions) and `AndroidManifest.xml` (Permissions). |
| **`ios/`** | Native iOS project files. Contains `Runner.xcworkspace` (Open in Xcode) and `Info.plist` (Permissions). |
| **`test/`** | Contains automated tests. `widget_test.dart` is created by default to test the counter app. |
| **`assets/`** | A folder you create to store static files like images, icons, and fonts. Must be registered in `pubspec.yaml`. |
| **`pubspec.yaml`** | The project configuration file. Used to add libraries (packages), define assets, and set SDK constraints. |
| `.gitignore` | Tells Git which files to ignore (e.g., build artifacts, IDE settings). |
| `README.md` | Markdown documentation for your project (Setup steps, features, etc.). |

## 🚀 Why Structure Matters
1.  **Scalability**: Separating `screens`, `widgets`, and `services` prevents `main.dart` from becoming unreadable.
2.  **Teamwork**: defined locations for specific logic help team members avoid merge conflicts and find code quickly.
3.  **Maintenance**: Modular code is easier to debug and test.

## 🛠️ Common Customizations
*   **`lib/services/`**: For API calls and Firebase logic.
*   **`lib/utils/`**: For constants, colors, and helper functions.
*   **`lib/providers/`**: For state management (if using Provider/Riverpod).
