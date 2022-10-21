import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_uma/app/routes/app_pages.dart';
import 'package:go_uma/app/widgets/reuse_text_field.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>();
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.blue,
        //   title: Text("Login"),
        // ),
        body: SafeArea(
      child: SingleChildScrollView(
        reverse: true,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            alignment: Alignment.center,
            width: double.infinity,
            height: Get.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Selamat Datang di ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'GoUma\n',
                        style: TextStyle(
                          color: Color.fromARGB(255, 159, 94, 238),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' GO UMKM Masa Depan',
                        style: TextStyle(
                          color: Color.fromARGB(255, 111, 111, 111),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Ayo Berkunjung Untuk Mendukung UMKM\n",
                  style: TextStyle(
                    color: Color.fromARGB(255, 111, 111, 111),
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // Obx(() => Text(controller.phoneController.value.text)),
                // Icon(Icons.image, size: 333, color: Colors.white),
                Form(
                  key: _form,
                  child: Column(
                    children: [
                      ReuseTextFiled(
                        hintText: "Telepon",
                        keyboardType: TextInputType.phone,
                        controller: controller.phoneController,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Color.fromARGB(255, 134, 82, 255),
                        ),
                        validator: (p0) {
                          if (p0!.isEmpty || p0.length < 1) {
                            return "Telepon tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        return ReuseTextFiled(
                          hintText: "Password",
                          controller: controller.passwordController,
                          obscureText: controller.isPasswordVisible.value,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 134, 82, 255),
                          ),
                          validator: (p0) {
                            if (p0!.isEmpty || p0.length < 1) {
                              return "Password tidak boleh kosong";
                            } else if (p0.length < 8) {
                              return "Password tidak boleh kurang dari 6 karakter";
                            }
                            return null;
                          },
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.isPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color.fromARGB(255, 134, 82, 255),
                            ),
                            onPressed: () {
                              controller.isPasswordVisible.value =
                                  !controller.isPasswordVisible.value;
                            },
                          ),
                        );
                      }),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 60,
                        width: Get.height,
                        child: Obx(() {
                          return controller.isLoading.value
                              ? Center(
                                  child: CircularProgressIndicator(
                                  color: Color.fromARGB(255, 159, 94, 238),
                                ))
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 159, 94, 238),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_form.currentState!.validate()) {
                                      controller.login();
                                    }
                                  },
                                  child: Text(
                                    "Masuk",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                );
                        }),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: ,
                        children: [
                          SizedBox(height: 10),
                          Text("Belum punya akun?",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 50, 49, 49))),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.REGiSTER);
                            },
                            child: Text(" Daftar!",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 50, 49, 49),
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline)),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            )),
      ),
    ));
  }
}
