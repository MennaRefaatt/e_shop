import 'package:e_shop/core/utils/spacing.dart';
import 'package:e_shop/core/widgets/app_button.dart';
import 'package:e_shop/features/product_details/model/product_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors.dart';
import '../../../../generated/l10n.dart';
import '../../../favorite/manager/favourite_cubit.dart';

class ProductDetailsDescription extends StatefulWidget {
  ProductDetailsDescription(
      {super.key,
      required this.productDetailsData,
      required this.productId,
      required this.isFavourite,
      required this.favoriteCubit});
  final ProductDetailsData productDetailsData;
  final int productId;
  late bool isFavourite;
  final FavouriteCubit favoriteCubit;

  @override
  State<ProductDetailsDescription> createState() =>
      _ProductDetailsDescriptionState();
}

class _ProductDetailsDescriptionState extends State<ProductDetailsDescription> {
  @override
  Widget build(BuildContext context) {
    return  Container(
          margin: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.primary,
                        ),
                        horizontalSpacing(5.sp),
                        Text(
                          "4.9",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w800),
                        ),
                        horizontalSpacing(5.sp),
                        widget.productDetailsData.discount != ""
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.sp, vertical: 3.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: AppColors.primary.withOpacity(0.4),
                                ),
                                child: Text(
                                  "${widget.productDetailsData.discount}%",
                                  style: const TextStyle(
                                      color: AppColors.greyBorder),
                                ))
                            : Container(),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        widget.favoriteCubit.toggleFavourite(
                          productId: widget.productDetailsData.id,
                        );
                        setState(() {
                          widget.isFavourite = !widget.isFavourite;
                        });
                      },
                      icon: Icon(
                        widget.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: AppColors.black,
                        size: 30.sp,
                      )),
                ],
              ),
              Text(
                widget.productDetailsData.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  overflow: TextOverflow.visible,
                ),
              ),
              verticalSpacing(10.h),
              Row(
                children: [
                  Text(
                    widget.productDetailsData.price.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                        fontSize: 18.sp),
                  ),
                  horizontalSpacing(5.w),
                  Text(
                    widget.productDetailsData.oldPrice.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: AppColors.grey,
                      fontSize: 18.sp,
                      decoration: TextDecoration.lineThrough,
                    ),
                  )
                ],
              ),
              verticalSpacing(10.h),
              Text(
                widget.productDetailsData.description,
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: AppColors.black,
                    fontSize: 18.sp),
              ),
              verticalSpacing(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(
                    onPressed: () {},
                    label: S().addToCart,
                    borderRadius: BorderRadius.circular(0.sp),
                    backgroundColor: AppColors.primaryLight,
                    width: 150.w,
                    height: 50.h,
                    margin: EdgeInsets.all(3.sp),
                    textColor: AppColors.primary,
                  ),
                  AppButton(
                    onPressed: () {},
                    label: S().buyNow,
                    borderRadius: BorderRadius.circular(0.sp),
                    backgroundColor: AppColors.primary,
                    width: 150.w,
                    margin: EdgeInsets.all(3.sp),
                    height: 50.h,
                    textColor: AppColors.primaryLight,
                  ),
                ],
              )
            ],
          ),
    );
  }
}
