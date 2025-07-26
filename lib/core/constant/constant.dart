import 'package:flutter/material.dart';
import 'package:flutter_alice/alice.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dentalities/data/data_sources/user_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constant {
  static String baseApiUrl = dotenv.env['BASE_API_URL'] ?? "";
  static bool getQAEnvironment() {
    return dotenv.env['ENV'] == 'development';
  }

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static Alice? alice;
  static SharedPreferences? sharedPreferences;
  static FlutterSecureStorage? secureStorage;

  static GlobalKey<NavigatorState> initNavigatorKey() {
    if (getQAEnvironment()) {
      alice = Alice();
      return alice!.getNavigatorKey()!;
    }
    return navigatorKey;
  }

  static GlobalKey<NavigatorState> getNavigatorKey() {
    if (getQAEnvironment()) {
      return alice!.getNavigatorKey()!;
    }
    return navigatorKey;
  }

  static late UserLocalDataSource userLocalDataSource;
  static Future<void> initializeUserLocalDataSource() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();

    userLocalDataSource = UserLocalDataSource(
      sharedPreferences: sharedPreferences,
      secureStorage: secureStorage,
    );
    await userLocalDataSource.init();
  }
}
