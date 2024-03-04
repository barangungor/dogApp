import 'package:flutter/services.dart';

class OSVersionGetter {
  OSVersionGetter._();
  static final instance = OSVersionGetter._();

  static const channel = MethodChannel("dogapp/channel");
  String oSVersion = "";

  Future<void> getOSVersion() async {
    try {
      final result = await channel.invokeMethod('getOSVersion');
      oSVersion = '$result';
    } on PlatformException {
      oSVersion = "Failed to get OSVersion.";
    }
  }
}
