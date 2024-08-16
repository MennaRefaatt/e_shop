import 'package:audioplayers/audioplayers.dart';
import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/navigators.dart';
import 'package:e_shop/core/utils/safe_print.dart';
import 'package:e_shop/core/utils/spacing.dart';
import 'package:e_shop/core/widgets/app_asset.dart';
import 'package:e_shop/core/widgets/app_button.dart';
import 'package:e_shop/features/favorite/manager/favourite_cubit.dart';
import 'package:e_shop/features/home/manager/home_cubit.dart';
import 'package:e_shop/features/order_details/order_details_args.dart';
import 'package:e_shop/features/order_placed/view/widget/products_you_might_like.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/l10n.dart';
import '../../../../routing/routes.dart';

class OrderPlacedScreen extends StatefulWidget {
  const OrderPlacedScreen({super.key, required this.id});
final int id;
  @override
  State<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {
  final homeCubit = HomeCubit();
  final favoriteCubit = FavouriteCubit();
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playSound();
  }
  void _playSound() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      await _audioPlayer.play(AssetSource('assets/sound/success.mp3'));
    }catch (e) {
      safePrint("Error playing sound: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => homeCubit..getHomeData(),
        ),
        BlocProvider(
          create: (context) => favoriteCubit,
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpacing(20.h),
              AppAssetImage(
                  image: "done.gif",
                  width: double.infinity,
                  height: 200.h,
                  topLeftRadius: 0,
                  topRightRadius: 0,
                  bottomLeftRadius: 0,
                  bottomRightRadius: 0,
                  fit: BoxFit.cover),
              Container(
                margin: EdgeInsets.all(15.sp),
                child: Column(
                  children: [
                    Text(S().orderPlaced,
                        style: TextStyle(
                            fontSize: 25.sp, fontWeight: FontWeight.bold)),
                    verticalSpacing(20.h),
                    Text(S()
                        .yourOrderHasBeenPlacedSuccessfullyProcessedAndIsOnItsWayToYouSoon,
                        style: TextStyle(
                            fontSize: 18.sp, color: AppColors.greyBorder),
                        textAlign: TextAlign.center),
                    verticalSpacing(30.h),
                    AppButton(
                      onPressed: () =>
                          pushNamed(context, Routes.orderDetailsScreen,arguments: OrderDetailsArgs(id: widget.id)),
                      label: S().myOrderDetails,
                      withIcon: false,
                      backgroundColor: AppColors.primary,
                    ),
                    verticalSpacing(10.h),
                    AppButton(
                      onPressed: () =>
                          pushNamedAndRemoveUntil(context, Routes.mainScreen),
                      label: S().continueShopping,
                      textColor: AppColors.primary,
                      withIcon: false,
                      backgroundColor: AppColors.primaryLight,
                    ),
                    verticalSpacing(10.h),
                  ],
                ),
              ),
              Divider(
                thickness: 7.sp,
                color: AppColors.greyBorder.withOpacity(0.1),
              ),
              ProductsYouMightLike(favoriteCubit: favoriteCubit,),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
