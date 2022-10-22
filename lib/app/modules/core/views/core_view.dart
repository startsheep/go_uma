import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/core_controller.dart';

class CoreView extends GetView<CoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Obx(
            () => controller.views[controller.currentPage.value],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (value) => controller.changePage(value),
            currentIndex: controller.currentPage.value,
            showUnselectedLabels: false,
            selectedItemColor: Color.fromARGB(255, 142, 67, 255),
            selectedFontSize: 16,
            unselectedItemColor: Colors.grey,
            // backgroundColor: Color.fromARGB(255, 215, 215, 215),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(
                  Icons.home,
                ),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined),
                activeIcon: Icon(Icons.location_on),
                label: 'Sekitar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_outlined),
                activeIcon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ));
  }
}
