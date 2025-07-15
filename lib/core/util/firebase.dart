// import 'dart:developer';
// import 'dart:io';

// // import 'package:rtrw/firebase_options.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/services.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:rtrw/app/data/utils/firebase_messaging.dart';
// import 'package:rtrw/app/data/utils/toast_util.dart';
// import 'package:rtrw/firebase_options.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// // import 'package:the_apple_sign_in/the_apple_sign_in.dart';

// class CFirebase {
//   static FirebaseAuth? _auth;
//   static GoogleSignIn? _googleSignIn;

//   static Future<void> init() async {
//     if (!Platform.isWindows) {
//       // await Firebase.initializeApp();
//       await Firebase.initializeApp(
//           name: "RTRW", options: DefaultFirebaseOptions.currentPlatform);
//       _auth ??= FirebaseAuth.instance;
//       _googleSignIn ??= GoogleSignIn(
//         scopes: [
//           //"email",
//           //'https://www.googleapis.com/auth/contacts.readonly',
//         ],
//       );
//       await CFirebaseMessaging.init(); //init firebase messaging
//     }
//   }

//   static void signOut() {
//     if (_googleSignIn != null && _auth != null) {
//       _googleSignIn!.signOut();
//       FirebaseAuth.instance.signOut();
//     }
//   }

//   static Future<FSignInResponse?> signInGoogle() async {
//     if (_googleSignIn != null && _auth != null) {
//       try {
//         final GoogleSignInAccount? googleUser = await _googleSignIn!.signIn();
//         AuthCredential credential;
//         if (googleUser != null) {
//           final GoogleSignInAuthentication googleAuth =
//               await googleUser.authentication;
//           credential = GoogleAuthProvider.credential(
//             accessToken: googleAuth.accessToken,
//             idToken: googleAuth.idToken,
//           );
//           final User? firebaseUser =
//               (await _auth!.signInWithCredential(credential)).user;
//           _googleSignIn!.signOut();
//           return FSignInResponse(
//               response: googleUser,
//               user: firebaseUser,
//               accessToken: googleAuth.accessToken);
//         } else {
//           //else signin cancelled
//           _googleSignIn!.disconnect();
//           return FSignInResponse(response: null, user: null);
//         }
//       } catch (e) {
//         String errMessage = "Error google login";
//         if (e is PlatformException) {
//           errMessage = e.message ?? "";
//         }
//         _googleSignIn?.disconnect();
//         ToastUtil.showSnackBarError("Info", errMessage);
//         return FSignInResponse(response: e, user: null);
//       }
//     }
//     return FSignInResponse(response: null, user: null);
//   }

//   static Future<FSignInResponse?> signInApple() async {
//     if (_auth != null) {
//       try {
//         final result = await SignInWithApple.getAppleIDCredential(
//           scopes: [
//             AppleIDAuthorizationScopes.email,
//             AppleIDAuthorizationScopes.fullName,
//           ],
//         );

//         print(result);
//         // final AuthorizationResult result =
//         //     await TheAppleSignIn.performRequests([
//         //   AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
//         // ]);
//         OAuthProvider oAuthProvider = OAuthProvider("apple.com");
//         if (result.identityToken != null) {
//           final AuthCredential credential = oAuthProvider.credential(
//             idToken: result.identityToken,
//             accessToken: result.authorizationCode,
//           );
//           final authResult = await _auth!.signInWithCredential(credential);
//           return FSignInResponse(response: result, user: authResult.user);
//         } else {
//           return FSignInResponse(
//               response: 'Apple Credential Error', user: null);
//         }
//       } catch (ex) {
//         return null;
//       }
//     }
//     return null;
//   }
// }

// class FSignInResponse {
//   dynamic response;
//   User? user;
//   String? accessToken;

//   FSignInResponse({
//     required this.response,
//     this.user,
//     this.accessToken,
//   });
// }
