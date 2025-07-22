import 'package:flutter/material.dart';

class TestimonialItem extends StatelessWidget {
  final String avatar;
  final String name;
  final int bought;
  final String testimonial;

  const TestimonialItem({
    required this.avatar,
    required this.name,
    required this.bought,
    required this.testimonial,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatar),
            radius: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'Bought $bought products',
                  style: const TextStyle(color: Colors.blueGrey),
                ),
                const SizedBox(height: 6),
                Text(
                  '"$testimonial"',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
