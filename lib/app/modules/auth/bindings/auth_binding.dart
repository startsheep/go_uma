import 'package:get/get.dart';
import 'package:go_uma/app/modules/auth/providers/auth_provider.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut<AuthProvider>(() => AuthProvider());
  }
}
