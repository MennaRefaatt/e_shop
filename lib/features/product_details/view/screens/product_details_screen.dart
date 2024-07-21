import 'package:e_shop/core/utils/svg.dart';
import 'package:e_shop/core/widgets/app_image.dart';
import 'package:e_shop/features/product_details/manager/product_details_cubit.dart';
import 'package:e_shop/features/product_details/product_details_args.dart';
import 'package:e_shop/features/product_details/view/widgets/product_details_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors.dart';
import '../../../../generated/l10n.dart';
import '../../../favorite/manager/favourite_cubit.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.args});
  final ProductDetailsArgs args;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final cubit = ProductDetailsCubit();
  final favoriteCubit = FavouriteCubit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              cubit..getProductDetails(productId: widget.args.id.toString()),
        ),
        BlocProvider(
          create: (context) => favoriteCubit,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S().productDetails,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: InkWell(
                  onTap: () {},
                  child: const AppSVG(assetName: "shopping-cart")),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
              builder: (context, state) {
            if (state is ProductDetailsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            }
            if (state is ProductDetailsError) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is ProductDetailsSuccess) {
              return Column(
                children: [
                  ImageSlideshow(
                    indicatorColor: AppColors.primary,
                    initialPage: 0,
                    onPageChanged: (value) {
                      debugPrint('Page changed: $value');
                    },
                    autoPlayInterval: 3000,
                    isLoop: false,
                    children: state.productDetailsModel.data!.images
                        .map(
                          (e) => AppImage(
                              imageUrl: e,
                              width: double.infinity,
                              borderRadius: BorderRadius.circular(0.sp)),
                        )
                        .toList(),
                  ),
                  ProductDetailsDescription(
                    productDetailsData: state.productDetailsModel.data!,
                    productId: widget.args.id,
                    isFavourite: state.productDetailsModel.data!.inFavorites,
                    favoriteCubit: favoriteCubit,
                  ),
                ],
              );
            }
            return const SizedBox();
          }),
        ),
      ),
    );
  }
}
