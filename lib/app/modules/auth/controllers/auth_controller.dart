import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_uma/app/routes/app_pages.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passwordController =
      TextEditingController().obs;
  final Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;
  final Rx<TextEditingController> nameController = TextEditingController().obs;
  final Rx<TextEditingController> phoneController = TextEditingController().obs;
  final Rx<TextEditingController> addressController =
      TextEditingController().obs;
  final Rx<TextEditingController> cityController = TextEditingController().obs;
  final Rx<TextEditingController> stateController = TextEditingController().obs;

  final RxBool isLogin = true.obs;
  final RxBool isLoading = false.obs;

  void login() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 3));
    isLoading.value = false;
    Get.offNamed(Routes.CORE);
  }

  void register() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 5));
    isLoading.value = false;
    Get.offNamed(Routes.CORE);
  }

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
