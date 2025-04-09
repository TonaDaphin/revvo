import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class OnboardingController extends GetxController {
  final currentPage = 0.obs;
  
  final pages = [
    OnboardingPage(
      title: 'Discover Local Businesses',
      description: 'Find the best restaurants, cafes, and shops near you.',
      image: 'assets/images/onboarding1.png',
    ),
    OnboardingPage(
      title: 'Read & Write Reviews',
      description: 'Share your experiences and read what others have to say.',
      image: 'assets/images/onboarding2.png',
    ),
    OnboardingPage(
      title: 'Save Your Favorites',
      description: 'Create a list of your favorite places to visit again.',
      image: 'assets/images/onboarding3.png',
    ),
  ];
  
  bool get isLastPage => currentPage.value == pages.length - 1;
  
  void nextPage() {
    if (isLastPage) {
      completeOnboarding();
    } else {
      currentPage.value++;
    }
  }
  
  void skipOnboarding() {
    completeOnboarding();
  }
  
  void completeOnboarding() {
    // TODO: Save that onboarding is complete
    Get.offAllNamed(Routes.LOGIN);
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final String image;
  
  OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
  });
}
