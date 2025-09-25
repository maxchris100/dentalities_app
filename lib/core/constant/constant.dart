import 'dart:convert';
import 'dart:developer';

import 'package:dentalities/data/models/recent_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alice/alice.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dentalities/data/data_sources/user_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constant {
  static String baseApiUrl = dotenv.env['BASE_API_URL'] ?? "";
  static bool getQAEnvironment() {
    return dotenv.env['ENV'] == 'staging';
  }

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static Alice? alice;
  static SharedPreferences? sharedPreferences;
  static FlutterSecureStorage? secureStorage;

  static void initNavigatorKey() {
    if (getQAEnvironment()) {
      alice = Alice(navigatorKey: navigatorKey);
    }
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

  static Future<List<RecentSearch>> getRecentSearch() async {
    log("@MAP getRecentSearch");
    List<RecentSearch> list = [];
    try {
      String? recentSearch =
          userLocalDataSource.sharedPreferences.getString('recent_search');
      if (recentSearch != null) {
        List res = json.decode(recentSearch);
        list = RecentSearch.fromList(res);
        list = list.where((element) => element.name != '').toList();
      }
    } catch (ex) {
      log("@MAP getRecentSearch Error: $ex");
    }
    return list;
  }

  static Future<void> saveRecentSearch(RecentSearch text) async {
    log("@MAP saveRecentSearch");
    List<RecentSearch> list = await getRecentSearch();
    try {
      if (list.where((e) => e.name == text.name).isNotEmpty) {
        list.removeWhere((e) => e.name == text.name);
      }
      if (list.length >= 10) {
        list.removeLast();
      }
      list.insert(0, text);
    } catch (ex) {
      log("@MAP saveRecentSearch Error $text: $ex");
    }
    String listjson = json.encode(list);
    userLocalDataSource.sharedPreferences.setString('recent_search', listjson);
  }

  static Future<List<RecentSearch>> removeRecentSearch(
      RecentSearch text) async {
    String? recentSearch =
        userLocalDataSource.sharedPreferences.getString('recent_search');
    List<RecentSearch> list = [];
    if (recentSearch != null) {
      try {
        List res = json.decode(recentSearch);
        list = RecentSearch.fromList(res);
        list.removeWhere((element) => element.name == text.name);
      } catch (ex) {
        log("@MAP removeRecentSearch Error $text: $ex");
      }
      String listjson = json.encode(list);
      userLocalDataSource.sharedPreferences
          .setString('recent_search', listjson);
      log("@MAP removeRecentSearch: $listjson");
    }
    return list;
  }

  static Future<void> resetRecentSearch() async {
    await userLocalDataSource.sharedPreferences.remove('recent_search');
  }
}
