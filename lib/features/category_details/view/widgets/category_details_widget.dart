import 'package:e_shop/features/category_details/manager/category_details_cubit.dart';
import 'package:e_shop/features/category_details/model/category_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/utils/navigators.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../routing/routes.dart';
import '../../../product_details/product_details_args.dart';

class CategoryDetailsWidget extends StatefulWidget {
  const CategoryDetailsWidget({
    super.key,
    required this.categoryDetailsData,
  });
  final CategoryDetailsData categoryDetailsData;

  @override
  State<CategoryDetailsWidget> createState() => _CategoryDetailsWidgetState();
}

class _CategoryDetailsWidgetState extends State<CategoryDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryDetailsCubit, CategoryDetailsState>(
      listener: (context, state) {
        if (state is CategoryDetailsLoading) {
          const CircularProgressIndicator(
            color: AppColors.primary,
          );
        }
        if (state is CategoryDetailsError) {
          const Text("Error");
        }
      },
      child: Expanded(
        child: GridView.builder(
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.sp,
              crossAxisSpacing: 10.sp,
              childAspectRatio: 0.62.sp,

            ),
            shrinkWrap: true,
            itemCount: widget.categoryDetailsData.data.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10.sp),
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        InkWell(
                          onTap: () => pushNamed(
                              context, Routes.productDetailsScreen,
                              arguments: ProductDetailsArgs(
                                id: widget
                                    .categoryDetailsData.data[index].id
                              )),
                          child: AppImage(
                            imageUrl: widget
                                .categoryDetailsData.data[index].image,
                            width: double.infinity,
                            height: 120.h,
        
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
                                widget.categoryDetailsData.data[index]
                                        .inFavorites =
                                    !widget.categoryDetailsData.data[index]
                                        .inFavorites;
                                setState(() {});
                              },
                              icon: Icon(
                                widget.categoryDetailsData.data[index]
                                            .inFavorites ==
                                        false
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
                        Expanded(
                          child: Text(
                            "4.9",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w800),
                          ),
                        ),
                        widget.categoryDetailsData.data[index].discount != 0
                            ? Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.sp,
                            vertical: 3.sp
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColors.primary.withOpacity(0.4),
                          ),
                              child: Text(
                                  "${widget.categoryDetailsData.data[index].discount}%",
                                  style:
                                      const TextStyle(color: AppColors.greyBorder),
                                ),
                            )
                            : Container()
                      ],
                    ),
                    verticalSpacing(10.h),
                    Text(
                      widget.categoryDetailsData.data[index].name,
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
                          widget.categoryDetailsData.data[index].price,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: AppColors.primary,
                              fontSize: 18.sp),
                        ),
                        horizontalSpacing(5.w),
                        Expanded(
                          child: Text(
                            widget.categoryDetailsData.data[index].oldPrice,
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
              );
            }),
      ),
    );
  }
}
