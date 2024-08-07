import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared_preferences/my_shared.dart';
import '../../../../core/shared_preferences/my_shared_keys.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../generated/l10n.dart';
import '../../manager/orders_cubit.dart';

class OrdersList extends StatelessWidget {
  final bool isCurrentSelected;
  const OrdersList({super.key, required this.isCurrentSelected});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (state is OrdersLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        }
        if (state is OrdersError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is OrdersSuccess) {
          final orders =
              isCurrentSelected ? state.currentOrders : state.oldOrders;
          if (orders.isEmpty) {
            return Center(
              child: Text(S().noOrdersFound),
            );
          }
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(15.sp),
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.sp),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyBorder.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "#${orders[index].id}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        Text(
                          S().details,
                          style: const TextStyle(color: AppColors.primary),
                        ),
                      ],
                    ),
                    verticalSpacing(10.h),
                    Row(
                      children: [
                        const Icon(CupertinoIcons.location,
                            color: AppColors.primary),
                        horizontalSpacing(5.w),
                        Expanded(
                          child:
                              Text(MyShared.getString(key: MySharedKeys.city)),
                        ),
                        Text(
                          orders[index].date,
                          style: const TextStyle(color: AppColors.greyBorder),
                        ),
                      ],
                    ),
                    verticalSpacing(10.h),
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: getProgressValue(orders[index].status),
                            color: getProgressColor(orders[index].status),
                            backgroundColor: AppColors.greyBorder.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20.r),
                            minHeight: 7.h,
                          ),
                        ),
                        horizontalSpacing(10.w),
                        Text(orders[index].status),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
  double getProgressValue(String status) {
    switch (status) {
      case 'Cancelled':
        return 0.0;
      case 'delivered':
        return 1.0;
      case 'New':
        return 0.5;
      default:
        return 0.0; // Default value if status doesn't match any case
    }
  }

  Color getProgressColor(String status) {
    switch (status) {
      case 'Cancelled':
        return AppColors.greyBorder.withOpacity(0.3);
      case 'delivered':
        return AppColors.primary;
      case 'New':
        return AppColors.primary;
      default:
        return AppColors.greyBorder.withOpacity(0.3);
    // Default color if status doesn't match any case
    }
  }
}
