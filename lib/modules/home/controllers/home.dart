import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yelp/modules/home/views/home.dart';
import 'package:yelp/modules/search/views/search.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;
  final isLoading = false.obs;
  final searchQuery = ''.obs;
  final businesses = <Business>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBusinesses();
  }

  void changeTab(int index) {
    currentIndex.value = index;
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    fetchBusinesses();
  }

  Future<void> fetchBusinesses() async {
    try {
      isLoading.value = true;

      // TODO: Implement actual API call
      await Future.delayed(Duration(seconds: 1)); // Simulate API call

      // Mock data
      businesses.value = [
        Business(
          id: '1',
          name: 'Burger King',
          rating: 4.2,
          reviewCount: 128,
          imageUrl: 'https://example.com/image1.jpg',
          category: 'Fast Food',
          address: '123 Main St',
          distance: '0.5 miles',
        ),
        Business(
          id: '2',
          name: 'Starbucks',
          rating: 4.5,
          reviewCount: 356,
          imageUrl: 'https://example.com/image2.jpg',
          category: 'Coffee Shop',
          address: '456 Park Ave',
          distance: '0.8 miles',
        ),
        Business(
          id: '3',
          name: 'Pizza Hut',
          rating: 3.8,
          reviewCount: 97,
          imageUrl: 'https://example.com/image3.jpg',
          category: 'Italian',
          address: '789 Oak St',
          distance: '1.2 miles',
        ),
      ];
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load businesses: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    // TODO: Implement actual logout
    Get.offAllNamed(Routes.LOGIN);
  }

  // Dummy list of reviews for demonstration
  List<Review> reviews = [
    Review(
      userName: 'Grace H.',
      rating: 5,
      comment:
          'Found a great electrician through this service. Easy to use, with accurate reviews. Highly recommend!',
      likes: 1,
    ),
    Review(
      userName: 'Alex M.',
      rating: 4,
      comment:
          'Hired a plumber for a quick fix. The service was good, but the response time could be better.',
      likes: 3,
    ),
    Review(
      userName: 'Samantha L.',
      rating: 3,
      comment:
          'The cleaning service was okay, but I expected a bit more attention to detail for the price.',
      likes: 0,
    ),
    Review(
      userName: 'James T.',
      rating: 5,
      comment:
          'Amazing experience with a local contractor! They finished the project ahead of schedule.',
      likes: 5,
    ),
    Review(
      userName: 'Emily R.',
      rating: 2,
      comment:
          'The service was late, and the quality wasn’t what I expected. Disappointing experience.',
      likes: 2,
    ),
  ];
}

class Business {
  final String id;
  final String name;
  final double rating;
  final int reviewCount;
  final String imageUrl;
  final String category;
  final String address;
  final String distance;

  Business({
    required this.id,
    required this.name,
    required this.rating,
    required this.reviewCount,
    required this.imageUrl,
    required this.category,
    required this.address,
    required this.distance,
  });

  // List of pages for each tab
  final List<Widget> pages = [
    const HomeView(), // Home tab
    const SearchView(), // Search tab
    // const Placeholder(), // Post tab (replace with actual view)
    // const Placeholder(), // Orders tab (replace with actual view)
    // const Placeholder(), // Account tab (replace with actual view)
  ];
}
