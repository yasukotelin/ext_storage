# ext_storage

ext_storage is minimal flutter plugin that provides external storage path and external public storage path.

https://pub.dev/packages/ext_storage

## Features

> **NOTE** This plugin is only supported Android.

ExtStorage package calls Android native code, `Environment.getExternalStorageDirectory()` and `Environment.getExternalStoragePublicDirectory()`.

| ExtStorage                                     | Andorid Native                                  |
|------------------------------------------------|-------------------------------------------------|
| ExtStorage.getExternalStorageDirectory()       | Environment.getExternalStorageDirectory()       |
| ExtStorage.getExternalStoragePublicDirectory() | Environment.getExternalStoragePublicDirectory() |

`ExtStorage.getExternalStoragePublicDirectory()` needs Public Directory Type argument same as native `getExternalStoragePublicDirectory()`.

| ExtStorage                         | Android Native                      |
|------------------------------------|-------------------------------------|
| ExtStorage.DIRECTORY_MUSIC         | Environment.DIRECTORY_MUSIC         |
| ExtStorage.DIRECTORY_PODCASTS      | Environment.DIRECTORY_PODCASTS      |
| ExtStorage.DIRECTORY_RINGTONES     | Environment.DIRECTORY_RINGTONES     |
| ExtStorage.DIRECTORY_ALARMS        | Environment.DIRECTORY_ALARMS        |
| ExtStorage.DIRECTORY_NOTIFICATIONS | Environment.DIRECTORY_NOTIFICATIONS |
| ExtStorage.DIRECTORY_PICTURES      | Environment.DIRECTORY_PICTURES      |
| ExtStorage.DIRECTORY_MOVIES        | Environment.DIRECTORY_MOVIES        |
| ExtStorage.DIRECTORY_DOWNLOADS     | Environment.DIRECTORY_DOWNLOADS     |
| ExtStorage.DIRECTORY_DCIM          | Environment.DIRECTORY_DCIM          |
| ExtStorage.DIRECTORY_DOCUMENTS     | Environment.DIRECTORY_DOCUMENTS     |
| ExtStorage.DIRECTORY_SCREENSHOTS   | Environment.DIRECTORY_SCREENSHOTS   |
| ExtStorage.DIRECTORY_AUDIOBOOKS    | Environment.DIRECTORY_AUDIOBOOKS    |

## Installation

Add `ext_storage` as a dipendency in your project `pubspeck.yaml`.

```yaml
dependencies:
  ext_storage:
```

and run the `flutter pub get` to install.

## Usage

First, you write import `ext_storage` package.

```dart
import 'package:ext_storage/ext_storage.dart';
```

And you can call two functions.

```dart
void _example1() async {
  var path = await ExtStorage.getExternalStorageDirectory();
  print(path);  // /storage/emulated/0
}

void _example2() async {
  var path = await ExtStorage.getExternalStoragePublicDirectory(ExtStorage.DIRECTORY_PICTURES);
  print(path);  // /storage/emulated/0/Pictures
}
```

## Author

yasukotelin

## LICENCE

MIT LICENCE
