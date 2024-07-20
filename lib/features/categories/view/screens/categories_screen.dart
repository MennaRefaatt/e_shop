import 'package:e_shop/features/categories/manager/categories_cubit.dart';
import 'package:e_shop/features/category_details/category_details_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/utils/navigators.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../generated/l10n.dart';
import '../../../../routing/routes.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final cubit = CategoriesCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getCategoriesData(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            S().categories,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.black,
              )),
        ),
        body: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            } else if (state is CategoriesSuccess) {
              return GridView.builder(
                  shrinkWrap: true,
                  itemCount: state.categoriesModel.data!.data.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => pushNamed(
                          context, Routes.categoryDetailsScreen,
                          arguments: CategoryDetailsArgs(
                              id: state
                                  .categoriesModel.data!.data[index].id)),
                      borderRadius: BorderRadius.circular(20.sp),
                      highlightColor: AppColors.primaryLight,
                      splashColor: Colors.transparent,
                      child: Container(
                        margin: EdgeInsets.all(15.sp),
                        child: Column(
                          children: [
                            AppImage(
                              imageUrl: state
                                  .categoriesModel.data!.data[index].image,
                              width: double.infinity,
                              height: 120.h,
                              borderRadius: BorderRadius.circular(20.sp),
                            ),
                            verticalSpacing(10.h),
                            Text(
                              state.categoriesModel.data!.data[index].name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const SizedBox(
                child: Text("error"),
              );
            }
          },
        ),
      ),
    );
  }
}
