import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/spacing.dart';
import 'package:e_shop/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.hint,
      this.keyboardType,
      this.borderRadius,
      this.margin,
      this.padding,
      this.textColor = Colors.black,
      this.controller,
      this.obscureText = false,
      this.textInputAction,
      this.backgroundColor,
      this.onFieldSubmitted,
      this.label = "",
      this.labelColor,
      this.labelSize,
      this.labelFontWeight,
      this.suffixIcon,
      this.initValue,
      this.maxLength,
      this.counterText,
      this.inputFormatters,
      this.onChanged,
      this.prefixIcon,
      this.validator,
      required this.title,
      this.enabled,
      this.filledColor,
      this.withTitle = false,
      this.titleIcon = "",
      this.minLines = 1,
      this.maxLines = 1,
      this.textAlign});

  final Color textColor;
  final String hint;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;
  final bool obscureText;
  final ValueChanged<String>? onFieldSubmitted;
  final String label;
  final String title;
  final String? initValue;
  final Color? labelColor;
  final double? labelSize;
  final FontWeight? labelFontWeight;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final String? counterText;
  final String? titleIcon;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator? validator;
  final bool? enabled;
  final bool? withTitle;
  final Color? filledColor;
  final ValueChanged<String>? onChanged;
  final int minLines;
  final int maxLines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: withTitle!,
            child: Row(
              children: [
                AppSVG(assetName: titleIcon!),
                horizontalSpacing(10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
          verticalSpacing(10),
          TextFormField(
            textAlign: textAlign ?? TextAlign.start,
            minLines: minLines,
            maxLines: maxLines,
            enabled: enabled,
            validator: validator,
            onChanged: onChanged,
            initialValue: initValue,
            obscureText: obscureText,
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.text,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              errorStyle: const TextStyle(),
              hintText: hint,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14.sp,
                color: AppColors.grey,
              ),
              labelText: label,
              labelStyle: TextStyle(
                color: labelColor,
                fontSize: labelSize,
                fontWeight: labelFontWeight,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.h, horizontal: 19.sp),
              fillColor: filledColor,
              filled: true,
              errorMaxLines: 2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.r),
                borderSide: const BorderSide(color: AppColors.greyBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.r),
                borderSide: const BorderSide(color: AppColors.greyBorder),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.r),
                borderSide: const BorderSide(color: AppColors.greyBorder),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.r),
                borderSide: const BorderSide(color: AppColors.greyBorder),
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              counterText: counterText,
            ),
          ),
        ],
      ),
    );
  }
}
