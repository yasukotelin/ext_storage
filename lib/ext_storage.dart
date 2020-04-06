import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class ExtStorage {
  static const MethodChannel _channel = const MethodChannel('ext_storage');

  static final String DIRECTORY_MUSIC = "Music";

  static final String DIRECTORY_PODCASTS = "Podcasts";

  static final String DIRECTORY_RINGTONES = "Ringtones";

  static final String DIRECTORY_ALARMS = "Alarms";

  static final String DIRECTORY_NOTIFICATIONS = "Notifications";

  static final String DIRECTORY_PICTURES = "Pictures";

  static final String DIRECTORY_MOVIES = "Movies";

  static final String DIRECTORY_DOWNLOADS = "Download";

  static final String DIRECTORY_DCIM = "DCIM";

  static final String DIRECTORY_DOCUMENTS = "Documents";

  static final String DIRECTORY_SCREENSHOTS = "Screenshots";

  static final String DIRECTORY_AUDIOBOOKS = "Audiobooks";

  static Future<String> getExternalStorageDirectory() async {
    if (!Platform.isAndroid) {
      throw UnsupportedError("Only android supported");
    }
    return await _channel.invokeMethod('getExternalStorageDirectory');
  }

  static Future<String> getExternalStoragePublicDirectory(String type) async {
    if (!Platform.isAndroid) {
      throw UnsupportedError("Only android supported");
    }
    return await _channel
        .invokeMethod('getExternalStoragePublicDirectory', {"type": type});
  }
}
