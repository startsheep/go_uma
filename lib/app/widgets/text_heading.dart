import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  String label;
  Color? color;
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
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: color ?? Color.fromARGB(255, 130, 130, 130),
      ),
    );
  }
}
