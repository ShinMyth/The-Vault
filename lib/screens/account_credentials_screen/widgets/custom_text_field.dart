import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.obscureText,
    required this.label,
    this.suffixIcon,
  }) : super(key: key);

  final TextEditingController controller;
  final bool? obscureText;
  final Widget label;
  final Widget? suffixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText ?? false,
      style: TextStyle(
        fontSize: 17.5.sp,
      ),
      decoration: InputDecoration(
        label: widget.label,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
