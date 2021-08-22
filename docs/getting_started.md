# Getting started

## Pre-requisites

1. Download and install [Flutter](https://flutter.dev/docs/get-started/install). Make sure to install the latest version of the release channel.
1. Download and install any IDE to edit the code. Using [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio/install) is recommended.
1. Download and install the Flutter and Dart plugins in your IDE.

## Running the app (develop)

1. Create an empty `secrets.env` file
1. Run with `flutter run -d chrome -t lib/main_web.dart` or `flutter run -d macos`

## Building the app (release)

1. Getting a valid `google-services.json` file
    1. Create a [Firebase](https://console.firebase.google.com) project.
    1. Create an application with any name you desire. Ensure that the package name `com.crowncorp.smartdueldisk` so that it can be used to build the application.
    1. Download the `google-services.json` for the application you created.
    1. Copy the file over into `android/app`.
1. Install all of the dependencies of the application using the command `flutter pub get`.
1. The pre built deck data is stored in the Firebase Firestore. It's possible to use mock data instead of data from the Firestore. If you insist on creating a working version of the Firestore collection yourself, please contact the owner on GitHub or Discord.
    1. Find the class `FirebaseCloudDatabaseProvider`.
    1. Alter the method `getPreBuiltDeckCardIds` to return a Future with a list of card ids. A list of valid ids for speed duels is provided by the [YgoPro Api Endpoint](https://db.ygoprodeck.com/api/v7/cardinfo.php?format=Speed%20Duel). Any card id can be included in the list but only the speed duel applicable cards will be selected from your list. (The app will throw an exception if your deck is empty, so ensure that all your cards are valid beforehand).
An example implementation:

```dart
Future<Iterable<int>> getPreBuiltDeckCardIds(PreBuiltDeck deck) async {
    return [46986414, 32207100]
}
```

You should now be able to build and run the app.

If you add a new route, set up a class for dependency injection, create a sealed class, ... you'll need to initialise the code generation.
To generate the code once, execute the following command: `flutter pub run build_runner build --delete-conflicting-outputs`
To generate the code every time you make a change, execute the following command: `flutter pub run build_runner watch --delete-conflicting-outputs`
