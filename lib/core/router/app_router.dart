import 'package:dentalities/presentation/views/home/doctor_testimony_page.dart';
import 'package:dentalities/presentation/views/home/product_video_page.dart';
import 'package:dentalities/presentation/views/home/search_page.dart';
import 'package:dentalities/presentation/views/login/account_oncheck_page.dart';
import 'package:dentalities/presentation/views/login/reset_password_linksent_page.dart';
import 'package:dentalities/presentation/views/order/checkout1_page.dart';
import 'package:dentalities/presentation/views/order/payment_complete.dart';
import 'package:dentalities/presentation/views/profile/add_delivery_address_page.dart';
import 'package:dentalities/presentation/views/profile/delivery_address_page.dart';
import 'package:flutter/material.dart';
import 'package:dentalities/presentation/views/index/home_page.dart';
import 'package:dentalities/presentation/views/login/create_new_password_page.dart';
import 'package:dentalities/presentation/views/login/forgot_password_page.dart';
import 'package:dentalities/presentation/views/login/login_page.dart';
import 'package:dentalities/presentation/views/login/otp_page.dart';
import 'package:dentalities/presentation/views/login/signup_page.dart';
import 'package:dentalities/presentation/views/notification/notification_page.dart';
import 'package:dentalities/presentation/views/order/cart_page.dart';
import 'package:dentalities/presentation/views/order/order_detail_page.dart';
import 'package:dentalities/presentation/views/order/order_page.dart';
import 'package:dentalities/presentation/views/order/product_detail_page.dart';
import 'package:dentalities/presentation/views/order/rate_product_page.dart';
import 'package:dentalities/presentation/views/order/track_order_page.dart';
import 'package:dentalities/presentation/views/profile/wishlist_page.dart';
import 'package:dentalities/presentation/views/startup/startup_page.dart';
import 'package:dentalities/presentation/views/startup/welcome_page.dart';
import 'package:dentalities/presentation/views/profile/support_page.dart';

class AppRouter {
  //main menu
  static const String home = '/home';
  static const String welcome = '/welcome';
  static const String startup = '/startup';

  //authentication
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String accountOnCheck = '/account-on-check';
  static const String resetPassSentLink = '/reset-pass-sentlink';
  //products
  static const String search = '/search';
  static const String productDetail = '/product-detail';
  //other
  static const String userProfile = '/user-profile';
  static const String orderCheckout = '/order-checkout';
  static const String trackOrder = '/track-order';
  static const String doctorTestimonial = '/doctor-testimonial';
  static const String productVideo = '/product-video';
  static const String order = '/order';
  static const String orderDetail = '/order-detail';
  static const String paymentComplete = '/payment-complete';
  static const String cart = '/cart';
  static const String rateProduct = '/rate-product';
  static const String settings = '/settings';
  static const String deliveryAddress = '/delivery-address';
  static const String deliveryAddressAdd = '/delivery-address-add';
  static const String notification = '/notification';
  static const String about = '/about';
  static const String forgotPassword = '/forgot-password';
  static const String createNewPassword = '/create-new-password';
  static const String filter = '/filter';

  static Map<String, Widget Function(BuildContext)> onGenerateRoute() {
    return {
      "/sign-in": (context) => LoginPage(),
      "/sign-up": (context) => SignUpPage(),
      "/account-on-check": (context) => AccountOnCheckPage(),
      resetPassSentLink: (context) => ResetPasswordLinksentPage(),
      "/forgot-password": (context) => ForgotPasswordPage(),
      "/create-new-password": (context) => CreateNewPasswordPage(),
      "/otp": (context) => OtpPage(),
      "/welcome": (context) => WelcomePage(),
      "/startup": (context) => StartupPage(),
      "/home": (context) => HomePage(),
      search: (context) => SearchPage(),
      doctorTestimonial: (context) => DoctorTestimonialPage(),
      productVideo: (context) => ProductVideoPage(),
      "/product-detail": (context) => ProductDetailPage(),
      "/track-order": (context) => TrackOrderPage(),
      "/cart": (context) => CartPage(),
      orderCheckout: (context) => Checkout1Page(),
      paymentComplete: (context) => PaymentCompletePage(),
      // "/order": (context) => OrderPage(),
      "/wishlist": (context) => WishlistPage(),
      "/order-detail": (context) => OrderDetailPage(),
      "/rate-product": (context) => RateProductPage(),
      deliveryAddress: (context) => DeliveryAddressPage(),
      deliveryAddressAdd: (context) => AddEditDeliveryAddressPage(),
      "/support": (context) => SupportPage(),
      "/notification": (context) => NotificationPage(),
    };
  }
}
