import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/spacing.dart';
import 'package:e_shop/core/widgets/app_bar.dart';
import 'package:e_shop/features/cart/manager/cart_cubit.dart';
import 'package:e_shop/features/cart/view/widgets/cart_widget.dart';
import 'package:e_shop/features/cart/view/widgets/order_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
import '../../../favorite/manager/favourite_cubit.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final cubit = CartCubit();
  final favouriteCubit = FavouriteCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getCartData(),
      child: Scaffold(
        body: Column(
          children: [
            DefaultAppBar(text: S().cart, cartIcon: false, backArrow: true),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15.sp),
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is CartLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      );
                    } else if (state is CartError) {
                      return Center(
                        child: Text(state.error.toString()),
                      );
                    } else if (state is CartSuccess) {
                      final cartList = state.cartModel.data!.items;
                      if (cartList.isEmpty) {
                        // TOD0 Translate
                        return const Center(child: Text('No products found'));
                      }
                      return Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                state.cartModel.data!.items.length.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              horizontalSpacing(2.w),
                              Text(S().products,
                                  style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          verticalSpacing(10.h),
                          CartWidget(
                            cartCubit: cubit,
                            cartModel: state.cartModel,
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
             OrderInfo(cartCubit: cubit,),
          ],
        ),
      ),
    );
  }
}
