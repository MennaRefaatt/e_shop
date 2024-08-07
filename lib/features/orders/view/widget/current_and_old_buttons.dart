import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../../../generated/l10n.dart';

class CurrentAndOldButtons extends StatefulWidget {
  const CurrentAndOldButtons({super.key});

  @override
  State<CurrentAndOldButtons> createState() => _CurrentAndOldButtonsState();
}

class _CurrentAndOldButtonsState extends State<CurrentAndOldButtons> {
  bool isCurrentSelected = true;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 180.w,
      padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 10.sp),
      decoration: BoxDecoration(
        color: AppColors.greyBorder.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isCurrentSelected = true;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: 10.sp, horizontal: 20.sp),
              decoration: BoxDecoration(
                color: isCurrentSelected
                    ? AppColors.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Text(
                "current",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: isCurrentSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isCurrentSelected = false;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: 10.sp, horizontal: 20.sp),
              decoration: BoxDecoration(
                color: !isCurrentSelected
                    ? AppColors.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Text(
                S().old,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: !isCurrentSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
