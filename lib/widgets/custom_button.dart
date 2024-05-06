import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/my_colors.dart';
import '../utils/my_textstyle.dart';
class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final Color? labelColor;
  final Color? bgColor;
  final double? height;
  final double? width;
  final TextStyle? style;
  final Color? shadowColor;
  final BoxBorder? border;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.bgColor,
    this.labelColor,
    this.height,
    this.width,
    this.style,
    this.border,
    this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 5.5.h,
        width: width ?? 100.w,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.red,
          borderRadius: BorderRadius.circular(11),
          border: border ??
              Border.all(
                width: 0,
                color: bgColor ?? MyColors.primaryColor,
              ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              color: shadowColor ?? MyColors.shadowColor,
              blurRadius: 5,
              spreadRadius: -2,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: style ??
              TextStyleHelper.h5.copyWith(
                color: labelColor ?? MyColors.whiteColor,
              ),
        ),
      ),
    );
  }
}
