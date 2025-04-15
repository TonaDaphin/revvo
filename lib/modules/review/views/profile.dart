import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yelp/modules/home/controllers/home.dart';

class ProfileView extends GetView<HomeController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navigate back to the previous page
          },
        ),
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Photo
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: NetworkImage('https://picsum.photos/150'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            // Edit Profile Photo Button
            Center(
              child: OutlinedButton(
                onPressed: () {
                  // Handle edit profile photo logic here
                  Get.snackbar(
                    'Info',
                    'Edit profile photo functionality coming soon!',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey.shade400),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Edit Profile Photo',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // User Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  // CircleAvatar(
                  //   radius: 30,
                  //   child: ClipOval(
                  //     child: Image.network(
                  //       'https://picsum.photos/150',
                  //       fit: BoxFit.cover,
                  //       width: 60,
                  //       height: 60,
                  //       errorBuilder: (context, error, stackTrace) {
                  //         return const Icon(
                  //           Icons.person,
                  //           color: Colors.grey,
                  //           size: 60,
                  //         );
                  //       },
                  //       loadingBuilder: (context, child, loadingProgress) {
                  //         if (loadingProgress == null) return child;
                  //         return const CircularProgressIndicator();
                  //       },
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Allison Williams',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '@allisonw2043',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Location and Job
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'San Francisco, California',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.work_outline, color: Colors.grey.shade600),
                      const SizedBox(width: 8),
                      Text(
                        'Software Engineer at Netflix',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Bio Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'BIO',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Futuristic dreamer. Software engineer at Netflix. Dog lover.',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
              ),
            ),
            const SizedBox(height: 16),

            // Hobbies Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'HOBBIES',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  _buildHobbyChip('Hiking', Icons.directions_walk),
                  _buildHobbyChip('Movies', Icons.movie),
                  _buildHobbyChip('Cooking', Icons.kitchen),
                  _buildHobbyChip('Dogs', Icons.pets),
                  _buildHobbyChip('Roadtrip', Icons.directions_car),
                  _buildHobbyChip('Climbing', Icons.terrain),
                  _buildHobbyChip('Web Design', Icons.web), // New hobby
                  _buildHobbyChip('Art', Icons.brush), // New hobby
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Birthday Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.cake_outlined, color: Colors.grey.shade600),
                  const SizedBox(width: 8),
                  Text(
                    'Birthday: Feb 14, 1990',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Log Out Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle log out logic here
                    Get.snackbar(
                      'Logged Out',
                      'You have been logged out successfully!',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    // Example: Navigate to a login screen
                    // Get.offAllNamed('/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Log Out', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
            const SizedBox(height: 16),
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
      //         icon: Icon(Icons.rate_review),
      //         label: 'Review',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.message_outlined),
      //         label: 'Messages',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person_outline),
      //         label: 'Account',
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _buildHobbyChip(String label, IconData icon) {
    return Chip(
      avatar: Icon(icon, size: 18, color: Colors.grey.shade600),
      label: Text(label),
      backgroundColor: Colors.grey.shade200,
      labelStyle: const TextStyle(color: Colors.black),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
