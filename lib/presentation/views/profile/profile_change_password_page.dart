import 'package:dentalities/core/constant/constant.dart';
import 'package:dentalities/core/util/toast_util.dart';
import 'package:dentalities/presentation/blocs/cubit/profile_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dentalities/generated/l10n.dart';

class ProfileChangePasswordPage extends StatefulWidget {
  const ProfileChangePasswordPage({super.key});

  @override
  State<ProfileChangePasswordPage> createState() =>
      _ProfileChangePasswordPageState();
}

class _ProfileChangePasswordPageState extends State<ProfileChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool obscureTextOld = true;
  bool obscureText = true;
  bool obscureTextConfirm = true;

  bool onSubmit = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      var args = ModalRoute.of(context)?.settings.arguments as Map?;
      if (args != null) {
        profileCubit = args["profileCubit"];
      }
      emailController.text = Constant.userLocalDataSource.userData?.email ?? "";
      phoneController.text = Constant.userLocalDataSource.userData?.phone ?? "";
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future onSave() async {
    setState(() => onSubmit = true);
    if (_formKey.currentState!.validate()) {
      var res = await profileCubit?.updatePassword(
        oldPass: passController.text,
        newPass: newPassController.text,
      );
      setState(() => onSubmit = false);
      if (res["status"]) {
        passController.clear();
        newPassController.clear();
        confirmPassController.clear();
        ToastUtil.showToast("", "Success change password");
      } else {
        ToastUtil.showToastError("", "Failed change password");
      }
      return;
    }

    setState(() => onSubmit = true);
  }

  ProfileCubit? profileCubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Account Details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              const Text("Email"),
              const SizedBox(height: 8),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                enabled: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              const Text("Phone"),
              const SizedBox(height: 8),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: 'Phone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                enabled: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone is required';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              // Old Pass
              const Text("Old Password"),
              const SizedBox(height: 8),
              TextFormField(
                controller: passController,
                obscureText: obscureTextOld,
                decoration: InputDecoration(
                  hintText: 'Old Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureTextOld = !obscureTextOld;
                      });
                    },
                    child: Icon(obscureTextOld
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              const Text("New Password"),
              const SizedBox(height: 8),
              TextFormField(
                controller: newPassController,
                obscureText: obscureText,
                decoration: InputDecoration(
                  hintText: 'New Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'New Password is required';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              const Text("Confirm New Password"),
              const SizedBox(height: 8),
              TextFormField(
                controller: confirmPassController,
                obscureText: obscureTextConfirm,
                decoration: InputDecoration(
                  hintText: 'Confirm New Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureTextConfirm = !obscureTextConfirm;
                      });
                    },
                    child: Icon(obscureTextConfirm
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm Password is required';
                  }
                  if (value != newPassController.text) {
                    return 'Confirm Password does not match with New Password';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 32),
              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    onSave();
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
