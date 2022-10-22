import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_uma/app/modules/home/controllers/home_controller.dart';
import 'package:go_uma/app/modules/home/views/home_view.dart';
import 'package:go_uma/app/modules/maps/controllers/maps_controller.dart';
import 'package:go_uma/app/modules/maps/views/maps_view.dart';
import 'package:go_uma/app/modules/profile/views/profile_view.dart';

class CoreController extends GetxController {
  //TODO: Implement CoreController

  RxInt currentPage = 0.obs;
  List<Widget> views = [
    HomeView(),
    MapsView(),
    ProfileView(),
    Container(
      color: Color.fromARGB(255, 0, 4, 8),
    ),
  ].obs;

  // run controller per page
  void removeController() {
    if (currentPage.value != 0) {
      Get.delete<HomeController>();
    }
    if (currentPage.value != 1) {
      Get.delete<MapsController>();
    }
  }

  void onChangePage(int index) {
    switch (index) {
      case 0:
        Get.lazyPut<HomeController>(() => HomeController());
        Get.find<HomeController>().onInit();
        break;
      case 1:
        Get.lazyPut<MapsController>(() => MapsController());
        Get.find<MapsController>().onInit();
        break;

      case 2:
        break;
      default:
    }
  }

  @override
  void onInit() {
    super.onInit();
    ever(
      currentPage,
      (_) {
        onChangePage(currentPage.value);
        removeController();
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    ever(currentPage, (_) {
      onChangePage(currentPage.value);
    });
    print('onReady');
  }

  @override
  void onClose() {
    super.onClose();
    print('onClose');
  }

  void changePage(int newPage) {
    currentPage.value = newPage;
    update();
  }

  // create function date time from now
}
