import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ext_storage/ext_storage.dart';

void main() {
  const MethodChannel channel = MethodChannel('ext_storage');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getExternalStorageDirectory', () async {
  });
}
