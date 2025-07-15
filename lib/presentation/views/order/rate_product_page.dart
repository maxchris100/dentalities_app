import 'package:flutter/material.dart';

class RateProductPage extends StatefulWidget {
  const RateProductPage({super.key});

  @override
  State<RateProductPage> createState() => _RateProductPageState();
}

class _RateProductPageState extends State<RateProductPage> {
  int _rating = 4;
  final TextEditingController _reviewController = TextEditingController();

  Widget _buildStar(int index) {
    return IconButton(
      onPressed: () {
        setState(() {
          _rating = index;
        });
      },
      icon: Icon(
        Icons.star,
        color: index <= _rating ? Colors.teal : Colors.grey[300],
        size: 32,
      ),
    );
  }

  void _submitReview() {
    // TODO: Submit review API
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Review submitted!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Rate Product",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: const [
                  Icon(Icons.card_giftcard, color: Colors.white),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Submit your review to get 5 points",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) => _buildStar(index + 1)),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _reviewController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText:
                    "Would you like to write anything about this product?",
                hintStyle: const TextStyle(color: Colors.grey),
                contentPadding: const EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerRight,
              child:
                  Text("50 characters", style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _buildUploadBox(Icons.image),
                const SizedBox(width: 16),
                _buildUploadBox(Icons.camera_alt),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitReview,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Submit Review"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadBox(IconData icon) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: Colors.grey),
    );
  }
}
