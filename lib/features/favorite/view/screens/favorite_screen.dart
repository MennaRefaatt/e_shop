import 'package:e_shop/features/favorite/manager/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/utils/navigators.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../generated/l10n.dart';
import '../../../../routing/routes.dart';
import '../../../product_details/product_details_args.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final cubit = FavouriteCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getFavouriteData(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              S().favorite,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: BlocBuilder<FavouriteCubit, FavouriteState>(
            builder: (context, state) {
              if (state is FavouriteLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
              } else if (state is FavouriteError) {
                return Center(
                  child: Text(state.error.toString()),
                );
              } else if (state is FavouriteSuccess) {
                return ListView.builder(
                    itemCount: state.favouriteModel.data!.data.length,
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
                                          id: state.favouriteModel.data!.data[index].id)),
                                  child: AppImage(
                                    imageUrl: state.favouriteModel.data!.data[index].product!.image,
                                    width: double.infinity,
                                    height: 150.h,
                                    borderRadius: BorderRadius.circular(20.sp),
                                  ),
                                ),
                                // Container(
                                //   margin: EdgeInsets.all(7.sp),
                                //   decoration: BoxDecoration(
                                //     color: AppColors.primaryLight.withOpacity(0.9),
                                //     borderRadius: BorderRadius.circular(20.sp),
                                //   ),
                                //   child: IconButton(
                                //       onPressed: () {
                                //         // state.favouriteModel.data!.data[index].product!.isFav =
                                //         // !widget.products[index].isFav;
                                //         setState(() {});
                                //       },
                                //       icon: Icon(
                                //         widget.products[index].isFav == false
                                //             ? Icons.favorite_border_outlined
                                //             : Icons.favorite,
                                //         color: AppColors.primary,
                                //       )),
                                // )
                              ],
                            ),
                            verticalSpacing(10.h),
                            Text(
                              state.favouriteModel.data!.data[index].product!.name,
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
                                  state.favouriteModel.data!.data[index].product!.price,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.primary,
                                      fontSize: 18.sp),
                                ),
                                horizontalSpacing(5.w),
                                Text(
                                  state.favouriteModel.data!.data[index].product!.oldPrice,
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
                    });
              }
              return const SizedBox();
            },
          )),
    );
  }
}
