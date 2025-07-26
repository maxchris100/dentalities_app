import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/error/exceptions.dart';
import '../models/user_model.dart';

const cachedToken = 'token';
const cachedUser = 'USER';

class UserLocalDataSource {
  static UserModel? _userData;
  static String? _token;
  String? get token => _token;
  UserModel? get userData => _userData;

  static String language = 'en';

  final FlutterSecureStorage secureStorage;
  final SharedPreferences sharedPreferences;

  UserLocalDataSource({
    required this.sharedPreferences,
    required this.secureStorage,
  });
  Future<void> init() async {
    try {
      _token = await getToken();
      UserModel user = await getUser();
      _userData = user;
    } catch (_) {
      // No _token or user, bisa diabaikan
    }
  }

  Future<String> getToken() async {
    String? __token = await secureStorage.read(key: cachedToken);
    if (__token != null) {
      _token = __token;
      return Future.value(__token);
    } else {
      throw CacheException();
    }
  }

  Future<void> saveToken(String __token) async {
    _token = __token;
    await secureStorage.write(key: cachedToken, value: __token);
  }

  Future<UserModel> getUser() async {
    if (sharedPreferences.getBool('first_run') ?? true) {
      await secureStorage.deleteAll();
      sharedPreferences.setBool('first_run', false);
    }

    final __token = await getToken();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(__token);
    UserModel user = UserModel.fromMap(decodedToken);
    _userData = user;
    _token = __token;
    return Future.value(user);
  }

  Future<void> saveUser(UserModel user) {
    _userData = user;
    return sharedPreferences.setString(
      cachedUser,
      userModelToJson(user),
    );
  }

  Future<bool> isTokenAvailable() async {
    String? __token = await secureStorage.read(key: cachedToken);
    return Future.value((_token != null));
  }

  Future<void> clearCache() async {
    print("@Clear CACHE");
    _userData = null;
    _token = null;
    await secureStorage.deleteAll();
    await sharedPreferences.remove(cachedUser);
    print("@Clear CACHE SUCCESS");
  }
}
