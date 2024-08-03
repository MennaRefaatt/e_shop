import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/features/home/manager/search/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
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
                  child: TextField(
                    controller: searchCubit.searchController,
                    decoration: InputDecoration(
                      suffixIcon: Container(
                        padding: EdgeInsets.all(10.sp),
                        child: CircleAvatar(
                          backgroundColor: AppColors.primary,
                          radius: 25,
                          child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                searchCubit.searchData(
                                    text: searchCubit.searchController.text);
                              },
                              icon: const Icon(Icons.search)),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide(
                          color: AppColors.greyBorder,
                          width: 0.2.sp,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: S().search,
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.greyBorder,
                          fontSize: 15.sp),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.greyBorder,
                          width: 0.2.sp,
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    onChanged: searchCubit.onSearchChanged,
                  ),
                ),
                if (state is SearchLoading)
                  const Center(
                      child:
                          CircularProgressIndicator(color: AppColors.primary))
                else if (state is SearchSuccess)
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchDataList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.network(
                              searchDataList[index].image.toString()),
                          title: Text(searchDataList[index].name.toString()),
                          subtitle:
                              Text(searchDataList[index].price.toString()),
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
