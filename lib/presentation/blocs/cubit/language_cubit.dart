import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foriyana_app/data/data_sources/user_local_data_source.dart';

class LanguageCubit extends Cubit<Locale> {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final String langKey = 'LANG';
  LanguageCubit()
      : super(Locale(UserLocalDataSource.language)); // Default locale

  void switchLanguage(String langCode) async {
    await secureStorage.write(key: langKey, value: langCode);
    UserLocalDataSource.language = langCode;
    emit(Locale(langCode)); // Emit new locale
  }
}
