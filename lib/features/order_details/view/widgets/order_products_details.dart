import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../generated/l10n.dart';
import '../../model/order_details_model.dart';

class OrderProductsDetails extends StatelessWidget {
  const OrderProductsDetails({super.key, required this.products});
  final List<OrderProductsDetailsModel> products;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(S().itemDetails,style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold
            ),),
            horizontalSpacing(10.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal:10.sp),
              decoration: BoxDecoration(
                color: AppColors.greyBorder.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text("${products.length}",style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold
              ),),
            ),
          ],
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: products.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 15.sp,right: 15.sp,left: 15.sp),
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  color: AppColors.greyBorder.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    AppImage(
                      imageUrl: products[index].image,
                      width: 100.w,
                      height: 100.h,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    horizontalSpacing(10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products[index].name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          verticalSpacing(5.h),
                          Text(
                            "\$${products[index].price}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(S().quantity,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.greyBorder
                                  )),
                              Text(products[index].quantity.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }
}
