import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/navigators.dart';
import '../../../../core/utils/svg.dart';
import '../../../../core/widgets/app_asset.dart';
import '../../../../routing/routes.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.sp, right: 15.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppAssetImage(
            image: "app_icon2.png",
            width: 60.w,
            height: 60.h,
            topLeftRadius: 0,
            topRightRadius: 0,
            bottomLeftRadius: 0,
            bottomRightRadius: 0, fit: BoxFit.fill,
          ),
          InkWell(
            onTap: () =>pushNamed(context, Routes.cartScreen),
            borderRadius: BorderRadius.circular(30.sp),
            child: Container(
              margin: EdgeInsets.all(15.sp),
              child: const AppSVG(
                assetName: "shopping-cart",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
