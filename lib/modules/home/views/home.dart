import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Buttons Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Leave a Review'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Create Business Profile'),
                    ),
                  ),
                ],
              ),
            ),

            // Tab Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const Text(
                    'For You',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Following',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),

            // Top Services Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Top Services',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  ServiceCard(
                    imageUrl: 'https://picsum.photos/150',
                    category: 'General Contractor',
                    rating: 4.5,
                    reviewCount: 86,
                  ),
                  const SizedBox(width: 16),
                  ServiceCard(
                    imageUrl: 'https://picsum.photos/150',
                    category: 'Residential Cleaning',
                    rating: 4.8,
                    reviewCount: 154,
                  ),
                  const SizedBox(width: 16),
                  ServiceCard(
                    imageUrl: 'https://picsum.photos/150',
                    category: 'Residential Cleaning',
                    rating: 4.8,
                    reviewCount: 154,
                  ),
                ],
              ),
            ),

            // Newest Reviews Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "What's Buzzin'?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.reviews.isEmpty) {
                return const Center(child: Text('No reviews found'));
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: controller.reviews.length,
                itemBuilder: (context, index) {
                  final review = controller.reviews[index];
                  return ReviewCard(review: review);
                },
              );
            }),
          ],
        ),
      ),
      // bottomNavigationBar: Obx(
      //   () => BottomNavigationBar(
      //     currentIndex: controller.currentIndex.value,
      //     onTap: controller.changeTab,
      //     type: BottomNavigationBarType.fixed,
      //     items: const [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //       BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.add_box_outlined),
      //         label: 'Review',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.message_outlined),
      //         label: 'Messages',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person_outline),
      //         label: 'Profile',
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String imageUrl;
  final String category;
  final double rating;
  final int reviewCount;

  const ServiceCard({
    Key? key,
    required this.imageUrl,
    required this.category,
    required this.rating,
    required this.reviewCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          category,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          '$rating • $reviewCount reviews',
          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
        ),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Avatar
          // const CircleAvatar(
          //   radius: 20,
          //   backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          // ),
          const SizedBox(width: 12),
          // Review Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review.userName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Mar 10',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < review.rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(review.comment, style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up_alt_outlined, size: 16),
                      onPressed: () {},
                    ),
                    Text(
                      review.likes.toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(Icons.thumb_down_alt_outlined, size: 16),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy Review class for demonstration (replace with your actual Review model)
class Review {
  final String userName;
  final int rating;
  final String comment;
  final int likes;

  Review({
    required this.userName,
    required this.rating,
    required this.comment,
    required this.likes,
  });
}

// Dummy Business class for demonstration (replace with your actual Business model)
class Business {
  final String name;
  final String hours;
  final String category;

  Business({required this.name, required this.hours, required this.category});
}
