import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_shop/core/api/my_dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../../core/api/endpoints.dart';
import '../../../../core/utils/safe_print.dart';
import '../../model/search_model/search_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  final searchController = TextEditingController();
  Timer? _debounce;

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        searchData(text: query);
      } else {
        emit(SearchInitial());
      }
    });
  }

  void searchData({required String text}) {
    emit(SearchLoading());
    MyDio.postData(endPoint: EndPoints.search, data: {'text': text})
        .then((onValue) {
      onValue.fold((ifLeft) {
        emit(SearchError(error: ifLeft.toString()));
      }, (ifRight) async {
        if (ifRight['status'] == false) {
          emit(SearchError(error: ifRight['message']!.toString()));
          SnackBar(
            content: Text(ifRight['message']),
          );
        }
        if (ifRight['status'] == true) {
          SearchModel searchModel = SearchModel.fromMap(ifRight);
          safePrint(searchModel);
          emit(SearchSuccess(searchModel: searchModel));
        }
      });
    }).catchError((onError) {
      emit(SearchError(error: onError.toString()));
    });
  }
  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
