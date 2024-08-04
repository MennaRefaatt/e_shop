import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/shared_preferences/my_shared.dart';
import '../../../../../../../../core/shared_preferences/my_shared_keys.dart';
import '../../../../../../../../core/styles/colors.dart';
import '../../../../../../../../core/utils/spacing.dart';
import '../../../../../../../../core/widgets/app_button.dart';
import '../../../../../../../../core/widgets/app_text_field.dart';
import '../../../../../../../../generated/l10n.dart';
import '../../../../../manager/update_account_manager/update_account_cubit.dart';
class UpdateAccountForm extends StatelessWidget {
  const UpdateAccountForm({super.key, required this.cubit});
final UpdateAccountCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpacing(20.h),
          AppTextField(
            withTitle: true,
            textInputAction: TextInputAction.next,
            controller: cubit.nameController,
            backgroundColor: AppColors.primaryLight,
            keyboardType: TextInputType.name,
            hint: MyShared.getString(key: MySharedKeys.name),
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
            backgroundColor: AppColors.primaryLight,
            keyboardType: TextInputType.phone,
            hint: MyShared.getString(key: MySharedKeys.phone),
            title: S().phone,
            filledColor: AppColors.greyInput,
            validator: (value) {
              if (value!.isEmpty) {
                return S().pleaseEnterYourPhone;
              }
              if (!value.contains('01')) {
                return S().invalidPhone;
              }
              if (value.length != 11) {
                return S().lengthMustBeEqual11;
              }
              return null;
            },
            controller: cubit.phoneController,
            maxLength: 11,
          ),
          verticalSpacing(15.h),
          AppTextField(
            textInputAction: TextInputAction.done,
            withTitle: true,
            controller: cubit.emailController,
            backgroundColor: AppColors.greyBorder,
            keyboardType: TextInputType.emailAddress,
            enabled: false,
            hint: MyShared.getString(key: MySharedKeys.email),
            title: S().email,
            validator: (value) {
              if (value!.isEmpty) {
                return S().pleaseEnterYourEmail;
              }
              return null;
            },
            filledColor: AppColors.greyInput,
          ),
          verticalSpacing(15.h),
          BlocBuilder<UpdateAccountCubit, UpdateAccountState>(
            builder: (context, state) {
              if (state is UpdateAccountLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
              } else {
                return AppButton(
                  margin: const EdgeInsets.all(0),
                  backgroundColor: AppColors.primary,
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.updateAccount();
                    }
                  },
                  label: S().updateAccount,
                  fontSize: 20.sp,
                  textColor: AppColors.primaryLight,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
