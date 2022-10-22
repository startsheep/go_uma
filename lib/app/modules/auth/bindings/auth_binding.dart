import 'package:get/get.dart';
import 'package:go_uma/app/modules/auth/providers/auth_provider.dart';
import 'package:sp_util/sp_util.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.putAsync(() => SpUtil.getInstance());
  }
}
