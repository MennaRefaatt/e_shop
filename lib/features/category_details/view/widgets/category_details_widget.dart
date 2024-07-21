import 'package:e_shop/features/category_details/manager/category_details_cubit.dart';
import 'package:e_shop/features/category_details/model/category_details_model.dart';
import 'package:e_shop/features/favorite/manager/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/product_item_widget.dart';

class CategoryDetailsWidget extends StatefulWidget {
  const CategoryDetailsWidget({
    super.key,
    required this.categoryDetailsData,
    required this.favouriteCubit,
  });
  final CategoryDetailsData categoryDetailsData;
  final FavouriteCubit favouriteCubit;

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
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.sp,
              crossAxisSpacing: 10.sp,
              childAspectRatio: 0.62.sp,
            ),
            shrinkWrap: true,
            itemCount: widget.categoryDetailsData.data.length,
            itemBuilder: (context, index) {
              return ProductItemWidget(
                price: widget.categoryDetailsData.data[index].price,
                name: widget.categoryDetailsData.data[index].name,
                image: widget.categoryDetailsData.data[index].image,
                id: widget.categoryDetailsData.data[index].id,
                inFavorites: widget.categoryDetailsData.data[index].inFavorites,
                oldPrice: widget.categoryDetailsData.data[index].oldPrice,
                discount:
                    widget.categoryDetailsData.data[index].discount.toString(),
                favoriteCubit: widget.favouriteCubit,
              );
            }),
      ),
    );
  }
}
