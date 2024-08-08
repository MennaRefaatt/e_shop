import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/spacing.dart';
import 'package:e_shop/features/order_details/model/order_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/l10n.dart';

class OrderPaymentMethodDetails extends StatelessWidget {
  const OrderPaymentMethodDetails({super.key, required this.orderDetailsModel});
  final OrderDetailsModel orderDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
            color: AppColors.greyBorder.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S().paymentMethod,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w900),
              ),
              Text(
                orderDetailsModel.data!.paymentMethod,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        verticalSpacing(15.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
            color: AppColors.greyBorder.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S().paymentSummary,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S().cost,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.greyBorder)),
                  Text(
                    orderDetailsModel.data!.cost.toString(),
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S().vat,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.greyBorder)),
                  Text(
                    "${orderDetailsModel.data!.vat} vat",
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S().total,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.greyBorder)),
                  Text(
                    orderDetailsModel.data!.total,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
