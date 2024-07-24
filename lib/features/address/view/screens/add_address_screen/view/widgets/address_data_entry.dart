import 'package:e_shop/features/address/manager/address_cubit.dart';
import 'package:e_shop/features/address/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/styles/colors.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../../../../../core/widgets/app_text_field.dart';
import '../../../../../../../generated/l10n.dart';

class AddressDataEntry extends StatelessWidget {
  const AddressDataEntry(
      {super.key, required this.cubit, required this.addressModel});
  final AddressCubit cubit;
  final AddressModel addressModel;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state is AddressLoading) {
          const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        } else if (state is AddressSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
              content: Text(state.addressModel.message),
            ),
          );
        }
        if (state is AddressError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.all(15.sp),
        child: Form(
          key: cubit.formKey,
          child: Column(children: [
            AppTextField(
              withTitle: true,
              textInputAction: TextInputAction.next,
              controller: cubit.nameController,
              backgroundColor: AppColors.primaryLight,
              keyboardType: TextInputType.name,
              hint: "Your name",
              title: S().name,
              filledColor: AppColors.greyInput,
              validator: (value) {
                if (value!.isEmpty) {
                  return S().pleaseEnterYourName;
                }
                return null;
              },
            ),
            verticalSpacing(15.h),
            AppTextField(
              withTitle: true,
              textInputAction: TextInputAction.next,
              controller: cubit.cityController,
              backgroundColor: AppColors.primaryLight,
              keyboardType: TextInputType.name,
              hint: "city",
              title: S().city,
              filledColor: AppColors.greyInput,
              validator: (value) {
                if (value!.isEmpty) {
                  return S().required;
                }
                return null;
              },
            ),
            AppTextField(
              withTitle: true,
              textInputAction: TextInputAction.next,
              controller: cubit.regionController,
              backgroundColor: AppColors.primaryLight,
              keyboardType: TextInputType.name,
              hint: "region",
              title: S().region,
              filledColor: AppColors.greyInput,
              validator: (value) {
                if (value!.isEmpty) {
                  return S().required;
                }
                return null;
              },
            ),
            verticalSpacing(15.h),
            AppTextField(
              withTitle: true,
              textInputAction: TextInputAction.next,
              controller: cubit.longitude,
              backgroundColor: AppColors.primaryLight,
              keyboardType: TextInputType.name,
              hint: "35.6876875",
              title: S().longitude,
              filledColor: AppColors.greyInput,
              validator: (value) {
                if (value!.isEmpty) {
                  return S().required;
                }
                return null;
              },
            ),
            verticalSpacing(15.h),
            AppTextField(
              withTitle: true,
              textInputAction: TextInputAction.next,
              controller: cubit.latitude,
              backgroundColor: AppColors.primaryLight,
              keyboardType: TextInputType.name,
              hint: "35.6876875",
              title: S().latitude,
              filledColor: AppColors.greyInput,
              validator: (value) {
                if (value!.isEmpty) {
                  return S().required;
                }
                return null;
              },
            ),
            verticalSpacing(15.h),
            AppTextField(
              withTitle: true,
              textInputAction: TextInputAction.next,
              controller: cubit.detailsController,
              backgroundColor: AppColors.primaryLight,
              keyboardType: TextInputType.name,
              hint: "details",
              title: S().details,
              filledColor: AppColors.greyInput,
              validator: (value) {
                if (value!.isEmpty) {
                  return S().required;
                }
                return null;
              },
            ),
            verticalSpacing(15.h),
            AppTextField(
              withTitle: true,
              textInputAction: TextInputAction.next,
              controller: cubit.notesController,
              backgroundColor: AppColors.primaryLight,
              keyboardType: TextInputType.name,
              hint: "notes",
              title: S().notes,
              filledColor: AppColors.greyInput,
            ),
            verticalSpacing(15.h),

          ]),
        ),
      ),
    );
  }
}
