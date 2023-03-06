import 'package:vault/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomPinCircle extends StatefulWidget {
  const CustomPinCircle({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  State<CustomPinCircle> createState() => _CustomPinCircleState();
}

class _CustomPinCircleState extends State<CustomPinCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.w,
      width: 4.w,
      decoration: BoxDecoration(
        color: widget.color,
        border: Border.all(
          color: color02,
          width: 2,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
