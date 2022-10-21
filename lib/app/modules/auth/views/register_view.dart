import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:go_uma/app/modules/auth/controllers/auth_controller.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Fill Your Profile",
            style: TextStyle(color: Colors.black),
          ),
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 64, 60, 60),
            ),
          ),
        ),
        body: SingleChildScrollView(
          // reverse: true,
          child: Container(
              // height: MediaQuery.of(context).size.height,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ImageWithIcon(),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          'https://placeimg.com/640/480/people',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Form(
                        key: _form,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Column(
                            children: [
                              TextFormField(
                                // controller: namaDepan,
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                    width: 2,
                                  )),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                    width: 2,
                                  )),
                                  hintText: "Hanya Contoh",
                                  labelText: 'Nama Depan',
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                  ),
                                  prefixIcon: Icon(Icons.person,
                                      color: Color.fromARGB(255, 48, 48, 48)),
                                ),
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Nama depan tidak boleh kosong';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                // controller: namaBelakang,
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                    width: 2,
                                  )),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                    width: 2,
                                  )),
                                  hintText: "Hanya Contoh",
                                  labelText: 'Nama Belakang',
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                  ),
                                  prefixIcon: Icon(Icons.person,
                                      color: Color.fromARGB(255, 48, 48, 48)),
                                ),
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Nama belakang tidak boleh kosong';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                // controller: email,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Email tidak boleh kosong';
                                  }
                                },
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                    width: 2,
                                  )),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                    width: 2,
                                  )),
                                  hintText: "ex@sample.com",
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                  ),
                                  prefixIcon: Icon(Icons.email,
                                      color: Color.fromARGB(255, 48, 48, 48)),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                // controller: telepon,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Nomor Telpon Tidak Boleh Kosong';
                                  }
                                },
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                    width: 2,
                                  )),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                    width: 2,
                                  )),
                                  hintText: "08xxxxxxxxxxxx",
                                  labelText: 'Telp',
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                  ),
                                  prefixIcon: Icon(Icons.call,
                                      color: Color.fromARGB(255, 48, 48, 48)),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                // controller: password,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Password Tidak Boleh Kosong';
                                  } else if (text.length < 8) {
                                    return "Password harus lebih 8 karakter!";
                                  }
                                },
                                // obscureText: _isObpass,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                    width: 2,
                                  )),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                    width: 2,
                                  )),
                                  hintText: "password",
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                  ),
                                  prefixIcon: Icon(Icons.lock,
                                      color: Color.fromARGB(255, 48, 48, 48)),
                                  suffixIcon: IconButton(
                                    // icon: _isObpass
                                    icon: Icon(
                                      Icons.visibility,
                                      color: Color.fromARGB(255, 48, 48, 48),
                                    ),

                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                // controller: passwordConfirm,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Konfirmasi password harap diisi';
                                  } else if (text != 1) {
                                    return "Password tidak cocok";
                                  }
                                },
                                // obscureText: _isObcpass,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                    width: 2,
                                  )),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                    width: 2,
                                  )),
                                  hintText: "password",
                                  labelText: 'Konfirmasi Password',
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                  ),
                                  prefixIcon: Icon(Icons.lock,
                                      color: Color.fromARGB(255, 48, 48, 48)),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.visibility,
                                      color: Color.fromARGB(255, 48, 48, 48),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              // NOTE: BUTTON REGISTER
                              SizedBox(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  child: Obx(
                                    () {
                                      return controller.isLoading.value
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Color.fromARGB(
                                                    255, 48, 48, 48),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              onPressed: () {
                                                if (_form.currentState!
                                                    .validate()) {
                                                  controller.register();
                                                }
                                              },
                                              child: Text(
                                                "Register",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            );
                                    },
                                  )),

                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Sudah Punya Akun?",
                                      style: TextStyle(fontSize: 18)),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(" Masuk",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.black)),
                                  ),
                                ],
                              ),
                              SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
