import 'package:e_shop/core/widgets/app_image.dart';
import 'package:e_shop/features/cart/manager/cart_cubit.dart';
import 'package:e_shop/features/cart/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/utils/spacing.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({
    super.key,
    required this.cartCubit,
    required this.cartModel,
  });
  final CartCubit cartCubit;
  final CartModel cartModel;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
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
      },
      child: Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.cartModel.data!.items.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(15.sp),
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyBorder.withOpacity(0.2),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    AppImage(
                      imageUrl: widget.cartModel.data!.items[index].product!.image,
                      width: 100.w,
                      height: 100.h,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    horizontalSpacing(10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.cartModel.data!.items[index].product!.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          verticalSpacing(5.h),
                          Text(
                            "\$${widget.cartModel.data!.items[index].product!.price}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Visibility(
                          visible: widget.cartModel.data!.items[index].quantity != 0,
                          child: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: AppColors.greyBorder.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: IconButton(
                              onPressed: () {
                                widget.cartCubit.removeProductFromCart(
                                    cartId: widget.cartModel.data!.items[index].id);
                                if (widget.cartModel.data!.items[index].quantity == 0) {
                                  return;
                                }
                                widget.cartModel.data!.items[index].quantity -= 1;
                                widget.cartModel.data!.subTotal -=widget.cartModel.data!.subTotal ;
                                widget.cartModel.data!.total -=widget.cartModel.data!.total ;
                                setState(() {});
                              },
                              icon: const Icon(Icons.remove),
                            ),
                          ),
                        ),
                        verticalSpacing(5.h),
                        Text(widget.cartModel.data!.items[index].quantity.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        verticalSpacing(5.h),
                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: IconButton(
                            onPressed: () {
                              widget.cartCubit.addProductToCart(
                                  productId: widget.cartModel.data!.items[index].id);
                              widget.cartModel.data!.items[index].quantity += 1;
                              widget.cartModel.data!.subTotal +=widget.cartModel.data!.subTotal ;
                              widget.cartModel.data!.total +=widget.cartModel.data!.total ;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
