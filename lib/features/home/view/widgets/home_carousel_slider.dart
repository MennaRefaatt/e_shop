import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_shop/features/home/model/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../generated/l10n.dart';

class HomeCarouselSlider extends StatelessWidget {
  const HomeCarouselSlider({super.key, required this.banners});
  final List<HomeBanners> banners;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(15.sp),
          child: Text(
            S().spacialForYou,
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
          ),
        ),
        verticalSpacing(10.h),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.1),
                blurRadius: 7,
                spreadRadius: 1,
                offset: const Offset(0, 10), // Shadow position
              ),
            ],
          ),
          child: CarouselSlider.builder(
            itemCount: banners.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    AppImage(
              imageUrl: banners[itemIndex].image,
              width: double.infinity,
              height: 120.h,
              borderRadius: BorderRadius.circular(0),
            ),
            options: CarouselOptions(
              autoPlay: true,
              height: 100.h,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 1,
              autoPlayCurve: Curves.fastOutSlowIn,
              aspectRatio: 2.0,
            ),
          ),
        ),
      ],
    );
  }
}
