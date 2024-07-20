import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:e_shop/core/shared_preferences/my_shared.dart';
import 'package:e_shop/core/utils/navigators.dart';
import 'package:e_shop/routing/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/app_asset.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((onValue) {
      if (MyShared.isLoggedIn()) {
        pushNamedAndRemoveUntil(context, Routes.mainScreen);
      } else {
        pushNamedAndRemoveUntil(context, Routes.login);
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpacing(380.h),
      Align(
        alignment: Alignment.center,
        child: AppAssetImage(
          image: "app_icon2.png",
          width: 80.w,
          height: 80.h,
          topLeftRadius: 0,
          topRightRadius: 0,
          bottomLeftRadius: 0,
          bottomRightRadius: 0, fit: BoxFit.fill,),
      ),
          Align(
            alignment: Alignment.center,
            child: AppAssetImage(
              image: "e_shop_text.png",
              width: 110.w,
              height: 70.h,
              topLeftRadius: 0,
              topRightRadius: 0,
              bottomLeftRadius: 0, bottomRightRadius: 0,
              fit: BoxFit.fill,),),
          verticalSpacing(15.h),
        ],
      ),
    );
  }
}
