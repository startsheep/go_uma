// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_uma/app/modules/home/views/category_widget.dart';
import 'package:go_uma/app/routes/app_pages.dart';
import 'package:go_uma/app/widgets/card_content_product.dart';
import 'package:go_uma/app/widgets/text_heading.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 254, 254),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 254, 254),
        elevation: 0,
        title: Text(
          'Go Uma',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 4, 8),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showCart();
            },
            icon: Icon(
              Icons.shopping_basket_outlined,
              size: 30,
              color: Color.fromARGB(255, 110, 32, 255),
            ),
          ),
          // inkwell with avatar
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                radius: 20,
                backgroundImage:
                    NetworkImage('https://placeimg.com/640/480/any'),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //// create dropdown from categorie
              SizedBox(
                height: 15,
              ), // make grid for categories with scroll direction horizontal and have 2 item in row
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 3 / 1,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(15.0),
                        // margin: EdgeInsets.symmetric(horizontal: 5.0),s
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://picsum.photos/200/300?food=$i',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Food $i',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Description $i',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: HeadingWidget(
                  label: 'Cari Kebutuhan Kamu',
                ),
              ),
              CategoryWidget(
                controller: controller,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: HeadingWidget(
                  label: 'Ada Kebutuhan Rumah tangga nih ',
                ),
              ),
              SizedBox(
                height: Get.height / 7,
                child: Obx(
                  (() => GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1,
                        ),
                        itemCount: controller.categories.length,
                        itemBuilder: (context, index) {
                          return CardContentProduct(
                            onTap: () {
                              Get.toNamed(Routes.PRODUCT);
                            },
                            outerColor: Color.fromARGB(255, 252, 252, 252),
                            innerColor: Color.fromARGB(255, 246, 246, 246),
                            color: Colors.black,
                            title: controller.categories[index]['name'],
                          );
                        },
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: HeadingWidget(
                  label: 'Jajanan Kaki Lima ',
                ),
              ),
              SizedBox(
                height: Get.height / 7,
                child: Obx(
                  (() => GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1,
                        ),
                        itemCount: controller.categories.length,
                        itemBuilder: (context, index) {
                          return CardContentProduct(
                            outerColor: Color.fromARGB(255, 252, 252, 252),
                            innerColor: Color.fromARGB(255, 246, 246, 246),
                            color: Colors.black,
                            image:
                                'https://images.spoonacular.com/file/wximages/423186-636x393.png',
                            title: controller.categories[index]['name'],
                          );
                        },
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showCart() {
    Get.bottomSheet(
      Container(
        height: Get.height,
        color: Colors.white,
        child: Column(
          children: [
            // make title keranjang
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Keranjang',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Edit',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
