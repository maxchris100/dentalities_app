import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnTapText extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final String asset;
  final Color color;
  const OnTapText(
      {super.key,
      this.onTap,
      required this.text,
      this.color = const Color(0xffFAFAFA),
      this.asset = "assets/icons/home-calendar.svg"});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            SvgPicture.asset(
              asset,
              width: 16,
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
