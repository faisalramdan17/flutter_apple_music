# Kuncie Apple Music

A new Flutter project using iTunes API for Music Player.

## Getting Started for Flutter

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Supported Devices (OS)

To find out if your device is compatible with the app, check the list of supported devices (OS) :

- iOS Mobile App : iOS Version 9.0 (Monarch) & above
- Android Mobile App : Android 4.4 KitKat (API level 19) & above
- Web App (Mobile Size-Mode) : Chrome 84 & above
- MacOX Desktop App (Mobile Size-Mode) : macOS Sierra 10.12.2 & above
- Windows Desktop App (Mobile Size-Mode) : Windows 7 & above


## Supported Features

This music player app is supported by the amazing features.

- ✅ Browse albums and songs then play music with selecting song.
- ✅ Search song by artist name then play music with selecting song.
- ✅ Play music with run in the background or with the screen turned off.
- [x] Music controls available : Play, Pause, Stop, Seek (Progress Indicator), Fast (Rewind & Forward) and Repeat One Song. 
- [x] Music controls interacting with headset buttons, the Android lock screen and notification, iOS control center, wearables, AndroidAuto (CarPlay) or smart watch.

## Requirements to Build The App

### Dependency

#### State Management, Route Management, Dependency Injection, & Utility 

- [get](https://pub.dartlang.org/packages/get) : It combines high-performance state management, intelligent dependency injection, and route management quickly and practically.
- [intl](https://pub.dartlang.org/packages/intl) => Provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.
- [url_strategy](https://pub.dartlang.org/packages/url_strategy)
- [url_launcher](https://pub.dartlang.org/packages/url_launcher)

#### Audio Services

- [just_audio](https://pub.dartlang.org/packages/just_audio)
- [just_audio_libwinmedia](https://pub.dartlang.org/packages/just_audio_libwinmedia)
- [audio_service](https://pub.dartlang.org/packages/audio_service)

#### Images Asset & Library

- [lottie](https://pub.flutter-io.cn/packages/lottie)
- [cached_network_image](https://pub.flutter-io.cn/packages/cached_network_image)
- [transparent_image](https://pub.flutter-io.cn/packages/transparent_image)

#### Fonts & Icons

- [google_fonts](https://pub.dartlang.org/packages/google_fonts)
- [iconsax](https://pub.dartlang.org/packages/iconsax)
- [font_awesome_flutter](https://pub.dartlang.org/packages/font_awesome_flutter)

#### Animations & Elements

- [flutter_animated_dialog](https://pub.dartlang.org/packages/flutter_animated_dialog)
- [flutter_spinkit](https://pub.dartlang.org/packages/flutter_spinkit)
- [fade_shimmer](https://pub.dartlang.org/packages/fade_shimmer)
- [badges](https://pub.dartlang.org/packages/badges)
- [step_progress_indicator](https://pub.dartlang.org/packages/step_progress_indicator)
- [liquid_pull_to_refresh](https://pub.dartlang.org/packages/liquid_pull_to_refresh)


## Instructions to Build and Deploy The App

### Set up 

#### 1. Clone The Repo

```bash
$ git clone https://github.com/faisalramdan17/kuncie_music.git
$ cd kuncie_music
```

#### 2. Running

```bash
flutter run
```



## Solving Errors

There are several potential errors when run or debug this music player app and you can find the some solutions how to fix it.

###  XMLHttpRequest (API Cors) Error in Flutter Web

It seems like `CORS error` is well-known issue in the web field. But it could be critical error.

You can check forum discusing at stackoverflow.com by clicking this link :
https://stackoverflow.com/questions/65630743/how-to-solve-flutter-web-api-cors-error-only-with-dart-code/66879350

In order to make the process easier I highly recommend to use `flutter_cors` Dart Package.
You can check this link : https://pub.dev/packages/flutter_cors


```bash
dart pub global activate flutter_cors
```

```bash
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

```bash
fluttercors --disable
```
