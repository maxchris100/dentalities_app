import 'package:flutter/material.dart';

class Checkout2Page extends StatefulWidget {
  const Checkout2Page({super.key});

  @override
  State<Checkout2Page> createState() => _Checkout2PageState();
}

class _Checkout2PageState extends State<Checkout2Page> {
  int _selectedPaymentMethod = 1; // 0: Cash, 1: Credit Card, 2: Other
  bool _agreeTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check out", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("STEP 2", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 4),
          const Text("Payment",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPaymentTab(0, Icons.money, "Cash"),
              _buildPaymentTab(1, Icons.credit_card, "Credit Card"),
              _buildPaymentTab(2, Icons.more_horiz, "More"),
            ],
          ),

          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Choose your card",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Add new+",
                  style: TextStyle(color: Colors.red, fontSize: 13)),
            ],
          ),

          const SizedBox(height: 12),
          Image.asset("assets/images/visa_card_sample.png",
              height: 180), // Mockup kartu

          const SizedBox(height: 20),
          const Center(child: Text("or check out with")),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildPaymentLogo("assets/icons/paypal.png"),
              _buildPaymentLogo("assets/icons/visa.png"),
              _buildPaymentLogo("assets/icons/mastercard.png"),
              _buildPaymentLogo("assets/icons/alipay.png"),
              _buildPaymentLogo("assets/icons/amex.png"),
            ],
          ),

          const SizedBox(height: 30),
          const Divider(),

          _buildPriceRow("Product price", "\$110"),
          _buildPriceRow("Shipping", "Freeship"),
          _buildPriceRow("Subtotal", "\$110", bold: true),

          const SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                value: _agreeTerms,
                onChanged: (value) {
                  setState(() {
                    _agreeTerms = value ?? false;
                  });
                },
              ),
              const Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(child: SizedBox(width: 5)),
                      TextSpan(
                        text: "I agree to Terms and conditions",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: _agreeTerms
                  ? () {
                      // Lanjut ke halaman konfirmasi
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text("Place my order"),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPaymentTab(int index, IconData icon, String label) {
    final isSelected = _selectedPaymentMethod == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = index;
        });
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black87 : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.black),
            const SizedBox(height: 4),
            Text(label,
                style:
                    TextStyle(color: isSelected ? Colors.white : Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentLogo(String path) {
    return Image.asset(path, width: 36, height: 36);
  }

  Widget _buildPriceRow(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value,
              style:
                  bold ? const TextStyle(fontWeight: FontWeight.bold) : null),
        ],
      ),
    );
  }
}
