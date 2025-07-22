import 'package:flutter/material.dart';

class Checkout1Page extends StatefulWidget {
  const Checkout1Page({super.key});

  @override
  State<Checkout1Page> createState() => _Checkout1PageState();
}

class _Checkout1PageState extends State<Checkout1Page> {
  bool isSubmit = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Shipping Address
                      const Text('Shipping Address',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      const Text(
                        'Jl. Margacinta Rt 02 Rw 01, RT.02/RW.No: 424A,\nMargasari, Kec. Buahbatu, Kota Bandung, Jawa Barat 40286',
                      ),
                      const SizedBox(height: 16),
                      const Divider(),

                      // Shipment
                      const SizedBox(height: 16),
                      Text('Shipment',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        subtitle: const Text('JTR > 130\nEstimated 3-4 days'),
                        leading: Image.asset(
                          'assets/images/banner.png',
                          height: 40,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          builder: (_) {
                            return Container();
                          },
                        ),
                      ),

                      const Divider(),

                      // Payment Method
                      const SizedBox(height: 16),
                      Text('Payment Method',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        subtitle: const Text('Transfer to BCA'),
                        leading: Image.asset('assets/images/banner.png',
                            height: 40, width: 50, fit: BoxFit.cover),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          builder: (_) {
                            return Container();
                          },
                        ),
                      ),

                      const Divider(),

                      // Payment Summary
                      const SizedBox(height: 16),
                      const Text('Payment Summary',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Product (1.220 items)'),
                          Text('Rp1.520.000')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [Text('Shipment'), Text('Rp50.000')],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Discount', style: TextStyle(color: Colors.red)),
                          Text('-Rp150.000',
                              style: TextStyle(color: Colors.red))
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Total',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('Rp1.420.000',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: isSubmit
                          ? CircularProgressIndicator()
                          : const Text('Pay',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Continue with payment means you accept ",
                            style: TextStyle(color: Colors.grey, fontSize: 11)),
                        TextSpan(
                            text: "our Terms and Conditions",
                            style: TextStyle(color: Colors.grey, fontSize: 11))
                      ])),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
