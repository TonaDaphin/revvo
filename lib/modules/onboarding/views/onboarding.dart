import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/onboarding.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: controller.skipOnboarding,
                child: Text('Skip'),
              ),
            ),
            
            // Page View
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) => controller.currentPage.value = index,
                itemCount: controller.pages.length,
                itemBuilder: (context, index) {
                  final page = controller.pages[index];
                  return Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image placeholder
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            index == 0 ? Icons.explore :
                            index == 1 ? Icons.rate_review :
                            Icons.favorite,
                            size: 80,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        SizedBox(height: 40),
                        
                        // Title
                        Text(
                          page.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        
                        // Description
                        Text(
                          page.description,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            
            // Indicator & Button
            Padding(
              padding: EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Page Indicator
                  Row(
                    children: List.generate(
                      controller.pages.length,
                      (index) => Obx(() => Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.currentPage.value == index
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade300,
                        ),
                      )),
                    ),
                  ),
                  
                  // Next Button
                  Obx(() => ElevatedButton(
                    onPressed: controller.nextPage,
                    child: Text(controller.isLastPage ? 'Get Started' : 'Next'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
