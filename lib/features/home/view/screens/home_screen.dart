import 'package:e_shop/core/utils/spacing.dart';
import 'package:e_shop/features/categories/manager/categories_cubit.dart';
import 'package:e_shop/features/favorite/manager/favourite_cubit.dart';
import 'package:e_shop/features/home/view/widgets/home_app_bar.dart';
import 'package:e_shop/features/home/view/widgets/home_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_shop/features/home/manager/home_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors.dart';
import '../../manager/search/search_cubit.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/home_products_list_view.dart';
import '../widgets/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cubit = HomeCubit();
  final categoryCubit = CategoriesCubit();
  final favoriteCubit = FavouriteCubit();
  final searchCubit = SearchCubit();
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
        BlocProvider(create: (context) => favoriteCubit),
        BlocProvider(create: (context) => searchCubit),
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
            return SingleChildScrollView(
              child: Container(
                color: AppColors.primary.withOpacity(0.2),
                child: Column(
                  children: [
                    verticalSpacing(20.h),
                    const HomeAppbar(),
                    Search(searchCubit: searchCubit,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r),
                        ),
                      ),
                      child: Column(
                          children: [
                        verticalSpacing(20.h),
                         HomeCarouselSlider(
                          banners: state.homeModel.data!.banners,
                        ),
                        const HomeCategories(),
                        HomeProductsListView(
                          products: state.homeModel.data!.products,
                          favoriteCubit: favoriteCubit,
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
