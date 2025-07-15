import 'dart:developer';
import 'dart:io';

import 'package:foriyana_app/core/router/app_router.dart';
import 'package:foriyana_app/core/util/appdevice.dart';
import 'package:foriyana_app/core/util/appversion.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foriyana_app/core/constant/constant.dart';
import 'package:foriyana_app/data/data_sources/user_local_data_source.dart';
import 'package:foriyana_app/generated/l10n.dart';
import 'package:foriyana_app/presentation/blocs/cubit/auth_cubit.dart';
import 'package:foriyana_app/presentation/blocs/cubit/language_cubit.dart';
import 'package:foriyana_app/presentation/views/home/home_page.dart';
import 'package:foriyana_app/presentation/views/login/login_page.dart';
import 'package:foriyana_app/presentation/views/startup/welcome_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter is initialized
  // await di.init();
  // await PushNotificationService.initialize();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ); // To turn off landscape mode
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await AppVersion.getPackageInfo();
  await AppDevice.getDeviceInfo();
  HttpOverrides.global = MyHttpOverrides();
  // await CFirebase.init();

  await dotenv.load(fileName: ".env");
  Constant.initializeUserLocalDataSource();
  await setLanguage();
  runApp(MyApp());
}

Future setLanguage() async {
  final String langKey = 'LANG';
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  String? langCode = await secureStorage.read(key: langKey);
  if (langCode != null && langCode.isNotEmpty) {
    UserLocalDataSource.language = langCode;
    log("@LANGUAGE: $langCode");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit()..checkAuthStatus(),
        ),
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return OverlaySupport.global(
            child: MaterialApp(
              title: 'Foriyana App',
              locale: locale,
              localeResolutionCallback: (locale, supportedLocales) {
                // Handle locale resolution here
                return locale;
              },
              localizationsDelegates: [
                S.delegate,
                // AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('en', 'US'), // English
                Locale('ms', 'MY'), // Malay (Malaysia)
                Locale('id', 'ID'), // Indonesian
                Locale('en', 'SG'), // Singapore
                Locale('th', 'TH'), // Thai (Thailand)
                Locale('fil', 'PH'), // Filipino (Philippines)
              ],
              debugShowCheckedModeBanner: false,
              home: AuthWrapper(),
              navigatorKey: Constant.getNavigatorKey(),
              routes: AppRouter.onGenerateRoute(),
              onGenerateRoute: (settings) {
                final args = settings.arguments as Map<String, dynamic>?;
                // if (settings.name == '/policy-insurance') {}
              },
              theme: ThemeData(
                useMaterial3: true,
                fontFamily: 'OpenSans',
                // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.white,
                  brightness: Brightness.light,
                ).copyWith(
                  background: Colors.white,
                  surface: Colors.white,
                ),
                bottomSheetTheme: BottomSheetThemeData(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                ),
                appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                  ),
                ),
                listTileTheme: ListTileThemeData(
                  selectedColor: Colors.transparent,
                  selectedTileColor: Colors.transparent,
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                scaffoldBackgroundColor: Colors.white,
                cardColor: Colors.white, // khusus Card
                cardTheme: CardTheme(
                  color: Colors.white,
                  surfaceTintColor: Colors.transparent, // 👈 this is the key
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AuthAuthenticated) {
          return HomePage();
        } else if (state is AuthInitial) {
          return LoginPage();
        } else if (state is AuthInitialStartup) {
          return WelcomePage();
        }
        return Container();
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
