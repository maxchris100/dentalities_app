import 'package:flutter/material.dart';

class ProductVideosSection extends StatelessWidget {
  const ProductVideosSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List videoThumbnails = ["assets/images/banner.png"];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Product videos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'See All',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Video thumbnails
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: videoThumbnails.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final thumbnail = videoThumbnails[index];
              return _VideoThumbnail(imageUrl: thumbnail);
            },
          ),
        ),
      ],
    );
  }
}

class _VideoThumbnail extends StatelessWidget {
  final String imageUrl;

  const _VideoThumbnail({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.asset(
            imageUrl,
            width: 120,
            height: 180,
            fit: BoxFit.cover,
          ),
          // Overlay with play icon and duration
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Icon(Icons.play_circle_fill, size: 16, color: Colors.white),
                  SizedBox(width: 4),
                  Text(
                    '01:00',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
