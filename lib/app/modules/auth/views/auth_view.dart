import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_uma/app/routes/app_pages.dart';

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
                        text: 'GO UMKM MAsa Depan',
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

                // Icon(Icons.image, size: 333, color: Colors.white),
                Form(
                  key: _form,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style:
                            TextStyle(color: Color.fromARGB(255, 77, 73, 73)),
                        // controller: user,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Color.fromARGB(255, 67, 62, 62),
                            width: 2,
                          )),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Color.fromARGB(255, 75, 69, 69),
                            width: 2,
                          )),
                          focusColor: Color.fromARGB(255, 63, 59, 59),
                          hintText: "Email",
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 74, 71, 71),
                          ),
                          prefixIcon: Icon(Icons.person,
                              color: Color.fromARGB(255, 64, 60, 60)),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Email cannot be empty';
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style:
                            TextStyle(color: Color.fromARGB(255, 64, 60, 60)),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'password cannot be empty';
                          } else if (text.length < 8) {
                            return "Enter valid password of more then 8 characters!";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Color.fromARGB(255, 64, 60, 60),
                            width: 2,
                          )),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Color.fromARGB(255, 64, 60, 60),
                            width: 2,
                          )),
                          focusColor: Color.fromARGB(255, 64, 60, 60),
                          hintText: "Password",
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 64, 60, 60),
                          ),
                          prefixIcon: Icon(Icons.lock,
                              color: Color.fromARGB(255, 64, 60, 60)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.visibility,
                              color: Color.fromARGB(255, 64, 60, 60),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
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
