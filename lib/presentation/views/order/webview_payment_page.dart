import 'package:dentalities/core/util/toast_util.dart';
import 'package:flutter/material.dart';
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
  final String env = 'staging';

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

  @override
  void initState() {
    super.initState();
    String uri = widget.data['payment_response']['redirectURL'];

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
    Navigator.pop(context);
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
    );
  }
}
