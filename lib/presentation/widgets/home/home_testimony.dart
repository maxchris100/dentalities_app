import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/presentation/widgets/dashed_divider.dart';
import 'package:dentalities/presentation/widgets/home/testimonial_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTestimonialSection extends StatelessWidget {
  const HomeTestimonialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        const Text(
          'About Dentalities',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            _IconLabel(
              icon: "assets/icons/excellent_service.svg",
              label: 'Excellent\nService',
            ),
            _IconLabel(
              icon: "assets/icons/best_product.svg",
              label: 'Best Products',
            ),
            _IconLabel(
              icon: "assets/icons/experienced.svg",
              label: 'Experienced',
            ),
          ],
        ),
        DashedDivider(
          thickness: 1,
          color: Color(
            0xff1B92E7,
          ),
          height: 32,
        ),
        const TestimonialItem(
          avatar: 'https://i.imgur.com/WkQv4Ay.png',
          name: 'drg. Johny Doermawan, Sp.KG',
          bought: 240,
          testimonial:
              'Dentalities is my go-to for dental supplies. The website is easy to use, orders arrive quickly, and the quality is always great. Customer service is responsive and helpful. It’s made my clinic’s supply process so much smoother. Highly recommend to any dental professional!',
        ),
        const TestimonialItem(
          avatar: 'https://i.imgur.com/zVHJKXU.png',
          name: 'drg. Rani Wibowo, Sp.Ort',
          bought: 100,
          testimonial:
              'Dentalities makes ordering dental supplies so simple and stress-free. The products are reliable, reasonably priced, and always delivered on time. I\'ve switched from my old supplier and haven’t looked back. Great service and great value!',
        ),
        const TestimonialItem(
          avatar: 'https://i.imgur.com/5MZocCj.png',
          name: 'drg. Fajar Pratama, Sp.Pros',
          bought: 94,
          testimonial:
              'Fast shipping, great prices, and quality products. Dentalities never disappoints!',
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRouter.doctorTestimonial);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: Color(0xff1B92E7))),
          ),
          child: const Text(
            'Read all testimonial',
            style: TextStyle(
                color: Color(0xff1B92E7), fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class _IconLabel extends StatelessWidget {
  final String icon;
  final String label;

  const _IconLabel({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(icon, height: 40, width: 40),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.2,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
