// create same Reusable text form field

import 'package:flutter/material.dart';

class ReuseTextFiled extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final bool? isPassword;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final dynamic validator;
  final Function(String)? onChanged;
  final Function(String)? onSaved;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final bool? readOnly;
  final int? maxLines;
  final int? minLines;
  final bool? autofocus;
  final bool? obscureText;
  final String? labelText;
  final Color? labelColor;
  final Color? fillColor;
  final Color? focusColor;
  final Color? cursorColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? disabledBorderColor;
  final Color? prefixIconColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  ReuseTextFiled({
    super.key,
    this.hintText = 'Hint Text Here',
    this.icon,
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.focusNode,
    this.textInputAction,
    this.enabled,
    this.readOnly,
    this.maxLines,
    this.minLines,
    this.autofocus,
    this.obscureText,
    this.labelText,
    this.labelColor,
    this.fillColor,
    this.focusColor,
    this.cursorColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.disabledBorderColor,
    this.prefixIconColor,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: enabledBorderColor ?? Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: focusedBorderColor ?? Color.fromARGB(255, 134, 82, 255),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
    );
  }
}
