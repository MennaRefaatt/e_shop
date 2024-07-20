import 'package:e_shop/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtonWithIcon extends StatelessWidget {
  AppButtonWithIcon({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.borderRadius,
    this.margin,
    this.padding,
    this.textColor = Colors.white,
    this.backgroundColor = AppColors.primary,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final Color textColor;
  final Widget icon;
   Color backgroundColor;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    borderRadius ??= BorderRadius.circular(20.sp);
    margin ??= EdgeInsets.symmetric(horizontal: 30.sp);
    padding ??=  EdgeInsets.symmetric(vertical: 15.sp);

    return Container(
      margin: margin,
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: icon,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: borderRadius!,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(backgroundColor)
        ),
        onPressed: onPressed,
        label:Padding(
          padding: padding!,
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
