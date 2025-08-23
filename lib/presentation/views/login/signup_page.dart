import 'dart:developer';

import 'package:dentalities/core/constant/constant.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/core/util/toast_util.dart';
import 'package:dentalities/presentation/blocs/cubit/signup_cubit.dart';
import 'package:dentalities/presentation/widgets/search_bottom_sheet.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int _currentStep = 0;

  // Form Data Controllers
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final phoneFocus = FocusNode();
  final passwordFocus = FocusNode();
  bool obscureText = true;

  final fullNameController = TextEditingController();
  String? selectedSalutation;
  final prefixController = TextEditingController();
  final suffixController = TextEditingController();

  final postalController = TextEditingController();
  final addressController = TextEditingController();

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  bool onSubmit = false;
  bool isSubmiting = false;
  @override
  void initState() {
    if (Constant.getQAEnvironment()) {
      emailController.text = "test001@yopmail.com";
      phoneController.text = "62878321731";
      passwordController.text = "123456";
      fullNameController.text = "Test 1";
      prefixController.text = "Mr";
      suffixController.text = "Mr";

      postalController.text = "11840";
      addressController.text = "test ";
    }
    super.initState();
    signUpCubit = SignUpCubit();
    signUpCubit.loadProvinces(); // 👈 Panggil di sini
  }

  void _nextStep() {
    if (_currentStep < 2) {
      if (_currentStep == 0) {
        if (!_formKey1.currentState!.validate()) {
          return;
        }
      }
      if (_currentStep == 1) {
        if (!_formKey2.currentState!.validate()) {
          return;
        }
        if (selectedSalutation == null) {
          setState(() {
            onSubmit = true;
          });
          return;
        }
        setState(() {
          onSubmit = false;
        });
      }

      if (_currentStep == 2) {
        if (!_formKey3.currentState!.validate()) {
          return;
        }
      }

      setState(() => _currentStep++);
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  Future _register() async {
    setState(() {
      onSubmit = true;
    });
    // if (selectedSalutation == null) {
    //   return;
    // }
    // if (signUpCubit.state.selectedProvinceId == null) {
    //   return;
    // }
    // if (signUpCubit.state.selectedCityId == null) {
    //   return;
    // }
    // if (signUpCubit.state.selectedDistrictId == null) {
    //   return;
    // }
    // if (signUpCubit.state.selectedSubdistrictId == null) {
    //   return;
    // }
    setState(() {
      isSubmiting = true;
    });

    log("@Register Account");
    Response? res = await signUpCubit.register(
      salutation: selectedSalutation ?? '',
      titlePrefix: prefixController.text.trim(),
      fullName: fullNameController.text.trim(),
      titleSuffix: suffixController.text.trim(),
      phoneCode: '62',
      phoneNumber: phoneController.text.replaceFirst('62', ''),
      email: emailController.text.trim().toLowerCase(),
      password: passwordController.text,
      // provinceId: signUpCubit.state.selectedProvinceId!["id"].toString(),
      // cityId: signUpCubit.state.selectedCityId!["id"].toString(),
      // districtId: signUpCubit.state.selectedDistrictId!["id"].toString(),
      // subdistrictId: signUpCubit.state.selectedSubdistrictId!["id"].toString(),
      // postalCode: postalController.text,
      // address: addressController.text,
    );
    setState(() {
      isSubmiting = false;
    });
    if (res != null) {
      if (res.data["status"] == true) {
        ToastUtil.showToast("", res.data["message"] ?? "");
        Navigator.pushNamed(context, AppRouter.accountOnCheck);

        return;
      } else {
        ToastUtil.showToast("", res.data["message"] ?? "");
      }
    }
    ToastUtil.showToast("", "Error creating account");
  }

  Widget _stepIndicator(String title, int step) {
    bool isActive = _currentStep == step;
    bool isCompleted = _currentStep > step;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isCompleted
            ? Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.check,
                  size: 16,
                  color: Colors.white,
                ),
              )
            : Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: isActive ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  (step + 1).toString(),
                  style: TextStyle(color: Colors.white, fontSize: 11),
                )),
        const SizedBox(width: 4),
        Text(
          title,
          style: TextStyle(
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
        ),
      ],
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return Form(
          key: _formKey1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Account Informations",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),

              Text("Full Name"),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: fullNameController,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onChanged: (value) {
                  _formKey2.currentState!.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Full Name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Email Field
              Text("Email"),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocus,
                decoration: InputDecoration(
                  hintText: 'name@mail.com',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onChanged: (value) {
                  _formKey1.currentState!.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  final emailRegex =
                      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Email Format is not valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              Text("Phone Number"),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                focusNode: phoneFocus,
                decoration: InputDecoration(
                  hintText: '628xxxxx',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onChanged: (value) {
                  _formKey1.currentState!.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone Number is required';
                  }
                  final phoneRegex = RegExp(r'^628[0-9]{7,12}$');
                  if (!phoneRegex.hasMatch(value)) {
                    return 'Invalid Format Phone Number (contoh: 6281234567890)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              // Password Field
              Text("Password"),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: passwordController,
                focusNode: passwordFocus,
                obscureText: obscureText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
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
                onChanged: (value) {
                  _formKey1.currentState!.validate();
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
            ],
          ),
        );
      case 1:
        return Form(
          key: _formKey2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Personal Details",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Text("Full Name"),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: fullNameController,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onChanged: (value) {
                  _formKey2.currentState!.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Full Name is required';
                  }
                  return null;
                },
              ),
              // const SizedBox(height: 12),
              // Text("Salutation"),
              // SizedBox(
              //   height: 8,
              // ),
              // BottomSheetSelector<String>(
              //   label: "Salutation",
              //   selectedValue: selectedSalutation,
              //   items: ['Mr.', 'Mrs.', 'Dr.', 'Prof.'],
              //   onSelected: (value) =>
              //       setState(() => selectedSalutation = value),
              // ),
              // Visibility(
              //   visible: onSubmit && selectedSalutation == null,
              //   child: Text(
              //     "Salutation is required",
              //     style: TextStyle(color: Colors.red),
              //   ),
              // ),
              // const SizedBox(height: 12),
              // Text("Prefix Title"),
              // SizedBox(
              //   height: 8,
              // ),
              // TextFormField(
              //   controller: prefixController,
              //   decoration: InputDecoration(
              //     hintText: 'Prefix',
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12)),
              //   ),
              //   onChanged: (value) {
              //     _formKey2.currentState!.validate();
              //   },
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Prefix Title is required';
              //     }
              //     return null;
              //   },
              // ),
              // const SizedBox(height: 12),
              // Text("Suffix Title"),
              // SizedBox(
              //   height: 8,
              // ),
              // TextFormField(
              //   controller: suffixController,
              //   decoration: InputDecoration(
              //     hintText: 'Suffix Title',
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12)),
              //   ),
              //   onChanged: (value) {
              //     _formKey2.currentState!.validate();
              //   },
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Suffix Title is required';
              //     }
              //     return null;
              //   },
              // ),
            ],
          ),
        );
      case 2:
        return Form(
          key: _formKey3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Address",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Text("Province"),
              SizedBox(
                height: 8,
              ),
              BottomSheetSelector<Map>(
                label: "Province",
                selectedValue: signUpCubit.state.selectedProvinceId?["name"],
                items:
                    signUpCubit.state.provinces.map((e) => e as Map).toList(),
                itemLabel: (p0) {
                  return p0["name"];
                },
                onSelected: (value) {
                  signUpCubit.selectProvince(value);
                },
              ),
              Visibility(
                  visible:
                      onSubmit && signUpCubit.state.selectedProvinceId == null,
                  child: Text(
                    "Province is required",
                    style: TextStyle(color: Colors.red),
                  )),
              const SizedBox(height: 12),
              Text("City/Regency"),
              SizedBox(
                height: 8,
              ),
              BottomSheetSelector<Map>(
                label: "City/Regency",
                selectedValue: signUpCubit.state.selectedCityId?["name"],
                items: signUpCubit.state.cities.map((e) => e as Map).toList(),
                itemLabel: (p0) {
                  return p0["name"];
                },
                onSelected: (value) {
                  signUpCubit.selectCity(value);
                },
              ),
              Visibility(
                visible: onSubmit && signUpCubit.state.selectedCityId == null,
                child: Text(
                  "City/Regency is required",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 12),
              Text("District"),
              SizedBox(
                height: 8,
              ),
              BottomSheetSelector<Map>(
                label: "District",
                selectedValue: signUpCubit.state.selectedDistrictId?["name"],
                items:
                    signUpCubit.state.districts.map((e) => e as Map).toList(),
                itemLabel: (p0) {
                  return p0["name"];
                },
                onSelected: (value) {
                  signUpCubit.selectDistrict(value);
                },
              ),
              Visibility(
                visible:
                    onSubmit && signUpCubit.state.selectedDistrictId == null,
                child: Text(
                  "District is required",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 12),
              Text("Sub-district/Village"),
              SizedBox(
                height: 8,
              ),
              BottomSheetSelector<Map>(
                label: "Sub-district/Village",
                selectedValue: signUpCubit.state.selectedSubdistrictId?["name"],
                items: signUpCubit.state.subdistricts
                    .map((e) => e as Map)
                    .toList(),
                itemLabel: (p0) {
                  return p0["name"];
                },
                onSelected: (value) {
                  signUpCubit.selectSubdistrict(value);
                },
              ),
              Visibility(
                visible:
                    onSubmit && signUpCubit.state.selectedSubdistrictId == null,
                child: Text(
                  "Sub-district/Village is required",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 12),
              Text("Postal Code"),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: postalController,
                keyboardType: TextInputType.number,
                maxLength: 8,
                decoration: InputDecoration(
                    hintText: 'Postal Code',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    counterText: ''),
                onChanged: (value) {
                  _formKey3.currentState!.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Postal Code is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              Text("Full Address"),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: addressController,
                maxLines: 2,
                maxLength: 300,
                decoration: InputDecoration(
                  hintText: 'Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onChanged: (value) {
                  _formKey3.currentState!.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Address is required';
                  }
                  return null;
                },
              ),
            ],
          ),
        );
      default:
        return const SizedBox();
    }
  }

  late SignUpCubit signUpCubit;

  @override
  Widget build(BuildContext contextPage) {
    return PopScope(
        onPopInvokedWithResult: (didPop, result) {
          // print("POP");
          Navigator.pop(contextPage);
        },
        child: BlocBuilder<SignUpCubit, SignUpState>(
            bloc: signUpCubit,
            builder: (context, state) {
              return Scaffold(
                body: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Registration",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              const Text(
                                  "Complete the informations to create your account"),
                              const SizedBox(height: 20),

                              // Step Indicator
                              Row(
                                children: [
                                  _stepIndicator("Account", 0),
                                  // Expanded(
                                  //   child: Padding(
                                  //     padding:
                                  //         EdgeInsets.symmetric(horizontal: 8),
                                  //     child: Divider(
                                  //       color: Colors.grey,
                                  //       thickness: 1,
                                  //     ),
                                  //   ),
                                  // ),
                                  // _stepIndicator("Personal", 1),
                                  // Expanded(
                                  //   child: Padding(
                                  //     padding:
                                  //         EdgeInsets.symmetric(horizontal: 8),
                                  //     child: Divider(
                                  //       color: Colors.grey,
                                  //       thickness: 1,
                                  //     ),
                                  //   ),
                                  // ),
                                  // _stepIndicator("Address", 2),
                                ],
                              ),
                              const SizedBox(height: 24),

                              // Dynamic Step Content
                              _buildStepContent(),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Action Buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            // Expanded(
                            //   child: ElevatedButton(
                            //     onPressed: _currentStep > 0 ? _prevStep : null,
                            //     style: ElevatedButton.styleFrom(
                            //       padding:
                            //           const EdgeInsets.symmetric(vertical: 12),
                            //       backgroundColor: Colors.white,
                            //       shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(12)),
                            //     ),
                            //     child: Text(
                            //       "Previous",
                            //       style: TextStyle(color: Colors.black),
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                onPressed:
                                    _currentStep == 0 ? _register : _nextStep,
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    backgroundColor: _currentStep == 0
                                        ? Colors.blue
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        side: BorderSide(
                                            color: _currentStep == 0
                                                ? Colors.blue
                                                : Colors.white)),
                                    side: BorderSide(
                                        color: _currentStep == 0
                                            ? Colors.white
                                            : Colors.blue)),
                                child: Text(
                                  _currentStep == 0 ? "Register" : "Next",
                                  style: TextStyle(
                                      color: _currentStep == 0
                                          ? Colors.white
                                          : Colors.blue),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? "),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  AppRouter.signIn,
                                  (route) => false,
                                );
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            }));
  }
}
