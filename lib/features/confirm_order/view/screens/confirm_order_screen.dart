import 'package:e_shop/core/widgets/app_button.dart';
import 'package:e_shop/features/confirm_order/manager/confirm_order_cubit.dart';
import 'package:e_shop/features/confirm_order/view/widgets/default_address.dart';
import 'package:e_shop/features/confirm_order/view/widgets/item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../address/manager/address_cubit.dart';
import '../../../cart/manager/cart_cubit.dart';

class ConfirmOrderScreen extends StatelessWidget {
  ConfirmOrderScreen({super.key});

  final cubit = ConfirmOrderCubit();
  final addressCubit = AddressCubit();
  final cartCubit = CartCubit();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => cubit,
        ),
        BlocProvider(
          create: (context) => addressCubit..getAddress(),
        ),
        BlocProvider(
          create: (context) => cartCubit..getCartData(),
        ),
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              DefaultAppBar(
                text: S().confirmOrder,
                cartIcon: false,
                backArrow: true,
              ),
              Divider(
                thickness: 1.sp,
                color: AppColors.greyBorder.withOpacity(0.1),
              ),
              const DefaultAddress(),
              Divider(
                thickness: 5.sp,
                color: AppColors.greyBorder.withOpacity(0.1),
              ),
              const ItemDetails(),
              Divider(
                thickness: 5.sp,
                color: AppColors.greyBorder.withOpacity(0.1),
              ),
              BlocBuilder<ConfirmOrderCubit, ConfirmOrderState>(
                builder: (context, state) {
                  if (state is ConfirmOrderInitial) {
                    return Container(); // Handle the initial state
                  }
                  if (state is ConfirmOrderLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  } else if (state is ConfirmOrderError) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else if (state is ConfirmOrderSuccess) {
                    return Container(
                      margin: EdgeInsets.all(15.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextField(
                            withTitle: true,
                            textInputAction: TextInputAction.next,
                            controller: cubit.paymentMethodController,
                            backgroundColor: AppColors.primaryLight,
                            keyboardType: TextInputType.name,
                            hint: "payment method",
                            title: S().paymentMethod,
                            filledColor: AppColors.greyInput,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return S().required;
                              }
                              return null;
                            },
                          ),
                          verticalSpacing(15.h),
                          AppButton(
                            onPressed: () {},
                            label: S().confirmOrder +
                                state.confirmOrderModel.data!.total,
                            backgroundColor: AppColors.primary,
                            fontSize: 20.sp,
                          ),
                        ],
                      ),
                    );
                  }
                  return Container(); // Handle unexpected states
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
