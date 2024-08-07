import 'package:e_shop/core/widgets/app_bar.dart';
import 'package:e_shop/features/orders/manager/orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../generated/l10n.dart';
import '../widget/order_list.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final ordersCubit = OrdersCubit();
  bool isCurrentSelected = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ordersCubit..getOrders(),
      child: Column(
        children: [
          DefaultAppBar(text: S().orders, cartIcon: false, backArrow: false),
          // const CurrentAndOldButtons(),
          Container(
            width: 180.w,
            padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 10.sp),
            decoration: BoxDecoration(
              color: AppColors.greyBorder.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCurrentSelected = true;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.sp, horizontal: 20.sp),
                    decoration: BoxDecoration(
                      color: isCurrentSelected
                          ? AppColors.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Text(
                      "current",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: isCurrentSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCurrentSelected = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.sp, horizontal: 20.sp),
                    decoration: BoxDecoration(
                      color: !isCurrentSelected
                          ? AppColors.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Text(
                      S().old,
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: !isCurrentSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          verticalSpacing(20.h),
          Expanded(
            child: OrdersList(isCurrentSelected: isCurrentSelected),
          ),
        ],
      ),
    );
  }
}
