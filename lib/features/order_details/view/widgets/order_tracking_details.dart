import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/utils/spacing.dart';
import '../../../orders/get_progress.dart';
import '../../model/order_details_model.dart';

class OrderTrackingDetails extends StatefulWidget {
  const OrderTrackingDetails({super.key, required this.orderDetailsModel});
  final OrderDetailsModel orderDetailsModel;

  @override
  State<OrderTrackingDetails> createState() => _OrderTrackingDetailsState();
}

class _OrderTrackingDetailsState extends State<OrderTrackingDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order Id",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Text("#${widget.orderDetailsModel.data!.id.toString()}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: AppColors.primary)),
              ],
            ),
            widget.orderDetailsModel.data!.status == "Delivered" ||
                    widget.orderDetailsModel.data!.status == "New"
                ? Container(
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                      color: AppColors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(widget.orderDetailsModel.data!.status,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: AppColors.green)),
                  )
                : Container(
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                      color: AppColors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(widget.orderDetailsModel.data!.status,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: AppColors.red)),
                  ),
          ],
        ),
        verticalSpacing(10.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
            color: AppColors.greyBorder.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.orderDetailsModel.data!.date,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,),
              ),
              LinearProgressIndicator(
                value: GetProgress().getProgressValue(widget.orderDetailsModel.data!.status),
                color: GetProgress().getProgressColor(widget.orderDetailsModel.data!.status),
                backgroundColor: AppColors.greyBorder.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20.r),
                minHeight: 7.h,
              ),
            ],
          ),
        )
      ],
    );
  }
}