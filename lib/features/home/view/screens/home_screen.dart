import 'package:e_shop/features/categories/manager/categories_cubit.dart';
import 'package:e_shop/features/home/view/widgets/home_app_bar.dart';
import 'package:e_shop/features/home/view/widgets/home_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_shop/features/home/manager/home_cubit.dart';
import '../../../../core/styles/colors.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/homeProductsListView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cubit = HomeCubit();
  final categoryCubit = CategoriesCubit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => cubit..getHomeData(),
        ),
        BlocProvider(
          create: (context) => categoryCubit..getCategoriesData(),
        ),
      ],
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          } else if (state is HomeSuccess) {
            return ListView(children: [
              const HomeAppbar(),
              HomeCarouselSlider(
                banners: state.homeModel.data!.banners,
              ),
              HomeCategories(),
              HomeProductsListView(
                products: state.homeModel.data!.products,
              ),
            ]);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
