import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../generated/l10n.dart';
import '../../model/order_details_model.dart';

class OrderAddressDetails extends StatefulWidget {
  const OrderAddressDetails({super.key, required this.orderDetailsModel});
  final OrderDetailsModel orderDetailsModel;

  @override
  State<OrderAddressDetails> createState() => _OrderAddressDetailsState();
}

class _OrderAddressDetailsState extends State<OrderAddressDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(15.sp),
        decoration: BoxDecoration(
          color: AppColors.greyBorder.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(CupertinoIcons.location_north,
                    color: AppColors.primary, size: 20.sp),
                horizontalSpacing(5.w),
                Text(S().shipmentDetails,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: AppColors.greyBorder)),
              ],
            ),
            verticalSpacing(10.h),
            Text(S().city,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: AppColors.greyBorder)),
            verticalSpacing(5.h),
            Text(
              widget.orderDetailsModel.data!.address!.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: AppColors.black),
            ),
            verticalSpacing(10.h),
            Text(S().deliveryAddress,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: AppColors.greyBorder)),
            verticalSpacing(5.h),
            Text(
              widget.orderDetailsModel.data!.address!.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: AppColors.black),
            ),
          ],
        ));
  }
}
