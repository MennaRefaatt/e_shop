import 'package:e_shop/core/utils/navigators.dart';
import 'package:e_shop/core/utils/spacing.dart';
import 'package:e_shop/core/widgets/app_image.dart';
import 'package:e_shop/features/product_details/manager/product_details_cubit.dart';
import 'package:e_shop/features/product_details/product_details_args.dart';
import 'package:e_shop/features/product_details/view/widgets/product_details_description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../generated/l10n.dart';
import '../../../../routing/routes.dart';
import '../../../cart/manager/cart_cubit.dart';
import '../../../favorite/manager/favourite_cubit.dart';
import '../../model/product_details_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.args});
  final ProductDetailsArgs args;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final cubit = ProductDetailsCubit();
  final favoriteCubit = FavouriteCubit();
  final cartCubit = CartCubit();
  late final ProductDetailsData productDetailsData;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              cubit..getProductDetails(productId: widget.args.id.toString()),
        ),
        BlocProvider(
          create: (context) => favoriteCubit,
        ),
        BlocProvider(create: (context) => cartCubit),
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
              builder: (context, state) {
            if (state is ProductDetailsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            }
            if (state is ProductDetailsError) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is ProductDetailsSuccess) {
              return Column(
                children: [
                  DefaultAppBar(
                    text: S().productDetails,
                    cartIcon: false,
                    backArrow: true,
                  ),
                  ImageSlideshow(
                    indicatorColor: AppColors.primary,
                    initialPage: 0,
                    indicatorRadius: 5.sp,
                    onPageChanged: (value) {
                      debugPrint('Page changed: $value');
                    },
                    autoPlayInterval: 3000,
                    isLoop: false,
                    children: state.productDetailsModel.data!.images
                        .map(
                          (e) => AppImage(
                              imageUrl: e,
                              width: double.infinity,
                              borderRadius: BorderRadius.circular(0.sp)),
                        )
                        .toList(),
                  ),
                  ProductDetailsDescription(
                    productDetailsData: state.productDetailsModel.data!,
                    productId: widget.args.id,
                    isFavourite: state.productDetailsModel.data!.inFavorites,
                    favoriteCubit: favoriteCubit,
                    cartCubit: cartCubit,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocListener<CartCubit, CartState>(
                          listener: (context, state) {
                            if (state is CartLoading) {
                              const CircularProgressIndicator(
                                color: AppColors.primary,
                              );
                            }
                            if (state is CartError) {
                              Text(state.error.toString());
                            }
                            if (state is CartSuccess) {
                              Text(state.cartModel.message);
                            }
                          },
                          child: FloatingActionButton(
                            onPressed: () {
                              cartCubit.addProductToCart(
                                productId: widget.args.id,
                              );
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
                            onPressed: () =>
                                pushNamed(context, Routes.cartScreen),
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
                  ),
                ],
              );
            }
            return const SizedBox();
          }),
        ),
      ),
    );
  }
}
