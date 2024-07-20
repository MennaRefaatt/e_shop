import 'package:e_shop/features/suggested_products/view/suggested_products_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/utils/navigators.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../generated/l10n.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S().suggestedForYou,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 40,
          crossAxisSpacing: 10,
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        itemCount: widget.args.products.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(15.sp),
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
                    AppImage(
                      imageUrl: widget.args.products[index].image,
                      width: double.infinity,
                      height: 100.h,
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                    Container(
                      margin: EdgeInsets.all(7.sp),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      child: IconButton(
                          onPressed: () {
                            widget.args.products[index].isFav =
                                !widget.args.products[index].isFav;
                            setState(() {});
                          },
                          icon: Icon(
                            widget.args.products[index].isFav == false
                                ? Icons.favorite_border_outlined
                                : Icons.favorite,
                            color: AppColors.primary,
                          )),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.primary,
                    ),
                    horizontalSpacing(5.w),
                    Text(
                      "4.9",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w800),
                    ),
                    horizontalSpacing(5.w),
                    widget.args.products[index].discount != ""
                        ? Text(
                            "(%${widget.args.products[index].discount})",
                            style: const TextStyle(color: AppColors.grey),
                          )
                        : Container()
                  ],
                ),
                verticalSpacing(10.h),
                Text(
                  widget.args.products[index].name,
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
                      widget.args.products[index].price,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                          fontSize: 18.sp),
                    ),
                    horizontalSpacing(5.w),
                    Text(
                      widget.args.products[index].oldPrice,
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
        },

      ),
    );
  }
}
