import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MetricCard extends StatelessWidget {
  final String asset;
  final String title;
  final String count;
  final bool focus;
  final VoidCallback? onTap;
  const MetricCard(
      {super.key,
      required this.asset,
      required this.title,
      required this.count,
      this.onTap,
      this.focus = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        surfaceTintColor: focus ? null : Colors.black,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Color(0xFFF9FAFF),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100))),
              width: 50,
              child: Column(
                children: [
                  Text(""),
                  Text(""),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Container(
                      child: SvgPicture.asset(asset, width: 32, height: 32)),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          count,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0D4290)),
                        ),
                        Text(
                          title,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
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
