import 'package:get/get.dart';

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://api.gouma.nataysa.com/api';
  }

  Future<Response> login(String phone, String password) async {
    final response = await post('/auth/login', {
      'phone': phone,
      'password': password,
    });

    return response;
  }
}
