// import 'dart:developer';

// import 'package:dentalities/core/constant/constant.dart';
// import 'package:dentalities/core/router/app_router.dart';
// import 'package:dentalities/presentation/blocs/cubit/signup_cubit.dart';
// import 'package:dentalities/presentation/widgets/search_bottom_sheet.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   int _currentStep = 0;

//   // Form Data Controllers
//   final emailController = TextEditingController();
//   final phoneController = TextEditingController();
//   final passwordController = TextEditingController();
//   final emailFocus = FocusNode();
//   final phoneFocus = FocusNode();
//   final passwordFocus = FocusNode();
//   bool obscureText = true;

//   final fullNameController = TextEditingController();
//   String? selectedSalutation;
//   final prefixController = TextEditingController();
//   final suffixController = TextEditingController();

//   final postalController = TextEditingController();
//   final addressController = TextEditingController();

//   final _formKey1 = GlobalKey<FormState>();
//   final _formKey2 = GlobalKey<FormState>();
//   final _formKey3 = GlobalKey<FormState>();

//   @override
//   void initState() {
//     if (Constant.getQAEnvironment()) {
//       emailController.text = "test001@yopmail.com";
//       phoneController.text = "62878321731";
//       passwordController.text = "123456";
//       fullNameController.text = "Test 1";
//       prefixController.text = "Mr";
//       suffixController.text = "Mr";

//       postalController.text = "11840";
//       addressController.text = "test ";
//     }
//     super.initState();
//   }

//   void _nextStep() {
//     if (_currentStep < 2) {
//       if (_currentStep == 0) {
//         if (!_formKey1.currentState!.validate()) {
//           return;
//         }
//       }
//       if (_currentStep == 1) {
//         if (!_formKey2.currentState!.validate()) {
//           return;
//         }
//       }

//       if (_currentStep == 2) {
//         if (!_formKey3.currentState!.validate()) {
//           return;
//         }
//       }

//       setState(() => _currentStep++);
//     }
//   }

//   void _prevStep() {
//     if (_currentStep > 0) {
//       setState(() => _currentStep--);
//     }
//   }

//   void _register() {
//     log("@Register Account");
//     signUpCubit.register(
//       salutation: selectedSalutation ?? '',
//       titlePrefix: prefixController.text.trim(),
//       fullName: fullNameController.text.trim(),
//       titleSuffix: suffixController.text.trim(),
//       phoneCode: '62',
//       phoneNumber: phoneController.text.replaceFirst('62', ''),
//       email: emailController.text.trim().toLowerCase(),
//       password: passwordController.text,
//       provinceId: signUpCubit.state.selectedProvinceId!,
//       cityId: signUpCubit.state.selectedCityId!,
//       districtId: signUpCubit.state.selectedDistrictId!,
//       subdistrictId: signUpCubit.state.selectedSubdistrictId!,
//       postalCode: postalController.text,
//       address: addressController.text,
//     );
//   }

//   Widget _stepIndicator(String title, int step) {
//     bool isActive = _currentStep == step;
//     bool isCompleted = _currentStep > step;

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         isCompleted
//             ? Container(
//                 width: 20,
//                 height: 20,
//                 decoration: BoxDecoration(
//                     color: Colors.green,
//                     borderRadius: BorderRadius.circular(50)),
//                 child: Icon(
//                   Icons.check,
//                   size: 16,
//                   color: Colors.white,
//                 ),
//               )
//             : Container(
//                 width: 20,
//                 height: 20,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     color: isActive ? Colors.blue : Colors.grey,
//                     borderRadius: BorderRadius.circular(50)),
//                 child: Text(
//                   (step + 1).toString(),
//                   style: TextStyle(color: Colors.white, fontSize: 11),
//                 )),
//         const SizedBox(width: 4),
//         Text(
//           title,
//           style: TextStyle(
//               fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
//         ),
//       ],
//     );
//   }
 
//   SignUpCubit signUpCubit = SignUpCubit();

//   @override
//   Widget build(BuildContext contextPage) {
//     return PopScope(
//         onPopInvokedWithResult: (didPop, result) {
//           Navigator.pop(contextPage);
//         },
//         child: MultiBlocProvider(
//             providers: [
//               BlocProvider(create: (context) => signUpCubit..loadProvinces()),
//             ],
//             child: BlocBuilder<SignUpCubit, SignUpState>(
//                 bloc: signUpCubit,
//                 builder: (context, state) {
//                   if (state.success) {
//                     Navigator.pushNamed(contextPage, AppRouter.accountOnCheck);
//                   }
//                   return Scaffold(
//                     body: SafeArea(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: SingleChildScrollView(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 24, vertical: 32),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text("Registration",
//                                       style: TextStyle(
//                                           fontSize: 24,
//                                           fontWeight: FontWeight.bold)),
//                                   const SizedBox(height: 4),
//                                   const Text(
//                                       "Complete the informations to create your account"),
//                                   const SizedBox(height: 20),

//                                   // Step Indicator
//                                   Row(
//                                     children: [
//                                       _stepIndicator("Account", 0),
//                                       Expanded(
//                                         child: Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 8),
//                                           child: Divider(
//                                             color: Colors.grey,
//                                             thickness: 1,
//                                           ),
//                                         ),
//                                       ),
//                                       _stepIndicator("Personal", 1),
//                                       Expanded(
//                                         child: Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 8),
//                                           child: Divider(
//                                             color: Colors.grey,
//                                             thickness: 1,
//                                           ),
//                                         ),
//                                       ),
//                                       _stepIndicator("Address", 2),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 24),

//                                   // Dynamic Step Content 
//                                   const SizedBox(height: 30),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 10),

//                           // Action Buttons
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 24),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: ElevatedButton(
//                                     onPressed:
//                                         _currentStep > 0 ? _prevStep : null,
//                                     style: ElevatedButton.styleFrom(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 16),
//                                       backgroundColor: Colors.white,
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(12)),
//                                     ),
//                                     child: Text(
//                                       "Previous",
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Expanded(
//                                   child: ElevatedButton(
//                                     onPressed: _currentStep == 2
//                                         ? _register
//                                         : _nextStep,
//                                     style: ElevatedButton.styleFrom(
//                                         padding: const EdgeInsets.symmetric(
//                                             vertical: 16),
//                                         backgroundColor: _currentStep == 2
//                                             ? Colors.blue
//                                             : Colors.white,
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(12)),
//                                         side: BorderSide(
//                                             color: _currentStep == 2
//                                                 ? Colors.white
//                                                 : Colors.blue)),
//                                     child: Text(
//                                       _currentStep == 2 ? "Register" : "Next",
//                                       style: TextStyle(
//                                           color: _currentStep == 2
//                                               ? Colors.white
//                                               : Colors.blue),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Text("Already have an account? "),
//                               GestureDetector(
//                                   onTap: () {
//                                     Navigator.pop(contextPage);
//                                   },
//                                   child: Text(
//                                     "Login",
//                                     style: TextStyle(
//                                         color: Colors.blue,
//                                         fontWeight: FontWeight.bold),
//                                   ))
//                             ],
//                           ),
//                           const SizedBox(height: 20),
//                         ],
//                       ),
//                     ),
//                   );
//                 })));
//   }
// }
