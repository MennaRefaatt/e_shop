import 'package:e_shop/features/favorite/manager/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/product_details/product_details_args.dart';
import '../../routing/routes.dart';
import '../styles/colors.dart';
import '../utils/navigators.dart';
import '../utils/spacing.dart';
import 'app_image.dart';

class ProductItemWidget extends StatefulWidget {
  ProductItemWidget({
    super.key,
    required this.price,
    required this.name,
    required this.image,
    required this.id,
    required this.inFavorites,
    required this.oldPrice,
    required this.discount,
    required this.favoriteCubit,
  });
  final String price;
  final String name;
  final String image;
  final int id;
  late final bool inFavorites;
  final String oldPrice;
  final String discount;

  final FavouriteCubit favoriteCubit;

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: () => pushNamed(context, Routes.productDetailsScreen,
          arguments: ProductDetailsArgs(id: widget.id)),
      child: Container(
        height: 120.h,
        margin: EdgeInsets.all(10.sp),
        padding: EdgeInsets.all(15.sp),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(20.r),
                  onTap: () => pushNamed(context, Routes.productDetailsScreen,
                      arguments: ProductDetailsArgs(id: widget.id)),
                  child: AppImage(
                    imageUrl: widget.image,
                    width: double.infinity,
                    height: 120.h,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(7.sp),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: IconButton(
                      onPressed: () {
                        widget.favoriteCubit.toggleFavourite(
                          productId: widget.id,
                        );
                        setState(() {
                          widget.inFavorites = !widget.inFavorites;
                        });
                      },
                      icon: Icon(
                        widget.inFavorites
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: AppColors.primary,
                      )),
                )
              ],
            ),
            verticalSpacing(10.h),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: AppColors.primary,
                ),
                Expanded(
                  child: Text(
                    "4.9",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
                  ),
                ),
                widget.discount != ""
                    ? Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.sp, vertical: 3.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.primary.withOpacity(0.4),
                        ),
                        child: Text(
                          "${widget.discount}%",
                          style: const TextStyle(color: AppColors.greyBorder),
                        ),
                      )
                    : Container()
              ],
            ),
            verticalSpacing(10.h),
            Text(
              widget.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: AppColors.black,
                  fontSize: 18.sp),
            ),
            Row(
              children: [
                Text(
                  "\$${widget.price}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                      fontSize: 18.sp),
                ),
                horizontalSpacing(5.w),
                Expanded(
                  child: Text(
                    "\$${widget.oldPrice}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: AppColors.grey,
                      fontSize: 12.sp,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
