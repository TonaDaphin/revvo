import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yelp/modules/search/controllers/search.dart';

// class SearchController extends GetxController {
//   var currentIndex = 1.obs; // Set to 1 since this is the Search tab
//   var isLoading = false.obs;
//   var reviews = [].obs;

//   void changeTab(int index) {
//     currentIndex.value = index;
//   }
// }

class SearchView extends GetView<SearchingController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Find businesses',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),

            // Category Chips
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryChip('Restaurants'),
                    const SizedBox(width: 8),
                    _buildCategoryChip('Coffee & Tea'),
                    const SizedBox(width: 8),
                    _buildCategoryChip('Grocery'),
                    const SizedBox(width: 8),
                    _buildCategoryChip('Delivery'),
                  ],
                ),
              ),
            ),

            // Popular Businesses Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Popular businesses',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                BusinessCard(
                  logoColor: Colors.purple,
                  name: 'Taco Bell',
                  status: 'Open now • 24 hours',
                  category: 'Mexican, Fast Food',
                ),
                BusinessCard(
                  logoColor: Colors.brown,
                  name: 'Starbucks',
                  status: 'Open now • 6am-8pm',
                  category: 'Coffee & Tea',
                ),
                BusinessCard(
                  logoColor: Colors.red,
                  name: 'Safeway',
                  status: 'Open now • 5am-9pm',
                  category: 'Grocery',
                ),
                BusinessCard(
                  logoColor: Colors.green,
                  name: 'Amazon Fresh',
                  status: 'Open now • 24 hours',
                  category: 'Grocery',
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'Review',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey.shade200,
      labelStyle: const TextStyle(color: Colors.black),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
// / Business Card Widget
class BusinessCard extends StatelessWidget {
  final Color logoColor;
  final String name;
  final String status;
  final String category;

  const BusinessCard({
    Key? key,
    required this.logoColor,
    required this.name,
    required this.status,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: logoColor,
              borderRadius: BorderRadius.circular(8),
            ),
            // Placeholder for logo
            child: const Center(
              child: Icon(Icons.store, color: Colors.white, size: 30),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  category,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}