import 'package:e_shop/features/favorite/manager/favourite_cubit.dart';
import 'package:e_shop/features/favorite/view/widget/favourite_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../../../generated/l10n.dart';

class FavoriteScreen extends StatefulWidget {
   const FavoriteScreen({super.key,});
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
                return FavouriteWidget(
                    favouriteCubit: cubit, data: state.favouriteModel.data!, inFavorites: true);
              }
              return Text(state.toString());
            },
          )),
    );
  }
}
