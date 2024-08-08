import 'package:e_shop/core/utils/navigators.dart';
import 'package:e_shop/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../generated/l10n.dart';
import '../../../../routing/routes.dart';
import '../../../categories/manager/categories_cubit.dart';
import '../../../category_details/category_details_args.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }

        if (state is CategoriesSuccess) {
          return Container(
            margin: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S().shopByCategory,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                        )),
                    InkWell(
                      onTap: () => pushNamed(context, Routes.categoriesScreen),
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
                  height: 130.h,
                  child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => pushNamed(
                              context, Routes.categoryDetailsScreen,
                              arguments: CategoryDetailsArgs(
                                  id: state
                                      .categoriesModel.data!.data[index].id)),
                          borderRadius: BorderRadius.circular(20.sp),
                          splashColor: Colors.transparent,
                          child: Container(
                            margin: EdgeInsets.all(5.sp),
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                              color: AppColors.greyBorder.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppImage(
                                  imageUrl: state
                                      .categoriesModel.data!.data[index].image,
                                  width: 100.w,
                                  borderRadius: BorderRadius.circular(10.r),
                                  height: 50.h,
                                ),
                                verticalSpacing(10.h),
                                Text(
                                  state.categoriesModel.data!.data[index].name,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
