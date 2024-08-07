import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/utils/navigators.dart';
import '../../../../core/utils/svg.dart';
import '../../../../core/widgets/app_asset.dart';
import '../../../../generated/l10n.dart';
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
          Expanded(child: Text(S().eShop,style: TextStyle(color: AppColors.primary,fontSize: 20.sp,fontWeight: FontWeight.bold),)),
          InkWell(
            onTap: () =>pushNamed(context, Routes.cartScreen),
            borderRadius: BorderRadius.circular(30.sp),
            child: Container(
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                color: AppColors.greyBorder.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30.r),
              ),
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
