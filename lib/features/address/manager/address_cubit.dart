import 'package:bloc/bloc.dart';
import 'package:e_shop/core/api/endpoints.dart';
import 'package:e_shop/core/api/my_dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/safe_print.dart';
import '../model/address_model.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController latitude = TextEditingController();
  TextEditingController longitude = TextEditingController();


  getAddress() async {
    emit(AddressLoading());
    MyDio.getData(endPoint: EndPoints.address).then((onValue) {
      onValue.fold((ifLeft) {
        emit(AddressError(error: ifLeft.toString()));
      }, (ifRight) async {
        if (ifRight['status'] == false) {
          emit(AddressError(error: ifRight['message']!.toString()));
          SnackBar(content: Text(ifRight['message']),);
        }
        if (ifRight['status'] == true) {
          AddressModel addressModel =
          AddressModel.fromJson(ifRight);
          safePrint(addressModel.data);
          emit(AddressSuccess(addressModel: addressModel));
        }
      });
    }).catchError((onError) {
      emit(AddressError(error: onError.toString()));
    });
  }
  void addAddress({required AddressModel address}) {
    emit(AddressLoading());
    MyDio.postData(endPoint: EndPoints.address, data:{
      "name": nameController.text,
      "city": cityController.text,
      "region": regionController.text,
      "details": detailsController.text,
      "notes": notesController.text,
      "latitude": latitude.text,
      "longitude": longitude.text,
    }).then((onValue) {
      onValue.fold((ifLeft) {
        emit(AddressError(error: ifLeft.toString()));
      }, (ifRight) async {
        if (ifRight['status'] == false) {
          emit(AddressError(error: ifRight['message']!.toString()));
          SnackBar(content: Text(ifRight['message']),);
        }
        if (ifRight['status'] == true) {
          AddressModel addressModel =
          AddressModel.fromJson(ifRight);
          safePrint(addressModel.data);
          emit(AddressSuccess(addressModel: addressModel));
          nameController.clear();
          cityController.clear();
          regionController.clear();
          detailsController.clear();
          notesController.clear();
          latitude.clear();
          longitude.clear();
        }
      });
    }).catchError((onError) {
      emit(AddressError(error: onError.toString()));
    });
  }

  deleteAddress({required String addressId}) async {
    emit(AddressLoading());
    MyDio.deleteData(endPoint: EndPoints.addressDelete + addressId).then((onValue) {
      onValue.fold((ifLeft) {
        emit(AddressError(error: ifLeft.toString()));
      }, (ifRight) async {
        if (ifRight['status'] == false) {
          emit(AddressError(error: ifRight['message']!.toString()));
          SnackBar(content: Text(ifRight['message']),);
        }
        if (ifRight['status'] == true) {
          AddressModel addressModel = AddressModel.fromJson(ifRight);
          safePrint(addressModel.data);
          emit(AddressSuccess(addressModel:addressModel));
        }
      });
    }).catchError((onError) {
      emit(AddressError(error: onError.toString()));
    });
  }

  updateAddress({required AddressModel address}) async {
    emit(AddressLoading());
    MyDio.putData(endPoint: EndPoints.addressUpdate, data: {
      "name": nameController.text,
      "city": cityController.text,
      "region": regionController.text,
      "details": detailsController.text,
      "notes": notesController.text,
      "latitude": latitude.text,
      "longitude": longitude.text,
    }).then((onValue) {
      onValue.fold((ifLeft) {
        emit(AddressError(error: ifLeft.toString()));
      }, (ifRight) async {
        if (ifRight['status'] == false) {
          emit(AddressError(error: ifRight['message']!.toString()));
          SnackBar(content: Text(ifRight['message']),);
        }
        if (ifRight['status'] == true) {
          AddressModel addressModel = AddressModel.fromJson(ifRight);
          safePrint(addressModel.data);
          emit(AddressSuccess(addressModel:addressModel));
        }
      });
    }).catchError((onError) {
      emit(AddressError(error: onError.toString()));
    });
  }

}
