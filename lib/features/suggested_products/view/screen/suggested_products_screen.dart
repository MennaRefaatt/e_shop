import 'package:e_shop/features/suggested_products/view/suggested_products_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/product_item_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../favorite/manager/favourite_cubit.dart';

class SuggestedProductsScreen extends StatefulWidget {
  const SuggestedProductsScreen({
    super.key,
    required this.args,
  });

  final SuggestedProductsArgs args;


  @override
  State<SuggestedProductsScreen> createState() =>
      _SuggestedProductsScreenState();
}

class _SuggestedProductsScreenState extends State<SuggestedProductsScreen> {
  final favouriteCubit = FavouriteCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => favouriteCubit,
      child: Scaffold(
        body: Column(
          children: [
            DefaultAppBar(
              text: S().suggestedForYou, cartIcon: false, backArrow: true,),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.sp,
                  crossAxisSpacing: 0.sp,
                  childAspectRatio: 0.62.sp,
                ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: widget.args.products.length,
                itemBuilder: (context, index) {
                  return ProductItemWidget(
                    price: widget.args.products[index].price,
                    name: widget.args.products[index].name,
                    image: widget.args.products[index].image,
                    id: widget.args.products[index].id,
                    inFavorites: widget.args.products[index].isFav,
                    oldPrice: widget.args.products[index].oldPrice,
                    discount:
                    widget.args.products[index].discount,
                    favoriteCubit: favouriteCubit,
                  );
                },

              ),
            ),
          ],
        ),
      ),
    );
  }
}
