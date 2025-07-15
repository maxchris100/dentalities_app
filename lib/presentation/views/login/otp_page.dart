import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:foriyana_app/data/data_sources/user_local_data_source.dart';
import 'package:foriyana_app/data/models/auth_response_model.dart';
import 'package:foriyana_app/data/models/user_model.dart';
import 'package:foriyana_app/generated/l10n.dart';
import 'package:foriyana_app/presentation/blocs/cubit/auth_cubit.dart';
import 'package:foriyana_app/presentation/blocs/cubit/otp_cubit.dart';
import 'package:foriyana_app/presentation/widgets/filter_language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> with WidgetsBindingObserver {
  bool isLoading = false;
  bool isLoadingResend = false;
  String selectedLocal = "ms";
  int otpLength = 6;
  final List<TextEditingController> controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  final List<FocusNode> focusNodesListener = List.generate(
    6,
    (index) => FocusNode(),
  );
  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  var args;
  late final UserLocalDataSource userLocalDataSource;

  // void onChanged(String value, int index) {
  //   if (value.isNotEmpty && index < 5) {
  //     FocusScope.of(context).nextFocus();
  //   } else if (value.isEmpty && index > 0) {
  //     FocusScope.of(context).previousFocus();
  //   }
  // }

  String getOTP() {
    return controllers.map((c) => c.text).join();
  }

  Future<void> _initializeUserLocalDataSource() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final secureStorage = const FlutterSecureStorage();

    userLocalDataSource = UserLocalDataSourceImpl(
      sharedPreferences: sharedPreferences,
      secureStorage: secureStorage,
    );
  }

  void checkOtpComplete() {
    final otp = controllers.map((c) => c.text).join().trim();
    if (otp.length == otpLength) {
      print("OTP Completed: $otp");
      verifyOtp();
      // You can call your submit logic here
    }
  }

  void onBackspacePressed(String value, int index) {
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  void onChanged(String value, int index) {
    if (value.length == 1 && index < otpLength - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
    // if (value.length == 1 && index < 6) {
    //   FocusScope.of(context)
    //       .requestFocus(focusNodes[index + 1]);
    // }
    // if (value.length > 1) {
    //   final pastedValues = value.split('');
    //   for (int i = 0;
    //       i < pastedValues.length && i < 6;
    //       i++) {
    //     controllers[i].text = pastedValues[i];
    //   }
    //   FocusScope.of(context).unfocus(); // optional
    // }
    // else {
    //   onChanged(value, index);
    // }
  }

  void handleKeyEvent(KeyEvent event, int index) {
    if (event.logicalKey == LogicalKeyboardKey.backspace &&
        controllers[index].text.isEmpty &&
        index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      controllers[index - 1].selection = TextSelection(
        baseOffset: 0,
        extentOffset: controllers[index - 1].text.length,
      );
    }
  }

  Future<void> checkClipboardForOtp() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    final text = clipboardData?.text?.trim() ?? '';

    if (text.length == 6 && RegExp(r'^\d{6}$').hasMatch(text)) {
      for (int i = 0; i < 6; i++) {
        controllers[i].text = text[i];
      }
      FocusScope.of(context).unfocus();
      print('OTP auto-filled from clipboard: $text');
    }
  }

  @override
  void initState() {
    _initializeUserLocalDataSource();

    for (int i = 0; i < otpLength; i++) {
      controllers[i].addListener(checkOtpComplete);
    }
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    for (var focusNode in focusNodesListener) {
      focusNode.dispose();
    }
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      print('🔄 App resumed');
      if (controllers[0].text.isEmpty) {
        await checkClipboardForOtp();
      }
      // Check clipboard again or refresh data
    } else if (state == AppLifecycleState.paused) {
      print('⏸️ App paused');
    }
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  Future<void> verifyOtp() async {
    String otp = getOTP();
    if (otp.length < 6) {
      debugPrint("OTP tidak valid");
      return;
    }

    FocusScope.of(context).unfocus(); // optional
    setState(() {
      isLoading = true;
    });

    try {
      var response = await http.post(
        Uri.parse(
          'https://stg-auth-service-2xr35.ondigitalocean.app/sso/verify-otp',
        ),
        headers: <String, String>{
          'authorization': 'Bearer 6eyw7n4kk9063sivf6ubt8dz5kyhwl',
        },
        body: {
          'email': args["email"],
          'phoneNumber': args["phoneNumber"],
          "otp": getOTP(),
          "redirectUrl": "http://localhost:3000",
        },
      );
      var res = json.decode(response.body);
      print(response.body);
      if (response.statusCode == 201) {
        String? redirectUrl = res['redirect_url'];
        if (res['message'] == 'OTP verified successfully' && redirectUrl != null
            // && redirectUrl.contains("myapp://customer-portal.app")
            ) {
          Uri uri = Uri.parse(redirectUrl);
          String? sessionCode = uri.queryParameters['session_code'];
          _handleSessionCode(sessionCode);
        } else {
          Fluttertoast.showToast(
            msg: res["message"],
            backgroundColor: Colors.red,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: res["message"],
          backgroundColor: Colors.red,
        );
      }
    } catch (ex) {
      Fluttertoast.showToast(
        msg: "Error Internal",
        backgroundColor: Colors.red,
      );
      print(ex);
    }

    controllers.forEach((c) => c.clear());
    setState(() {
      isLoading = false;
    });
  }

  Future<void> resendOtp(BuildContext context) async {
    setState(() {
      isLoadingResend = true;
    });
    try {
      var response = await http.post(
        Uri.parse('https://stg-auth-service-2xr35.ondigitalocean.app/otp/send'),
        headers: <String, String>{
          'authorization': 'Bearer 6eyw7n4kk9063sivf6ubt8dz5kyhwl',
        },
        body: {'email': args["email"], 'phoneNumber': args["phoneNumber"]},
      );
      var res = json.decode(response.body);
      if (response.statusCode == 201 &&
          res["message"] == "OTP sent successfully") {
        Fluttertoast.showToast(
          msg: res["message"],
          backgroundColor: Colors.green,
        );
        context.read<OtpCubit>().resetTimer();
      } else {
        Fluttertoast.showToast(
          msg: res["message"],
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      debugPrint('Login error: $e');
    }
    controllers.forEach((c) => c.clear());
    setState(() {
      isLoadingResend = false;
    });
  }

  // Function to handle session code and perform POST request
  void _handleSessionCode(String? sessionCode) async {
    if (sessionCode == null || sessionCode.isEmpty) {
      debugPrint("Error: Session code is null or empty.");
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });
      var response = await http.post(
        Uri.parse(
          'https://stg-auth-service-2xr35.ondigitalocean.app/sso/login',
        ),
        headers: <String, String>{
          'authorization': 'Bearer 6eyw7n4kk9063sivf6ubt8dz5kyhwl',
        },
        body: {'session_code': sessionCode},
      );

      debugPrint('Response Code: ${response.body}');

      var responseLogin = authResponseModelFromJson(response.body);
      debugPrint('responseLogin.token: ${responseLogin.token}');

      // Save token
      await userLocalDataSource.saveToken(responseLogin.token);

      // ignore: use_build_context_synchronously
      UserModel user = await userLocalDataSource.getUser();
      await userLocalDataSource.saveUser(user);
      // context.read<AuthCubit>().getUserInformation(responseLogin.token);

      // context.read<AuthCubit>().checkAuthStatus();

      // Navigate to home and remove login from backstack
      // ignore: use_build_context_synchronously

      setState(() {
        isLoading = false;
      });
      context.read<AuthCubit>().saveToken(responseLogin.token);
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      debugPrint('Login error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)?.settings.arguments as Map?;

    // isLoading = false;

    return BlocProvider(
      create: (_) => OtpCubit()..startTimer(),
      child: Scaffold(
        backgroundColor: Color(0xffEE1C25),
        appBar: AppBar(
          title: Text("Pengesahan OTP"),
          leading: IconButton(
            icon: Icon(CupertinoIcons.chevron_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                var res = await showModalBottomSheet(
                  context: context,
                  builder: (ctx) {
                    return FilterLanguage();
                  },
                );
                if (res != null) {
                  setState(() {
                    selectedLocal = res;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: SvgPicture.asset(
                          getFlagCode(UserLocalDataSource.language),
                          height: 20,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 4,
                    // ),
                    // Icon(CupertinoIcons.chevron_down)
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        body: BlocBuilder<OtpCubit, int>(
          builder: (context, state) {
            return Center(
              child: Card(
                margin: EdgeInsets.all(16),
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        S.current.otpVerification_title,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          6,
                          (index) => Container(
                            width: 40,
                            height: 60,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.red),
                            ),
                            child: Focus(
                              onKeyEvent: (FocusNode node, KeyEvent event) {
                                handleKeyEvent(event, index);
                                return KeyEventResult.ignored;
                              },
                              child: TextField(
                                controller: controllers[index],
                                focusNode: focusNodes[index],
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                cursorColor: Colors.red,
                                decoration: InputDecoration(
                                  counterText: "",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onTap: () async {
                                  controllers[index].selection = TextSelection(
                                    baseOffset: 0,
                                    extentOffset:
                                        controllers[index].text.length,
                                  );
                                  // if (controllers[0].text.isEmpty) {
                                  //   await checkClipboardForOtp();
                                  // }
                                },
                                onChanged: (value) {
                                  onChanged(value, index);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              formatTime(state),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: isLoadingResend && state > 0
                            ? null
                            : () async {
                                resendOtp(context);
                              },
                        child: Text(
                          S.current.otpVerification_resend,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: state > 0 ? Colors.grey : null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Visibility(
                        visible: isLoading,
                        child: CircularProgressIndicator(color: Colors.red),
                      ),
                      // Container(
                      //   width: double.maxFinite,
                      //   child: ElevatedButton(
                      //     style: ButtonStyle(
                      //       backgroundColor:
                      //           WidgetStateProperty.resolveWith<Color>(
                      //         (states) {
                      //           if (states.contains(WidgetState.disabled)) {
                      //             return Colors
                      //                 .grey.shade300; // warna saat disabled
                      //           }
                      //           return Colors.red; // warna aktif
                      //         },
                      //       ),
                      //     ),
                      //     onPressed: isLoading
                      //         ? null
                      //         : () {
                      //             verifyOtp();
                      //             debugPrint("Entered OTP: ${getOTP()}");
                      //           },
                      //     child: Text(
                      //       "Verifikasi",
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
