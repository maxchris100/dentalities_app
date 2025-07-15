import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/error/exceptions.dart';
import '../models/user_model.dart';

abstract class UserLocalDataSource {
  UserLocalDataSource(Object object);
  static UserModel? userData;
  static String? token;
  static String language = 'en';

  Future<String> getToken();

  Future<UserModel> getUser();

  Future<void> saveToken(String token);

  Future<void> saveUser(UserModel user);

  Future<void> clearCache();

  Future<bool> isTokenAvailable();
}

const cachedToken = 'TOKEN';
const cachedUser = 'USER';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final FlutterSecureStorage secureStorage;
  final SharedPreferences sharedPreferences;
  UserLocalDataSourceImpl(
      {required this.sharedPreferences, required this.secureStorage});

  @override
  Future<String> getToken() async {
    String? token = await secureStorage.read(key: cachedToken);
    if (token != null) {
      return Future.value(token);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveToken(String token) async {
    // print("token login: $token");
    await secureStorage.write(key: cachedToken, value: token);
  }

  @override
  Future<UserModel> getUser() async {
    if (sharedPreferences.getBool('first_run') ?? true) {
      await secureStorage.deleteAll();
      sharedPreferences.setBool('first_run', false);
    }

    final token = await getToken();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    // User user = User.fromJson(decodedToken);
    UserModel user = UserModel.fromJson(decodedToken);
    UserLocalDataSource.userData = user; //set static
    UserLocalDataSource.token = token; //set static
    return Future.value(UserModel.fromJson(decodedToken));
    // final jsonString = sharedPreferences.getString(cachedUser);
    // if (jsonString != null) {
    //   return Future.value(userModelFromJson(jsonString));
    // } else {
    //   throw CacheException();
    // }
  }

  @override
  Future<void> saveUser(UserModel user) {
    UserLocalDataSource.userData = user; //set static
    return sharedPreferences.setString(
      cachedUser,
      userModelToJson(user),
    );
  }

  @override
  Future<bool> isTokenAvailable() async {
    String? token = await secureStorage.read(key: cachedToken);
    return Future.value((token != null));
  }

  @override
  Future<void> clearCache() async {
    UserLocalDataSource.userData = null; //set static
    UserLocalDataSource.token = null;
    await secureStorage.deleteAll();
    await sharedPreferences.remove(cachedUser);
  }
}
