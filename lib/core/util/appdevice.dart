import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';

class AppDevice {
  static Map<String, dynamic> allInfo = {};

  static Future<void> getDeviceInfo() async {
    try {
      final deviceInfoPlugin = DeviceInfoPlugin();
      final deviceInfo = await deviceInfoPlugin.deviceInfo;
      allInfo = deviceInfo.data;
    } catch (e) {
      log("@MAP Failed to get device info: $e");
    }
  }
}
