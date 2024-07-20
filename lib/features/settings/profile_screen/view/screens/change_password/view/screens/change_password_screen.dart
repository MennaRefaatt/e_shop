import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/styles/colors.dart';
import '../../../../../../../../core/utils/spacing.dart';
import '../../../../../../../../core/widgets/app_text_field.dart';
import '../../../../../../../../generated/l10n.dart';
import '../../../../../manager/change_password_manager/change_password_cubit.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final cubit = ChangePasswordCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error.toString()),
              ),
            );
          }
          if (state is ChangePasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(S().passwordChangedSuccessfully),
              ),
            );
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              S().changePassword,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_outlined),
            ),
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            margin: EdgeInsets.all(15.sp),
            child: SingleChildScrollView(
                    child: Form(
                      key: cubit.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpacing(20.h),
                          AppTextField(
                            withTitle: true,
                            hint: "xxxxxxxxx",
                            textInputAction: TextInputAction.next,
                            title: S().currentPassword,
                            backgroundColor: AppColors.primaryLight,
                            keyboardType: TextInputType.visiblePassword,
                            filledColor: AppColors.greyInput,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return S().pleaseEnterOldPassword;
                              }
                              if (value.length < 6) {
                                return S().invalidPassword;
                              }
                              return null;
                            },
                            suffixIcon: IconButton(
                              onPressed: () {
                                cubit.obscureText1 = !cubit.obscureText1;
                                setState(() {});
                              },
                              icon: Icon(cubit.obscureText1
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            obscureText: cubit.obscureText1,
                            controller: cubit.currentPassController,
                          ),
                          verticalSpacing(15.h),
                          AppTextField(
                            withTitle: true,
                            hint: "xxxxxxxxx",
                            textInputAction: TextInputAction.next,
                            title: S().newPassword,
                            backgroundColor: AppColors.primaryLight,
                            keyboardType: TextInputType.visiblePassword,
                            filledColor: AppColors.greyInput,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return S().pleaseEnterNewPassword;
                              }
                              if (cubit.currentPassController.text == value) {
                                return S().mustBeDifferent;
                              }
                              if (value.length < 6) {
                                return S().invalidPassword;
                              }
                              return null;
                            },
                            suffixIcon: IconButton(
                              onPressed: () {
                                cubit.obscureText3 = !cubit.obscureText3;
                                setState(() {});
                              },
                              icon: Icon(cubit.obscureText3
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            obscureText: cubit.obscureText3,
                            controller: cubit.newPassController,
                          ),
                          verticalSpacing(15.h),
                          AppTextField(
                            textInputAction: TextInputAction.done,
                            withTitle: true,
                            backgroundColor: AppColors.primaryLight,
                            keyboardType: TextInputType.visiblePassword,
                            hint: "xxxxxxxxx",
                            title: S().confirmPassword,
                            controller: cubit.confirmPasswordController,
                            filledColor: AppColors.greyInput,
                            suffixIcon: IconButton(
                              onPressed: () {
                                cubit.obscureText2 = !cubit.obscureText2;
                                setState(() {});
                              },
                              icon: Icon(cubit.obscureText2
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            obscureText: cubit.obscureText2,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return S().pleaseEnterConfirmPassword;
                              }
                              if (cubit.currentPassController.text == value) {
                                return S().mustBeDifferent;
                              }
                              if (value.length < 6) {
                                return S().invalidPassword;
                              }
                              if (cubit.newPassController.text != value) {
                                return S().passwordNotMatch;
                              }
                              return null;
                            },
                          ),
                          verticalSpacing(15.h),
                          BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                            builder: (context, state) {
                              if (state is ChangePasswordLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primary,
                                  ),
                                );
                              } else {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    minimumSize: Size(double.infinity, 50.sp),
                                  ),
                                  onPressed: () {
                                    if (cubit.formKey.currentState!
                                        .validate()) {
                                      cubit.changePassword();
                                    }
                                  },
                                  child: Text(
                                    S().changePassword,
                                    style: TextStyle(
                                        color: AppColors.primaryLight,
                                        fontSize: 18.sp),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
            ),
          ),
        ),
      ),

    ));

  }
  }
