import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foriyana_app/core/router/app_router.dart';
import 'package:foriyana_app/data/data_sources/user_local_data_source.dart';
import 'package:foriyana_app/presentation/blocs/cubit/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isDev = false;
  bool _isLoading = false;

  String callbackUrl = 'myapp://customer-portal.app'; // Callback URL default
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
        _emailController.text = "johndoe@example.com";
        _passController.text = "securePassword123";
        setState(() {});
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

      await AuthCubit().login(context,
          _emailController.text.trim().toLowerCase(), _passController.text);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isDev
            ? GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
                child: Icon(Icons.home))
            : Text(""),
        actions: [
          isDev
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/otp');
                  },
                  child: Text("OTP"))
              : Text(""),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView(
              children: [
                const SizedBox(height: 32),
                Text(
                  "Log into",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "your account",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                _buildTextField("Email address", controller: _emailController),
                _buildTextField("Password",
                    isPassword: true, controller: _passController),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.forgotPassword);
                  },
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Text("Forgot Password?")),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    _handleSubmit();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B1B17),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                  ),
                  child: Text(
                    "LOG IN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    "or log in with",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon('assets/icons/apple.svg'),
                    const SizedBox(width: 24),
                    _buildSocialIcon('assets/icons/google.svg'),
                    const SizedBox(width: 24),
                    _buildSocialIcon('assets/icons/facebook.svg'),
                  ],
                ),
                const SizedBox(height: 24),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRouter.signUp);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Create Account",
                            style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint,
      {bool isPassword = false, required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(),
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(
          AppRouter.home,
        );
      },
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 24,
        child: SvgPicture.asset(
          assetPath,
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}
