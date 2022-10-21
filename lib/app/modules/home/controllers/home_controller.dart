import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final List categories = [
    {
      'id': 1,
      'name': 'Fruits',
    },
    {
      'id': 2,
      'name': 'Vegetables',
    },
    {
      'id': 3,
      'name': 'Meat',
    },
    {
      'id': 4,
      'name': 'Fish',
    },
    {
      'id': 5,
      'name': 'Dairy',
    },
    {
      'id': 6,
      'name': 'Bakery',
    },
    {
      'id': 7,
      'name': 'Drinks',
    },
    {
      'id': 8,
      'name': 'Snacks',
    },
    {
      'id': 9,
      'name': 'Others',
    },
  ].obs;
  final List subCategories = [
    {
      'id': 1,
      'name': 'Fruits',
    },
    {
      'id': 2,
      'name': 'Vegetables',
    },
    {
      'id': 3,
      'name': 'Meat',
    },
    {
      'id': 4,
      'name': 'Fish',
    },
    {
      'id': 5,
      'name': 'Dairy',
    },
    {
      'id': 6,
      'name': 'Bakery',
    },
    {
      'id': 7,
      'name': 'Drinks',
    },
    {
      'id': 8,
      'name': 'Snacks',
    },
    {
      'id': 9,
      'name': 'Others',
    },
  ].obs;
  final dynamic selectedCategory = {}.obs;
  final dynamic selectedSubCategory = {}.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
