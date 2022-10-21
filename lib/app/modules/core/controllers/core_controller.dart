import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_uma/app/modules/home/controllers/home_controller.dart';
import 'package:go_uma/app/modules/home/views/home_view.dart';

class CoreController extends GetxController {
  //TODO: Implement CoreController

  RxInt currentPage = 0.obs;
  List<Widget> views = [
    HomeView(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Color.fromARGB(255, 0, 4, 8),
    ),
    Container(
      color: Color.fromARGB(255, 0, 4, 8),
    ),
  ].obs;

  // run controller per page
  void removeController() {
    if (currentPage.value != 0) {}
  }

  void onChangePage(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
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
