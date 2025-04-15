import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yelp/modules/home/views/home.dart';
import 'package:yelp/modules/navigation/controllers/navigation.dart';
import 'package:yelp/modules/review/views/profile.dart';
import 'package:yelp/modules/search/views/search.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeView(),
      const SearchView(),
      const ProfileView(),
      
    ];
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: screens[controller.tabIndex.value],
        bottomNavigationBar: BottomNavigationBar(
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
              label: 'Profile',
            ),
            
          ],
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          unselectedLabelStyle: const TextStyle(),
          selectedItemColor: const Color.fromARGB(240, 83, 158, 243),
          elevation: 0,
          currentIndex: controller.tabIndex.value,
          onTap: (index) {
            controller.changeTabIndex(index);
          },
        ),
      ),
    );
  }
}
