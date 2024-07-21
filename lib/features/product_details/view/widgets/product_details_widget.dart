import 'package:e_shop/features/product_details/manager/product_details_cubit.dart';
import 'package:e_shop/features/product_details/model/product_details_model.dart';
import 'package:e_shop/features/product_details/view/widgets/product_details_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/styles/colors.dart';
import '../../../favorite/manager/favourite_cubit.dart';

class ProductDetailsWidget extends StatefulWidget {
  ProductDetailsWidget(
      {super.key,
      required this.productDetailsData,
      required this.productId,
      required this.isFavourite,
      required this.favoriteCubit});
  final ProductDetailsData productDetailsData;
  final int productId;
  late bool isFavourite;
  final FavouriteCubit favoriteCubit;

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductDetailsCubit, ProductDetailsState>(
        listener: (context, state) {
          if (state is ProductDetailsError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error.toString()),
            ));
          }

          if (state is ProductDetailsLoading) {
            const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          }
        },
        child: ProductDetailsDescription(
          productDetailsData: widget.productDetailsData,
          productId: widget.productId,
          isFavourite: widget.isFavourite,
          favoriteCubit: widget.favoriteCubit,
        ));
  }
}
