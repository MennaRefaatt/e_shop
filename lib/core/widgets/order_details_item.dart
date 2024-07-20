import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/spacing.dart';
import 'package:e_shop/core/utils/svg.dart';

class OrderDetailsItem extends StatelessWidget {
  const OrderDetailsItem({super.key, required this.title, required this.body, required this.icon});
final String title;
final String body;
final String icon;

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding:  EdgeInsets.symmetric(horizontal: 16.sp,vertical: 16.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           AppSVG(assetName: icon),
          horizontalSpacing(15.sp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               title,
                style:  const TextStyle(
                  color:AppColors.text,

                ),
              ),
               Text(body,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
