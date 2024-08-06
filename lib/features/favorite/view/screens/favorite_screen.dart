import 'package:e_shop/features/favorite/manager/favourite_cubit.dart';
import 'package:e_shop/features/favorite/view/widget/favourite_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/app_bar.dart';
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                DefaultAppBar(text: S().favorite, cartIcon: false, backArrow: false,),
                BlocBuilder<FavouriteCubit, FavouriteState>(
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
                      if (state.favouriteModel.data!.data.isEmpty) {
                        return const Center(
                          child: Text('No favourite products found'),
                        );
                      }
                      return FavouriteWidget(
                          favouriteCubit: cubit, data: state.favouriteModel.data!, inFavorites: true);
                    }
                    return Text(state.toString());
                  },
                ),
              ],
            ),
          )),
    );
  }
}
