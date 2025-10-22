<!-- .github/copilot-instructions.md -->
# TLU Face Attendance — AI coding instructions

This file gives short, actionable guidance for AI coding agents working on the TLU Face Attendance Flutter app. Focus on concrete, discoverable patterns and workflows found in the repository.

1) Project overview (big picture)
- Flutter multi-platform app (web, mobile, desktop folders exist). Entry point: `lib/main.dart`.
- Uses Firebase (see `lib/firebase_options.dart` and `pubspec.yaml`): `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage`.
- Camera and scanner features are implemented under `lib/mobile/` using `camera`, `mobile_scanner` and `permission_handler`.

2) Important files and where to look
- App entry: `lib/main.dart` — sets `initialRoute` and Firebase initialization.
- Web routing: `lib/web/routes/web_router.dart` and `lib/web/routes/web_routes.dart`.
- Mobile features: `lib/mobile/` (student pages include face-registration screens, camera UI). Example: `lib/mobile/student/pages/register_face/face_camera_screen.dart` implements camera capture and preview.
- Android native build: `android/` contains Gradle scripts. If Gradle or JVM crashes occur, check `android/hs_err_pid*.log` and the Gradle daemon logs under `%USERPROFILE%\.gradle\daemon\`.
- Project manifest and deps: `pubspec.yaml`.

3) Build, test and debug workflows (what works here)
- Standard Flutter flow works here. On Windows use PowerShell. Common commands:
  - flutter pub get
  - flutter run -d <device> (or `flutter run -d chrome` for web)
  - flutter build apk  (for Android release builds)

- Android Gradle troubleshooting:
  - If the Gradle daemon crashes ("daemon disappeared"), inspect `android/hs_err_pid*.log` and `C:\Users\<user>\.gradle\daemon\<version>\daemon-*.out.log` for JVM crash details.
  - Try `flutter clean` then `flutter pub get` then rebuild. If the crash persists, run the gradle command with `--stacktrace --info` to get more detail:
    - (PowerShell)
    ```powershell
    cd android; .\gradlew.bat assembleDebug --stacktrace --info
    ```

4) Project-specific conventions & patterns
- Firebase is initialized in `main()` using `DefaultFirebaseOptions.currentPlatform` — keep that intact when modifying startup flows.
- Routes are centralized for web in `web/routes/*`. For changes to navigation, update `WebRoutes` and `WebRouter.generateRoute`.
- Mobile camera UI often uses stateful widgets and `CameraController`. Follow existing patterns such as in `face_camera_screen.dart`: initialize controller in `initState()`, dispose in `dispose()`, guard with `_isInitialized` and `_isCapturing` flags.
- When saving files captured by camera, the code uses `path_provider` and `getApplicationDocumentsDirectory()` and then `XFile.saveTo(path)` — follow same approach to keep file placement consistent.

5) External integrations and considerations
- Firebase: Cloud Firestore and Storage are used — changes to data models should be reflected in `lib/core/` (look for services) and in Firestore rules (not included in repo).
- Camera and permissions: `permission_handler` is used — ensure runtime permission checks exist on mobile flows and do not assume permission is granted.

6) Examples of concrete edits an AI may make
- Add a small reusable camera helper in `lib/mobile/common/camera_helper.dart` that wraps `CameraController` initialization and common error handling.
- Fix: when user confirms photo, the current flow calls `Navigator.pop(context)` twice; search for callers expecting a `String` return and keep behavior consistent.

7) What NOT to change without human review
- `android/` Gradle files and `google-services.json` — these are environment-sensitive. Only modify Gradle settings if you can reproduce builds locally and verify.
- `lib/firebase_options.dart` — contains platform keys. Do not alter unless rotating keys with owner's approval.

8) Quick checks before submitting PR
- Run `flutter analyze` and `flutter test` (if tests exist). Keep lints in mind (`analysis_options.yaml`).
- Verify `pubspec.yaml` dependency constraints are compatible with the project's SDK (currently SDK ^3.9.2).

9) Where to leave guidance inside commits or PRs
- If a change requires local device testing (camera, Firebase), mention exact manual steps in PR description: device type (Android/iOS), steps to reproduce, and failing logs (attach `hs_err_pid*.log` if JVM crash).

If anything here is unclear or you'd like me to expand a specific section (e.g., Android JVM crash triage steps or camera permission helper), say which one and I'll refine the file.
