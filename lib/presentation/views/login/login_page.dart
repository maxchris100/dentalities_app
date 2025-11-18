import 'package:dentalities/core/util/appversion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/data/data_sources/user_local_data_source.dart';
import 'package:dentalities/presentation/blocs/cubit/auth_cubit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dentalities/core/util/toast_util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isDev = false;
  bool _isLoading = false;
  bool obscureText = true;
  late String selectedLocal;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passFocus = FocusNode();

  @override
  void initState() {
    selectedLocal = UserLocalDataSource.language;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (dotenv.env["ENV"] != "production") {
        isDev = true;
        // _emailController.text = "demo@dentalities.shop";
        // _passController.text = "pass1234";
        // setState(() {});
        //   _emailController.text = "123@yopmail.com";
        //   _passController.text = "123123123";
      }
    });
  }

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      String email = _emailController.text.trim().toLowerCase();
      String password = _passController.text;

      AuthCubit authCubit = context.read<AuthCubit>();
      await authCubit.login(context, email, password);

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _emailFocus.dispose();
    _passFocus.dispose();
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  String? _authErrorMessage;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  setState(() {
                    _authErrorMessage = state.message;
                  });
                  ToastUtil.showToastError("", state.errorMessage);
                } else {
                  setState(() {
                    _authErrorMessage = null;
                  });
                }
              },
              child: SafeArea(
                top: false,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 203, 228, 248),
                                        Colors.white
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(24),
                                      bottomRight: Radius.circular(24),
                                    ),
                                  ),
                                ),
                                // Container(
                                //   padding: EdgeInsets.symmetric(horizontal: 24),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       isDev
                                //           ? GestureDetector(
                                //               onTap: () {
                                //                 Navigator.of(context)
                                //                     .pushReplacementNamed('/home');
                                //               },
                                //               child: Icon(Icons.home))
                                //           : Text(""),
                                //       isDev
                                //           ? GestureDetector(
                                //               onTap: () {
                                //                 Navigator.of(context).pushNamed('/otp');
                                //               },
                                //               child: Text("OTP"))
                                //           : Text("")
                                //     ],
                                //   ),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0, vertical: 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Logo & Branding
                                      Column(
                                        children: [
                                          Image.asset(
                                            "assets/logos/logo.png",
                                            height: 70,
                                          ),
                                          // SvgPicture.asset(
                                          //   'assets/logos/logo.svg',
                                          //   height: 50,
                                          //   allowDrawingOutsideViewBox: true,
                                          // ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),

                                      Text(
                                        "Sign in to your account",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        "Enter your email and password to log in",
                                        style:
                                            TextStyle(color: Colors.grey[600]),
                                      ),
                                      const SizedBox(height: 24),

                                      // Email Field
                                      Text("Email"),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller: _emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          hintText: 'name@mail.com',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          errorText: _authErrorMessage,
                                        ),
                                        onChanged: (value) {
                                          _formKey.currentState!.validate();
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Email is required';
                                          }
                                          final emailRegex = RegExp(
                                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                          if (!emailRegex.hasMatch(value)) {
                                            return 'Email Format is not valid';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 16),

                                      // Password Field
                                      Text("Password"),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        controller: _passController,
                                        obscureText: obscureText,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                obscureText = !obscureText;
                                              });
                                            },
                                            child: Icon(obscureText
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                          ),
                                          errorText: _authErrorMessage,
                                        ),
                                        onChanged: (value) {
                                          _formKey.currentState!.validate();
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Password is required';
                                          }
                                          if (value.length < 6) {
                                            return 'Password length minimum 6 characters';
                                          }
                                          return null;
                                        },
                                      ),

                                      // Forgot Password
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  AppRouter.forgotPassword);
                                            },
                                            child: const Text(
                                              'Forgot Password?',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Log In Button
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _handleSubmit();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                          ),
                                          child: const Text('Log In',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      const SizedBox(height: 20),

                                      // OR separator
                                      // Row(
                                      //   children: [
                                      //     const Expanded(child: Divider()),
                                      //     const Padding(
                                      //       padding: EdgeInsets.symmetric(horizontal: 8.0),
                                      //       child: Text("Or"),
                                      //     ),
                                      //     const Expanded(child: Divider()),
                                      //   ],
                                      // ),
                                      // const SizedBox(height: 20),

                                      // Google Sign In
                                      // SizedBox(
                                      //   width: double.infinity,
                                      //   child: OutlinedButton.icon(
                                      //     onPressed: () {},
                                      //     icon: SvgPicture.asset("assets/icons/google.svg"),
                                      //     label: const Text(
                                      //       'Continue with Google',
                                      //       style: TextStyle(
                                      //           color: Colors.black,
                                      //           fontWeight: FontWeight.bold),
                                      //     ),
                                      //     style: OutlinedButton.styleFrom(
                                      //       padding: const EdgeInsets.symmetric(vertical: 14),
                                      //       shape: RoundedRectangleBorder(
                                      //         borderRadius: BorderRadius.circular(12),
                                      //       ),
                                      //       side: BorderSide(color: Colors.grey[300]!),
                                      //     ),
                                      //   ),
                                      // ),
                                      const SizedBox(height: 30),

                                      // Register
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text("Don't have an account?"),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, AppRouter.signUp);
                                            },
                                            child: const Text("Register",
                                                style: TextStyle(
                                                    color: Colors.blue)),
                                          ),
                                        ],
                                      ),

                                      // Center(
                                      //   child: Text(
                                      //     "Version ${AppVersion.version}+${AppVersion.buildNumber}",
                                      //     textAlign: TextAlign.center,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Can’t access your account?"),
                              TextButton(
                                onPressed: () async {
                                  String url = "https://wa.me/6281212049191";
                                  if (!await launchUrl(Uri.parse(url))) {
                                    ToastUtil.showToastError(
                                        "", 'Could not launch $url');
                                  }
                                },
                                child: const Text(
                                  "Contact Support",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (_isLoading)
                      Container(
                        color: Colors.white.withOpacity(0.8),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 20),
                              Text('Please wait a moment'),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
