import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_uma/app/modules/auth/providers/auth_provider.dart';
import 'package:go_uma/app/routes/app_pages.dart';
import 'package:sp_util/sp_util.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();

  final RxBool isLogin = true.obs;
  final RxBool isLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;

  void login() async {
    isLoading.value = true;
    final response = await Get.find<AuthProvider>().login(
      phoneController.text,
      passwordController.text,
    );
    // print(response.body);
    if (response.statusCode == 200) {
      SpUtil.putBool('isAuth', true);
      update();
      Get.offAllNamed(Routes.CORE);
    } else {
      Get.snackbar(
          'Ada yang salah', 'periksa kembali telepon dan password anda',
          backgroundColor: Color.fromARGB(255, 255, 231, 143));
    }
    print(SpUtil.getBool('isAuth'));
    isLoading.value = false;
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
    Get.lazyPut<AuthProvider>(() => AuthProvider());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
