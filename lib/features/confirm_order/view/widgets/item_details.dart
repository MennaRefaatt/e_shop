import 'package:e_shop/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../generated/l10n.dart';
import '../../../cart/manager/cart_cubit.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        } else if (state is CartError) {
          return Center(
            child: Text(state.error),
          );
        } else if (state is CartSuccess) {
          return Container(
            margin: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S().itemDetails,
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.bold)),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.cartModel.data!.items.length,
                  itemBuilder: (context, index) {
                    final item = state.cartModel.data!.items[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 15.sp),
                      child: Row(
                        children: [
                          AppImage(
                            imageUrl: item.product!.image,
                            width: 100.w,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          horizontalSpacing(20.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item.product!.name,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    horizontalSpacing(10.w),
                                    Text('\$${item.product!.price}',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                verticalSpacing(5.sp),
                                Divider(
                                  thickness: 1.sp,
                                  color: AppColors.greyBorder.withOpacity(0.2),
                                ),
                                verticalSpacing(5.sp),
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        'Quantity: ',
                                        style:
                                            TextStyle(color: AppColors.greyBorder),
                                      ),
                                    ),
                                    Text(item.quantity.toString()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S().total,
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.greyBorder)),
                    Text(
                      '\$${state.cartModel.data!.total}',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary),
                    ),
                  ],
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
