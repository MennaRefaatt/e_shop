import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_shop/core/styles/colors.dart';
import '../../../../core/utils/navigators.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../generated/l10n.dart';
import '../../../../routing/routes.dart';
import '../../../cart/manager/cart_cubit.dart';
import '../../product_details_args.dart';

class AddToCartButtons extends StatelessWidget {
   AddToCartButtons(
      {super.key, required this.args, required this.cartCubit, required this.inCart});
  final ProductDetailsArgs args;
   bool inCart;
  final CartCubit cartCubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const CircularProgressIndicator(
            color: AppColors.primary,
          );
        }
        if (state is CartError) {
          return Text(state.error.toString());
        }
        return Container(
          margin: EdgeInsets.only(bottom: 15.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocListener<CartCubit, CartState>(
                listener: (context, state) {
                  if (state is CartError) {
                    Text(state.error.toString());
                  }
                  if (state is CartSuccess) {
                    state.cartModel.message == "Added Successfully"?
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.cartModel.message),
                        backgroundColor: AppColors.green,
                      ),
                    ):
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.cartModel.message),
                        backgroundColor: AppColors.red,
                      ),
                    );
                  }
                },
                child: inCart ? FloatingActionButton(onPressed: (){
                  cartCubit.addProductToCart(
                    productId: args.id,
                  );
                  inCart = !inCart;

                },backgroundColor: AppColors.red,
                  child:  Text("Remove from cart")
                ):FloatingActionButton(
                  onPressed: () {
                    cartCubit.addProductToCart(
                      productId: args.id,
                    );
                    inCart = !inCart;
                  },
                  backgroundColor: AppColors.primaryLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: const Icon(
                    CupertinoIcons.cart_fill,
                    color: AppColors.primary,
                  ),
                ),
              ),
              horizontalSpacing(15.w),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.greyBorder.withOpacity(0.5),
                        blurRadius: 3.r,
                        offset: const Offset(-1, 6),
                      ),
                    ]),
                child: AppButton(
                  onPressed: () {
                  if(inCart == true){
                    pushNamed(context, Routes.cartScreen);
                  }else{
                    cartCubit.addProductToCart(
                      productId: args.id,
                    ).then((value) {
                      inCart = !inCart;
                       pushNamed(context, Routes.cartScreen);
                    });

                  }
                  },
                  label: S().buyNow,
                  withIcon: true,
                  icons: CupertinoIcons.bag,
                  borderRadius: BorderRadius.circular(30.r),
                  backgroundColor: AppColors.primary,
                  width: 150.w,
                  margin: EdgeInsets.all(3.sp),
                  height: 50.h,
                  textColor: AppColors.primaryLight,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
