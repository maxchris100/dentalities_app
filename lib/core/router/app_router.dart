import 'package:flutter/material.dart';
import 'package:foriyana_app/presentation/views/home/home_page.dart';
import 'package:foriyana_app/presentation/views/login/create_new_password_page.dart';
import 'package:foriyana_app/presentation/views/login/forgot_password_page.dart';
import 'package:foriyana_app/presentation/views/login/login_page.dart';
import 'package:foriyana_app/presentation/views/login/otp_page.dart';
import 'package:foriyana_app/presentation/views/login/signup_page.dart';
import 'package:foriyana_app/presentation/views/notification/notification_page.dart';
import 'package:foriyana_app/presentation/views/order/cart_page.dart';
import 'package:foriyana_app/presentation/views/order/order_detail_page.dart';
import 'package:foriyana_app/presentation/views/order/order_page.dart';
import 'package:foriyana_app/presentation/views/order/product_detail_page.dart';
import 'package:foriyana_app/presentation/views/order/rate_product_page.dart';
import 'package:foriyana_app/presentation/views/order/track_order_page.dart';
import 'package:foriyana_app/presentation/views/profile/wishlist_page.dart';
import 'package:foriyana_app/presentation/views/startup/startup_page.dart';
import 'package:foriyana_app/presentation/views/startup/welcome_page.dart';
import 'package:foriyana_app/presentation/views/profile/support_page.dart';

class AppRouter {
  //main menu
  static const String home = '/home';
  static const String welcome = '/welcome';
  static const String startup = '/startup';

  //authentication
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  //products
  static const String productDetail = '/product-detail';
  //other
  static const String userProfile = '/user-profile';
  static const String orderCheckout = '/order-checkout';
  static const String trackOrder = '/track-order';
  static const String order = '/order';
  static const String orderDetail = '/order-detail';
  static const String cart = '/cart';
  static const String rateProduct = '/rate-product';
  static const String settings = '/settings';
  static const String notification = '/notification';
  static const String about = '/about';
  static const String forgotPassword = '/forgot-password';
  static const String createNewPassword = '/create-new-password';
  static const String filter = '/filter';

  static Map<String, Widget Function(BuildContext)> onGenerateRoute() {
    return {
      "/sign-in": (context) => LoginPage(),
      "/sign-up": (context) => SignUpPage(),
      "/forgot-password": (context) => ForgotPasswordPage(),
      "/create-new-password": (context) => CreateNewPasswordPage(),
      "/otp": (context) => OtpPage(),
      "/welcome": (context) => WelcomePage(),
      "/startup": (context) => StartupPage(),
      "/home": (context) => HomePage(),
      "/product-detail": (context) => ProductDetailPage(),
      "/track-order": (context) => TrackOrderPage(),
      "/cart": (context) => CartPage(),
      // "/order": (context) => OrderPage(),
      "/wishlist": (context) => WishlistPage(),
      "/order-detail": (context) => OrderDetailPage(),
      "/rate-product": (context) => RateProductPage(),
      "/support": (context) => SupportPage(),
      "/notification": (context) => NotificationPage(),
    };
  }
}
