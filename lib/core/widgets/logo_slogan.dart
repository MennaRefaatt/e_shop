import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoSloganWidget extends StatelessWidget {
  const LogoSloganWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
         Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 13.sp,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppSVG(assetName: "logo"),
                  Text(
                    "e_shop",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),

      ],
    );
  }
}
