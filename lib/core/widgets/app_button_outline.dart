import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppOutlineButton extends StatelessWidget {
  AppOutlineButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.borderRadius,
    this.margin,
    this.padding,
    this.textColor = Colors.black,
    this.width = double.infinity,
    this.fontSize,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final Color textColor;
  final double width;
  final double? fontSize;
  final Color? backgroundColor;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 30.sp),
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: backgroundColor!, width: 1), // Red border
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r), // Border radius
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: padding ?? EdgeInsets.symmetric(vertical: 15.sp),
          child: Text(
            label,
            maxLines: 1,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: fontSize ?? 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
