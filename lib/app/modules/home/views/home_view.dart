// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //// create dropdown from categories
              Container(
                width: Get.width,
                height: Get.height / 10,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                // color: Color.fromARGB(255, 184, 184, 184),
                child: Column(
                  children: const [
                    TextField(
                      decoration: InputDecoration(
                        focusColor: Colors.amberAccent,
                        fillColor: Colors.amberAccent,
                        isDense: true,
                        border: OutlineInputBorder(
                          gapPadding: 2,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        hintText: 'Search',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        labelText: 'Search',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // make grid for categories with scroll direction horizontal and have 2 item in row
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
                child: Obx((() => GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1,
                      ),
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        return CardContentProduct(
                            title: controller.categories[index]['name']);
                      },
                    ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HeadingWidget extends StatelessWidget {
  String label;
  Color? color = Color.fromARGB(255, 97, 97, 97);
  HeadingWidget({
    Key? key,
    required this.label,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return CardContentProduct(
            title: controller.categories[index]['name'],
          );
        },
      ),
    );
  }
}

class CardContentProduct extends StatelessWidget {
  String? title;
  CardContentProduct({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 200,
      // height: 200,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 124, 106, 255),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 99, 97, 97).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(96, 0, 0, 0),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://picsum.photos/200/300?food=${Random().nextInt(100)}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            title!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
