import 'package:e_shop/core/utils/navigators.dart';
import 'package:e_shop/features/favorite/manager/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/product_item_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../../routing/routes.dart';
import '../../../suggested_products/view/suggested_products_args.dart';
import '../../model/home_model.dart';

class HomeProductsListView extends StatefulWidget {
  const HomeProductsListView(
      {super.key, required this.products, required this.favoriteCubit});
  final List<HomeProducts> products;
  final FavouriteCubit favoriteCubit;
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
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ProductItemWidget(
                  price: widget.products[index].price,
                  name: widget.products[index].name,
                  image: widget.products[index].image,
                  id: widget.products[index].id,
                  inFavorites: widget.products[index].isFav,
                  oldPrice: widget.products[index].oldPrice,
                  discount: widget.products[index].discount,
                  favoriteCubit: widget.favoriteCubit,
                );
              }),
        ],
      ),
    );
  }
}
