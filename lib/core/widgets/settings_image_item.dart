import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/svg.dart';
import 'package:e_shop/core/widgets/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsImageItem extends StatelessWidget {
  const SettingsImageItem({super.key, required this.image, required this.text, required this.iconSVG});
final String image,text,iconSVG;
  @override
  Widget build(BuildContext context) {
    return   Stack(
      alignment: AlignmentDirectional.center,
      children: [
        AppAssetImage(
          image: '$image.png',
          width: double.infinity,
          height: 180.h,
          topLeftRadius: 12.r,
          topRightRadius: 12.r,
          bottomLeftRadius: 12.r,
          bottomRightRadius: 12.r,
          fit: BoxFit.fill,
        ),
        Column(
          children: [
             AppSVG(assetName: iconSVG),
            const SizedBox(
              height: 20.0,
            ),
            Text(text,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary
              ),
            ),
          ],
        )
      ],
    );
  }
}
