import 'package:e_shop/core/utils/navigators.dart';
import 'package:e_shop/features/product_details/product_details_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../generated/l10n.dart';
import '../../../../routing/routes.dart';
import '../../../suggested_products/view/suggested_products_args.dart';
import '../../model/home_model.dart';

class HomeProductsListView extends StatefulWidget {
  const HomeProductsListView({super.key, required this.products});
  final List<HomeProducts> products;

  @override
  State<HomeProductsListView> createState() => _HomeProductsListViewState();
}

class _HomeProductsListViewState extends State<HomeProductsListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S().suggestedForYou,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              InkWell(
                onTap: () => pushNamed(context, Routes.suggestedProductsScreen,
                    arguments:
                        SuggestedProductsArgs(products: widget.products)),
                borderRadius: BorderRadius.circular(20.sp),
                child: Text(
                  S().seeAll,
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 350.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200.w,
                    padding: EdgeInsets.all(15.sp),
                    margin: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            InkWell(
                              onTap: () => pushNamed(
                                  context, Routes.productDetailsScreen,
                                  arguments: ProductDetailsArgs(
                                      id: widget.products[index].id)),
                              child: AppImage(
                                imageUrl: widget.products[index].image,
                                width: double.infinity,
                                height: 150.h,
                                borderRadius: BorderRadius.circular(20.sp),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(7.sp),
                              decoration: BoxDecoration(
                                color: AppColors.primaryLight.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(20.sp),
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    widget.products[index].isFav =
                                        !widget.products[index].isFav;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    widget.products[index].isFav == false
                                        ? Icons.favorite_border_outlined
                                        : Icons.favorite,
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
                            Text(
                              "4.9",
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.w800),
                            ),
                            widget.products[index].discount != ""
                                ? Text(
                                    "(%${widget.products[index].discount})",
                                    style:
                                        const TextStyle(color: AppColors.grey),
                                  )
                                : Container()
                          ],
                        ),
                        verticalSpacing(10.h),
                        Text(
                          widget.products[index].name,
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
                              widget.products[index].price,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.primary,
                                  fontSize: 18.sp),
                            ),
                            horizontalSpacing(5.w),
                            Text(
                              widget.products[index].oldPrice,
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
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
