import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardContentProduct extends StatelessWidget {
  String? title;
  Color? outerColor;
  Color? innerColor;
  Color? color;
  Function? onTap;
  CardContentProduct({
    Key? key,
    required this.title,
    this.outerColor,
    this.innerColor,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: outerColor ?? Color.fromARGB(255, 131, 93, 255),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 189, 189, 189).withOpacity(0.5),
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
                  color: innerColor ?? Color.fromARGB(121, 221, 221, 221),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://img.icons8.com/material-outlined/344/product.png',
                    ),
                    scale: 10,
                  ),
                ),
              ),
            ),
            Text(
              title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color ?? Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
