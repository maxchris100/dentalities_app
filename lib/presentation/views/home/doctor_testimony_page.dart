import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/presentation/widgets/home/testimonial_item.dart';
import 'package:flutter/material.dart';

class DoctorTestimonialPage extends StatefulWidget {
  const DoctorTestimonialPage({super.key});

  @override
  State<DoctorTestimonialPage> createState() => _DoctorTestimonialPageState();
}

class _DoctorTestimonialPageState extends State<DoctorTestimonialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(padding: EdgeInsets.only(left: 30)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'Search product',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                ),
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.search,
                      arguments: {"search_focus": 0});
                },
              ),
            ),
          ),
          const SizedBox(width: 8),
          Padding(
              padding: EdgeInsets.only(right: 16),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppRouter.cart);
                  },
                  child: Icon(Icons.shopping_cart_outlined))),
          Padding(
              padding: EdgeInsets.only(right: 16),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, AppRouter.notification);
                  },
                  child: Icon(Icons.notifications_none)))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Image.asset("assets/images/doctor_testimonial.png"),
          SizedBox(
            height: 8,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return TestimonialItem(
                      avatar: 'https://i.imgur.com/WkQv4Ay.png',
                      name: 'drg. Johny Doermawan, Sp.KG',
                      bought: 240,
                      testimonial:
                          'Dentalities is my go-to for dental supplies. The website is easy to use, orders arrive quickly, and the quality is always great. Customer service is responsive and helpful. It’s made my clinic’s supply process so much smoother. Highly recommend to any dental professional!',
                    );
                  })),
        ],
      )),
    );
  }
}
