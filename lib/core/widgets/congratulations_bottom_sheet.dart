import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/navigators.dart';
import 'package:e_shop/core/utils/svg.dart';
import 'package:e_shop/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void congratulationsBottomSheet(
    BuildContext context, String title, String buttonText, Widget screen) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 20.sp,
              horizontal: 25.sp,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.sp),
                topLeft: Radius.circular(30.sp),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 30.sp,
                ),
                const AppSVG(assetName: 'images/right_mark.svg'),
                SizedBox(
                  height: 15.sp,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.purple,
                  ),
                ),
                SizedBox(height: 25.sp),
                AppButton(
                  onPressed: () => pushAndRemoveUntil(context, screen),
                  label: buttonText,
                  margin: EdgeInsets.zero,
                ),
                SizedBox(
                  height: 25.sp,
                ),
              ],
            ),
          );
        },
      );
    },
  ).whenComplete(() => pushAndRemoveUntil(context, screen));
}
