# Exploring Flutter & Dart Fundamentals

## 1. Flutter Architecture
Flutter is Google's UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.

### Core Layers
1.  **Framework Layer (Dart)**: The layer developers interact with. It contains the Material and Cupertino libraries, widgets, rendering, animation, painting, and gestures.
2.  **Engine Layer (C++)**: Handles low-level rendering using Skia (or Impeller), text layout, file I/O, network I/O, and accessibility support. It also manages the Dart runtime and garbage collection.
3.  **Embedder Layer (Platform Specific)**: Written in platform-specific languages (Java/Kotlin for Android, Swift/Objective-C for iOS). It initializes the Flutter engine, provides the entry point, and manages the event loop and platform channels.

**Key Concept**: Flutter controls every pixel on the screen. Instead of using native OEM widgets, it draws its own widgets, ensuring consistency across all platforms.

## 2. The Widget Tree
In Flutter, *everything* is a widget. The UI is built by composing widgets into a tree structure.

### Types of Widgets
*   **StatelessWidget**: Immutable configuration. Used for static content that doesn't change once built (e.g., Icons, Text labels).
    *   *Example*: A `Text` widget displaying a welcome message.
*   **StatefulWidget**: Mutable configuration. Maintains state that can change over time, triggering a rebuild of the UI (e.g., Checkboxes, Slider, text input).
    *   *Example*: A generic `Counter` widget.

## 3. Dart Language Essentials
Dart is optimized for UI creation.

*   **Classes & Objects**: Dart is purely object-oriented. Even functions and numbers are objects.
*   **Async/Await**: Simplifies asynchronous programming, crucial for I/O operations without blocking the UI thread.
*   **Null Safety**: Helps catch null reference errors at compile-time. Variables are non-nullable by default unless declared with `?`.
*   **Type Inference**: The compiler can infer types (e.g., `var name = 'Aanya';` is inferred as `String`).

## 4. How to Run the Examples
Since this environment does not have a local Flutter emulator, you can run these examples easily in your browser using **DartPad**.

### Running Dart Basics
1.  Open [DartPad](https://dartpad.dev/).
2.  Copy the code from `dart_basics.dart`.
3.  Paste it into the editor pane.
4.  Click **Run**.
5.  Observe the console output on the right.

### Running Flutter Apps
1.  Open [DartPad](https://dartpad.dev/).
2.  Copy the code from `simple_ui.dart` or `counter_app.dart`.
3.  Paste it into the editor pane.
4.  Click **Run**.
5.  Wait a moment for the UI to compile. The execution pane on the right will switch to "UI" mode and display the app.

---

## 5. Lesson Review & Understanding

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

## 1. Structure Overview
We have documented the role of every file and folder in this project in a dedicated guide.

👉 **[Read the Full Project Structure Guide](PROJECT_STRUCTURE.md)**

## 2. Key Takeaways
*   **`lib/`**: Contains all your Dart code.
*   **`pubspec.yaml`**: Manages dependencies and assets.
*   **`android/` & `ios/`**: Platform-specific configuration.

## 3. Ide Setup
**Task**: Replace the image below with a screenshot of your IDE's file explorer showing the folder tree.

![IDE Folder Structure](PLACEHOLDER_FOLDER_STRUCTURE_SCREENSHOT)








