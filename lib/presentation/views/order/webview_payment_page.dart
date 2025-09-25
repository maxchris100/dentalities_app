import 'package:dentalities/core/util/toast_util.dart';
import 'package:dentalities/presentation/blocs/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPaymentPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const WebViewPaymentPage({super.key, required this.data});

  @override
  State<WebViewPaymentPage> createState() => _WebViewPaymentPageState();
}

class _WebViewPaymentPageState extends State<WebViewPaymentPage> {
  late WebViewController _controller;
  bool isLoading = true;
  bool handleStateAction = false;
  bool handleLoading = false;

  // ENV bisa diatur sesuai kebutuhan: debug, staging, production
  String env = 'staging';

  final Map<String, Map<String, String>> urls = {
    'debug': {
      'paymentFailed': 'https://dentalities.shop/payment-failed',
      'paymentSuccess': 'https://dentalities.shop/payment-success',
      'paymentRefunded': 'https://dentalities.shop/payment-success',
    },
    'staging': {
      'paymentFailed': 'https://dentalities.shop/payment-failed',
      'paymentSuccess': 'https://dentalities.shop/payment-success',
      'paymentRefunded': 'https://dentalities.shop/payment-success',
    },
    'production': {
      'paymentFailed': 'https://dentalities.shop/payment-failed',
      'paymentSuccess': 'https://dentalities.shop/payment-success',
      'paymentRefunded': 'https://dentalities.shop/payment-success',
    },
  };

  // ignore: non_constant_identifier_names
  final String MOLPAY_URL_SUBMIT =
      'https://paytest.bayarind.id:3001/onepay/response';

  HomeCubit? homeCubit;

  @override
  void initState() {
    super.initState();

    String uri = widget.data['payment_response']['redirectURL'];
    env = dotenv.env['ENV'] ?? "";
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() => isLoading = true);

          debugPrint("WebView started loading: $url");

          // Show loading saat submit URL MOLPay
          if (url.contains(MOLPAY_URL_SUBMIT) && !handleLoading) {
            setState(() => handleLoading = true);
          }
        },
        onPageFinished: (url) {
          setState(() {
            isLoading = false;
            if (handleLoading) {
              handleLoading = false;
            }
          });

          debugPrint("WebView finished loading: $url");

          if (!handleStateAction) {
            if (url.contains(urls[env]!['paymentSuccess']!)) {
              handleStateAction = true;
              _handlePaymentSuccess(widget.data);
            } else if (url.contains(urls[env]!['paymentFailed']!)) {
              handleStateAction = true;
              _handlePaymentFailed(widget.data);
            }
          }
        },
        onWebResourceError: (error) {
          debugPrint("WebView Error: ${error.description}");
          _showErrorDialog(context, error.description);
        },
      ))
      ..loadRequest(Uri.parse(uri));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeCubit = context.read<HomeCubit>();
    });
  }

  void _handlePaymentFailed(Map<String, dynamic> data) {
    debugPrint("Payment Failed: $data");

    ToastUtil.showToastError(
        "", 'We aren’t able to process your Bayarind. Please try again');
    // Navigator.pop(context);
    // Navigator.pushReplacementNamed(
    //   context,
    //   '/transactionResult',
    //   arguments: {
    //     'data': data,
    //     'status': 'failure',
    //     'message': 'We aren’t able to process your Bayarind. Please try again',
    //   },
    // );
  }

  void _handlePaymentSuccess(Map<String, dynamic> data) {
    debugPrint("Payment Success: $data");
    ToastUtil.showToast("", 'Payment success');

    // Navigator.pop(context);
    // Navigator.pushReplacementNamed(
    //   context,
    //   '/transactionResult',
    //   arguments: {
    //     'data': data,
    //     'status': 'success',
    //     'message': 'Your purchase is successful!',
    //   },
    // );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Dentalities"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (isLoading)
              Container(
                color: Colors.white,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 20),
                      Text('Loading...'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: Transform.translate(
        offset: Offset(0, 10), // ↓ Turunkan sedikit ke bawah
        child: FloatingActionButton(
          onPressed: () async {
            String url = "https://wa.me/6281212049191";
            if (!await launchUrl(Uri.parse(url))) {
              ToastUtil.showToastError("", 'Could not launch $url');
            }
          },
          shape: CircleBorder(),
          backgroundColor: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/home_cs.svg",
                color: Colors.white,
                height: 24,
              ),
              Text(
                "Chat",
                style: TextStyle(
                  fontSize: 11,
                  color: homeCubit?.data.selectedIndex == 2
                      ? Colors.white
                      : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Material(
        elevation: 12,
        color: Colors.white,
        shadowColor: Colors.black26, // lebih natural shadow-nya
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset:
                    Offset(0, -2), // arah bayangan ke atas (karena dari bawah)
              ),
            ],
          ),
          child: BottomAppBar(
            elevation: 12,
            color: Colors.transparent,
            height: 64,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: _buildNavItem(
                        homeCubit?.data.selectedIndex == 0
                            ? "assets/icons/home_home_selected.svg"
                            : "assets/icons/home_home.svg",
                        "Home",
                        0)),
                Expanded(
                    child: _buildNavItem(
                        "assets/icons/home_wishlist.svg", "Wishlist", 1)),
                Spacer(flex: 1), // Space for FAB
                Expanded(
                    child: _buildNavItem(
                        "assets/icons/home_transaction.svg", "Transaction", 3)),
                Expanded(
                    child: _buildNavItem(
                        "assets/icons/home_profile.svg", "Profile", 4)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    Navigator.popUntil(context, (route) => route.isFirst);
    if (index == 0) {
      homeCubit?.setIndex(0);
    } else if (index == 1) {
      homeCubit?.setIndex(1);
    } else if (index == 3) {
      homeCubit?.setIndex(3);
    } else if (index == 4) {
      homeCubit?.setIndex(4);
    }
  }

  Widget _buildNavItem(String iconPath, String label, int index) {
    final isSelected = homeCubit?.data.selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            color: isSelected ? Colors.blue : Colors.grey,
            height: 24,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
