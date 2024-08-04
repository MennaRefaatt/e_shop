import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/navigators.dart';
import 'package:e_shop/core/utils/spacing.dart';
import 'package:e_shop/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
import '../../../../routing/routes.dart';
import '../../manager/cart_cubit.dart';
import '../../model/cart_model.dart';

class OrderInfo extends StatefulWidget {
  const OrderInfo({super.key, required this.cartModel});

  final CartModel cartModel;

  @override
  State<OrderInfo> createState() => _OrderInfoState();
}

class _OrderInfoState extends State<OrderInfo> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartLoading) {
          const CircularProgressIndicator(
            color: AppColors.primary,
          );
        }
        if (state is CartError) {
          const Text("Error");
        }
        if (state is CartSuccess) {
          setState(() {
            widget.cartModel.data!.subTotal = state.cartModel.data!.subTotal;
          });
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15.sp),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.greyBorder.withOpacity(0.2),
                spreadRadius: 10,
                blurRadius: 10,
                offset: const Offset(7, 3),
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S().orderInfo,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
            verticalSpacing(10.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${S().subTotal}: ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.greyBorder),
                  ),
                ),
                Text(
                  "\$${widget.cartModel.data!.subTotal.toString()}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            verticalSpacing(5.h),
            Text(
              "-------------------------------",
              style: TextStyle(
                  color: AppColors.greyBorder.withOpacity(0.2),
                  fontSize: 40.sp),
            ),
            verticalSpacing(5.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${S().total}: ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                ),
                Text(
                  "\$${widget.cartModel.data!.total.toString()}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            verticalSpacing(10.h),
            Visibility(
              visible: widget.cartModel.data!.items!.isNotEmpty,
              child: AppButton(
                  onPressed: () => pushNamed(context, Routes.addressScreen),
                  backgroundColor: AppColors.primary,
                  label: S().checkout,
                  fontSize: 18.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
