import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/navigators.dart';
import 'package:e_shop/core/widgets/app_text_field.dart';
import 'package:e_shop/features/home/manager/search/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
import '../../../../routing/routes.dart';
import '../../../product_details/product_details_args.dart';
import '../../model/search_model/search_model.dart';

class Search extends StatelessWidget {
  Search({super.key, required this.searchCubit});

  final SearchCubit searchCubit;
  List<SearchDataList> searchDataList = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchLoading) {
          const Center(
              child: CircularProgressIndicator(color: AppColors.primary));
        } else if (state is SearchSuccess) {
          searchDataList = state.searchModel.data?.searchDataList ?? [];
        } else if (state is SearchError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15.sp),
                  child: SizedBox(
                    child: AppTextField(
                      hint: S().search,
                      title: S().search,
                      controller: searchCubit.searchController,
                      suffixIcon: Container(
                        margin: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              searchCubit.searchData(
                                  text: searchCubit.searchController.text);
                            },
                            icon: const Icon(Icons.search)),
                      ),
                      filledColor: Colors.white,
                      onChanged: searchCubit.onSearchChanged,
                    ),
                  ),
                ),
                if (state is SearchLoading)
                  const Center(
                      child:
                          CircularProgressIndicator(color: AppColors.primary))
                else if (state is SearchSuccess)
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: searchDataList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () =>
                              pushNamed(context, Routes.productDetailsScreen,
                                  arguments: ProductDetailsArgs(
                                    id: searchDataList[index].id,
                                  )),
                          borderRadius: BorderRadius.circular(20.r),
                          child: ListTile(
                            leading: Image.network(
                                searchDataList[index].image.toString()),
                            title: Text(searchDataList[index].name.toString()),
                            subtitle:
                                Text(searchDataList[index].price.toString()),
                          ),
                        );
                      })
                else if (state is SearchError)
                  Center(child: Text('Error: ${state.error}')),
              ],
            ),
          );
        },
      ),
    );
  }
}
