import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.borderRadius,
    this.margin,
    this.padding,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height,
    this.fontSize,
    this.backgroundColor,
    this.withIcon = false,
    this.icons,
  });

  final VoidCallback onPressed;
  final String label;
  final Color textColor;
  final double width;
  final double? height;
  final double? fontSize;
  final Color? backgroundColor;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
 final bool? withIcon;
 final IconData? icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40.h,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 30.sp),
      width: width,
      child: ElevatedButton.icon(
        icon: Visibility(
          visible: withIcon!,
          child: Icon(icons, color: textColor),
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(20.r),
            ),
          ),
        ),
        onPressed: onPressed,
        label: Padding(
          padding: padding ?? EdgeInsets.all(0.sp),
          child: Text(
            label,
            maxLines: 1,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize ?? 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
