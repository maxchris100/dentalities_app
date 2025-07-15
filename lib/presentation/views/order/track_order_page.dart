import 'package:flutter/material.dart';

class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({super.key});

  final List<_TrackingStep> _steps = const [
    _TrackingStep("Parcel is successfully delivered", "15 May 10:20"),
    _TrackingStep("Parcel is out for delivery", "14 May 08:00"),
    _TrackingStep("Parcel is received at delivery Branch", "13 May 17:25"),
    _TrackingStep("Parcel is in transit", "13 May 07:00"),
    _TrackingStep("Sender has shipped your parcel", "12 May 14:25"),
    _TrackingStep("Sender is preparing to ship your order", "12 May 10:01"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Track Order",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Delivered on 15.05.21",
                style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 4),
            const Text.rich(
              TextSpan(
                text: "Tracking Number : ",
                style: TextStyle(color: Colors.black54),
                children: [
                  TextSpan(
                    text: "IK287368838",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: _steps.length,
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final step = _steps[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Icon(
                            index == 0
                                ? Icons.radio_button_checked
                                : Icons.check_circle,
                            color: index == 0 ? Colors.black : Colors.grey,
                            size: 20,
                          ),
                          if (index != _steps.length - 1)
                            Container(
                              width: 2,
                              height: 40,
                              color: Colors.grey.shade300,
                            ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(step.description,
                                style: const TextStyle(fontSize: 15)),
                            const SizedBox(height: 4),
                            Text(step.time,
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey)),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.star_rate, color: Colors.amber),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: "Don’t forget to rate\n",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: "Rate product to get 5 points for collect.",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
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

class _TrackingStep {
  final String description;
  final String time;
  const _TrackingStep(this.description, this.time);
}
