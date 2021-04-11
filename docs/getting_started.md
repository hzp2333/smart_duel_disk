# Getting started

## Pre-Requisites

1. Download and install [Flutter](https://flutter.dev/docs/get-started/install). Just ensure that you are using version 2 or higher.
1. Download and install the [Dart SDK](https://dart.dev/get-dart). On windows, there is no need to install dart separately because the Flutter comes with a dart sdk in `\bin\cache\dart-sdk`
1. Download and install any IDE to edit the code. [Android Studio](https://developer.android.com/studio/install) is highly recommended

## Building the app

1. Getting a valid `google-services.json` file
    1. Create a [Firebase](https://console.firebase.google.com) account.
    1. Create an application with any name you desire. Ensure that the package name `com.crowncorp.smartdueldisk` so that it can be used to build the application.
    1. Download the `google-services.json` for the application you created
    1. Copy the file over into `android/app`
1. Firebase Database and collections. The app uses firebase collection for getting pre built deck data. There are 2 options: stubbing out the response or configuring a firebase collection for you app from earlier. (I am not sure how to work with Firebase yet, so I will explain where I mocked it out)

    1. Find the class `FirebaseCloudDatabaseProvider`
    1. Alter the method `getPreBuiltDeckCardIds` to return a Future with a list of card ids. A list of valid ids for speed duels is provided by the [YgoPro Api Endpoint](https://db.ygoprodeck.com/api/v7/cardinfo.php?format=Speed%20Duel). Any card id can be included in the list but only the speed duel applicable cards will be selected from your list. (The app will throw an exception if your deck is empty, so ensure that all your cards are valid beforehand)
        An example implementation:

             ```dart
                 Future<Iterable<int>> getPreBuiltDeckCardIds(PreBuiltDeck deck) async {
                     final completer = new Completer<List<int>>();
                     List<int> myList = List<int>();
                     myList.add(46986414);
                     myList.add(32207100);
                     completer.complete(myList);
                     return completer.future;
                 }
             ```

1. Install all of the dependencies of the application using the command `flutter pub get`
1. Run the file watcher to ensure that all the route files and di files get generated before compiling the app, using the command `flutter packages pub run build_runner watch`
