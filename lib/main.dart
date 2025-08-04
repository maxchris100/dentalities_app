import 'dart:developer';
import 'dart:io';

import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/core/util/appdevice.dart';
import 'package:dentalities/core/util/appversion.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:dentalities/presentation/blocs/cubit/home_cubit.dart';
import 'package:dentalities/presentation/views/login/signup_page.dart';
import 'package:dentalities/presentation/views/profile/add_delivery_address_page.dart';
import 'package:dentalities/presentation/views/profile/delivery_address_page.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dentalities/core/constant/constant.dart';
import 'package:dentalities/data/data_sources/user_local_data_source.dart';
import 'package:dentalities/generated/l10n.dart';
import 'package:dentalities/presentation/blocs/cubit/auth_cubit.dart';
import 'package:dentalities/presentation/blocs/cubit/language_cubit.dart';
import 'package:dentalities/presentation/views/index/home_page.dart';
import 'package:dentalities/presentation/views/login/login_page.dart';
import 'package:dentalities/presentation/views/startup/welcome_page.dart';

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
  await Constant.initializeUserLocalDataSource();
  Constant.initNavigatorKey();
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
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return OverlaySupport.global(
            child: MaterialApp(
              title: 'Dentalities',
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
                // Locale('en', 'SG'), // Singapore
                // Locale('th', 'TH'), // Thai (Thailand)
                // Locale('fil', 'PH'), // Filipino (Philippines)
              ],
              debugShowCheckedModeBanner: false,
              home: AuthWrapper(),
              navigatorKey: Constant.getNavigatorKey(),
              routes: AppRouter.onGenerateRoute(),
              onGenerateRoute: (settings) {
                final args = settings.arguments as Map<String, dynamic>?;
                if (settings.name == AppRouter.deliveryAddress) {
                  return MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<HomeCubit>(),
                      child: DeliveryAddressPage(),
                    ),
                  );
                }
                if (settings.name == AppRouter.deliveryAddressAdd) {
                  return MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<HomeCubit>(),
                      child: AddEditDeliveryAddressPage(),
                    ),
                  );
                }
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
                  backgroundColor: Colors.white, // warna dasar tetap putih
                  foregroundColor: Colors.black, // warna teks/icon
                  elevation: 0, // hilangkan bayangan default
                  scrolledUnderElevation:
                      0, // HINDARI efek scroll bawaan Material 3
                  surfaceTintColor:
                      Colors.transparent, // HINDARI tinting Material 3
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
                textSelectionTheme: TextSelectionThemeData(
                  cursorColor: Colors.blue,
                  selectionHandleColor: Colors.blue,
                ),
                inputDecorationTheme: InputDecorationTheme(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[300]!, width: 1),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(12)),
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
        if (Constant.getQAEnvironment() &&
            Constant.userLocalDataSource.token != null) {
          return HomePage();
        }
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AuthAuthenticated) {
          return HomePage();
        } else if (state is AuthInitial) {
          return LoginPage();
        } else if (state is AuthInitialStartup) {
          return LoginPage();
        }
        return LoginPage();
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
