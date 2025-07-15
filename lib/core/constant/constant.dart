import 'package:flutter/material.dart';
import 'package:flutter_alice/alice.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foriyana_app/data/data_sources/user_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constant {
  static String baseApiUrl = dotenv.env['BASE_API_URL'] ?? "";
  static bool getQAEnvironment() {
    return dotenv.env['ENV'] == 'development';
  }

  static Alice? alice;

  static GlobalKey<NavigatorState> getNavigatorKey() {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    if (getQAEnvironment()) {
      alice = Alice();
      return alice!.getNavigatorKey()!;
    }
    return navigatorKey;
  }

  static late UserLocalDataSource userLocalDataSource;
  static Future<void> initializeUserLocalDataSource() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final secureStorage = const FlutterSecureStorage();

    userLocalDataSource = UserLocalDataSourceImpl(
      sharedPreferences: sharedPreferences,
      secureStorage: secureStorage,
    );
  }
}
