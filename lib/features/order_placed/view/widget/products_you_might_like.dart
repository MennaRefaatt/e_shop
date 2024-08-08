import 'package:e_shop/features/favorite/manager/favourite_cubit.dart';
import '../../../../core/styles/colors.dart';
import 'package:e_shop/core/widgets/product_item_widget.dart';
import 'package:e_shop/features/home/manager/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/l10n.dart';

class ProductsYouMightLike extends StatefulWidget {
    const ProductsYouMightLike({super.key, required this.favoriteCubit});
  final FavouriteCubit favoriteCubit ;

  @override
  State<ProductsYouMightLike> createState() => _ProductsYouMightLikeState();
}

class _ProductsYouMightLikeState extends State<ProductsYouMightLike> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S().productsYouMightLike,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
              }
              if(state is HomeSuccess){
                if (state.homeModel.data!.products.isEmpty) {
                  return const Center(
                    child: Text('No products found'),
                  );
                }
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 5,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ProductItemWidget(
                      price: state.homeModel.data!.products[index].price,
                      name:state.homeModel.data!.products[index].name,
                      image: state.homeModel.data!.products[index].image,
                      id: state.homeModel.data!.products[index].id,
                      inFavorites: state.homeModel.data!.products[index].isFav,
                      oldPrice:state.homeModel.data!.products[index].oldPrice,
                      discount: state.homeModel.data!.products[index].discount,
                      favoriteCubit: widget.favoriteCubit,
                    );
                  });
              }
              return const Center(
                child: Text('No products found'),
              );
            },
          ),
        ],
      ),
    );
  }
}
