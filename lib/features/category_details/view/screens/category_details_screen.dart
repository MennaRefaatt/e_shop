import 'package:e_shop/features/category_details/category_details_args.dart';
import 'package:e_shop/features/category_details/view/widgets/category_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors.dart';
import '../../../../generated/l10n.dart';
import '../../../favorite/manager/favourite_cubit.dart';
import '../../manager/category_details_cubit.dart';

class CategoryDetailsScreen extends StatefulWidget {
  const CategoryDetailsScreen({super.key, required this.args});

  final CategoryDetailsArgs args;

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  final cubit = CategoryDetailsCubit();
  final favoriteCubit = FavouriteCubit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              cubit..getCategoryDetails(categoryId: widget.args.id.toString()),
        ),
        BlocProvider(
          create: (context) => favoriteCubit,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S().categoryDetails,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: BlocBuilder<CategoryDetailsCubit, CategoryDetailsState>(
            builder: (context, state) {
          if (state is CategoryDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          }
          if (state is CategoryDetailsError) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is CategoryDetailsSuccess) {
            return Column(
              children: [
                CategoryDetailsWidget(
                  categoryDetailsData: state.categoryDetailsModel.data!,
                  favouriteCubit: favoriteCubit,
                ),
              ],
            );
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
