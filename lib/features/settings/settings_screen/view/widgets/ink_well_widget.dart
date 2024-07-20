import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/utils/spacing.dart';

Widget inkWell(
    {required IconData icon,
      required String text,
      required BuildContext context,
      required onTap}) {
  return InkWell(
    onTap: onTap,
    splashColor: Colors.transparent,
    borderRadius: BorderRadius.circular(20.sp),
    highlightColor: Colors.transparent,
    child: Container(
      padding: EdgeInsets.all(10.sp),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: 25.sp,
            color: AppColors.primary,
          ),
          horizontalSpacing(10.w),
          Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              )),
          Icon(
            Icons.arrow_forward_ios,
            size: 18.sp,
          ),
        ],
      ),
    ),
  );
}