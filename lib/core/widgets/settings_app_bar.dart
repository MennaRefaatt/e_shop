
import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsAppBar extends StatelessWidget {
  const SettingsAppBar({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => pop(context),
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.black,
            size: 24.sp,
          ),
        ),
        SizedBox(
          width: 18.sp,
        ),
        Text(
         title,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black),
        ),
      ],
    );
  }
}
