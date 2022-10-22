import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          // create appbar like gofood
          SliverAppBar(
            expandedHeight: 200,
            floating: true,
            stretch: true,
            pinned: true,
            snap: true,
            elevation: 0,
            title: Text(
              'Go Uma',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 4, 8),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            backgroundColor: Color.fromARGB(255, 110, 91, 255),
            // bottom: PreferredSize(
            //     preferredSize: Size.zero,
            //     child: Container(
            //       color: Colors.white,
            //       child: Row(
            //         children: [
            //           // make for filter
            //           IconButton(
            //               onPressed: () {}, icon: Icon(Icons.filter_list)),
            //         ],
            //       ),
            //     )),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://placeimg.com/640/480/any',
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_basket_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: 100,
            (context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 189, 189, 189).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://placeimg.com/640/480/any${index}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Name sd kajsd kajdh kajshd kajhds akjdsh kadhkaj ',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 4, 8),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '#Makanan, #Minuman ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 102, 99, 255),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Jarak 1.5 km',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 4, 8),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ))
        ],
      ),
    ));
  }
}
