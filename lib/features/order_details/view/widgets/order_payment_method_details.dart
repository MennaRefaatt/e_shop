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
              verticalSpacing(10.h),
              rows(
                  title: S().cost,
                  value: orderDetailsModel.data!.cost.toString(),
                 ),
              rows(
                  title: S().vat,
                  value: orderDetailsModel.data!.vat.toString(),),
              verticalSpacing(10.h),
              rows(
                  title: S().total,
                  value: orderDetailsModel.data!.total.toString(),
                  fontWeight: FontWeight.bold),
            ],
          ),
        ),
      ],
    );
  }
}

Row rows(
    {required String title,
    required String value,
     FontWeight? fontWeight}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.greyBorder)),
      Text(
        value,
        style: TextStyle(fontSize: 16.sp, fontWeight: fontWeight),
      ),
    ],
  );
}
