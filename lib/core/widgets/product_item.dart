import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/spacing.dart';
import 'package:e_shop/core/utils/svg.dart';
import 'package:e_shop/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.name, required this.image, required this.category, required this.price, required this.discount, required this.isFav});
final String name;
final String image;
final String category;
final double price;
final double discount;
final String isFav;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.sp),

      decoration: BoxDecoration(
        color: AppColors.backGround,

        borderRadius: BorderRadius.circular(8.r),

      ),
      height: 251.h,
      padding: EdgeInsets.all(12.sp),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AppImage(imageUrl: image,
                  width: 151.5,
                  height: 116.h,
                  borderRadius: BorderRadius.circular(0)
              ),
              AppSVG(assetName:isFav == "Y" ? "is_fav" : "not_fav",
              color:  isFav == "Y" ? null : Colors.grey,
              )

            ],
          ),
          
          Text(name,
            style: TextStyle(fontSize: 14.sp, ), ),
          Text(category,
            style: TextStyle(fontSize: 12.sp,
                color: AppColors.primary
            ),
          ),
          verticalSpacing(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text("${price} ر.س ",
                style: TextStyle(fontSize: 16.sp,
                    color: AppColors.black
                ),
              ),
              const AppSVG(assetName: "cart_home",color: AppColors.primary,)
            ],
          ),
        ],
      ),
    );
  }
}
