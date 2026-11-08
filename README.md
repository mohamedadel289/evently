# Evently

An event discovery and planning app built with Flutter and Firebase.

## Features

- Email/password and Google authentication
- Create, edit, and delete owned events
- Event categories, favorites, and search
- Arabic and English localization
- Light and dark themes
- Cloud Firestore persistence

## Built with

Flutter, Dart, Firebase Authentication, Cloud Firestore, Provider, and Google Sign-In.

## Run locally

Configure Firebase for your platform, then run:

```bash
flutter pub get
flutter run
```

## Security note

Firestore rules restrict event changes to the event owner. Firebase API keys are client configuration, but the Firebase project should still have API restrictions and authorized app domains configured.
