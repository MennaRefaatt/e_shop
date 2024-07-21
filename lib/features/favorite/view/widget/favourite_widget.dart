import 'package:e_shop/features/favorite/model/favourite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/product_item_widget.dart';
import '../../manager/favourite_cubit.dart';

class FavouriteWidget extends StatefulWidget {
  const FavouriteWidget({super.key, required this.favouriteCubit, required this.data, required this.inFavorites});
  final FavouriteCubit favouriteCubit;
  final FavouriteData data;
  final bool inFavorites;

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  @override
  Widget build(BuildContext context) {
    return  BlocListener<FavouriteCubit, FavouriteState>(
        listener: (context, state) {
      if (state is FavouriteLoading) {
        const CircularProgressIndicator(
          color: AppColors.primary,
        );
      }
      if (state is FavouriteError) {
        const Text("Error");
      }
    },
    child:widget.inFavorites? GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.sp,
          crossAxisSpacing: 10.sp,
          childAspectRatio: 0.62.sp,
        ),
        shrinkWrap: true,
        itemCount: widget.data.data.length,
        itemBuilder: (context, index) {
          return ProductItemWidget(
            price: widget.data.data[index].product!.price,
            name: widget.data.data[index].product!.name,
            image: widget.data.data[index].product!.image,
            id: widget.data.data[index].product!.id,
            inFavorites: widget.inFavorites,
            oldPrice: widget.data.data[index].product!.oldPrice,
            discount:
            widget.data.data[index].product!.discount.toString(),
            favoriteCubit: widget.favouriteCubit,
          );
        }):const Text("Empty"),


    );
  }
}
