import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/navigators.dart';
import 'package:e_shop/core/widgets/app_button.dart';
import 'package:e_shop/core/widgets/app_text_field.dart';
import 'package:e_shop/features/settings/complaints_screen/manager/complaints_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../generated/l10n.dart';

class ComplaintsScreen extends StatelessWidget {
  ComplaintsScreen({super.key});
  final cubit = ComplaintsCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        body: Column(
          children: [
            DefaultAppBar(
                text: S().complaints, cartIcon: false, backArrow: true),
            Container(
              margin: EdgeInsets.all(15.sp),
              child: BlocBuilder<ComplaintsCubit, ComplaintsState>(
                builder: (context, state) {
                  if (state is ComplaintsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Form(
                        key: cubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextField(
                              withTitle: true,
                              textInputAction: TextInputAction.next,
                              backgroundColor: AppColors.primaryLight,
                              keyboardType: TextInputType.name,
                              hint: S().name,
                              title: S().name,
                              controller: cubit.nameController,
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
                              hint: "01XXXXXXXXX",
                              keyboardType: TextInputType.phone,
                              maxLength: 11,
                              withTitle: true,
                              backgroundColor: AppColors.primaryLight,
                              textInputAction: TextInputAction.next,
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
                              title: S().phone,
                              controller: cubit.phoneController,
                            ),
                            verticalSpacing(15.h),
                            AppTextField(
                                textInputAction: TextInputAction.next,
                                withTitle: true,
                                backgroundColor: AppColors.primaryLight,
                                keyboardType: TextInputType.emailAddress,
                                hint: "shop@gmail.com",
                                title: S().email,
                                controller: cubit.emailController,
                                filledColor: AppColors.greyInput,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return S().pleaseEnterYourEmail;
                                  }
                                  if (!value.contains('@') ||
                                      !value.contains('.')) {
                                    return S().invalidEmail;
                                  }
                                  if (!Validators.isValidEmail(value)) {
                                    return S().invalidEmail;
                                  }
                                  return null;
                                }),
                            verticalSpacing(15.h),
                            AppTextField(
                                maxLines: 5,
                                minLines: 3,
                                keyboardType: TextInputType.multiline,
                                backgroundColor: AppColors.primaryLight,
                                textInputAction: TextInputAction.done,
                                hint: S().writeYourComplaintHere,
                                withTitle: true,
                                title: S().writeYourComplaintHere,
                                controller: cubit.messageController,
                                filledColor: AppColors.greyInput,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return S().writeYourComplaintHere;
                                  }
                                  return null;
                                }),
                            verticalSpacing(15.h),
                            AppButton(
                                onPressed: () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    cubit.sendComplaints();
                                    SnackBar(
                                      content: Text(state.toString()),
                                      backgroundColor: AppColors.primary,
                                      duration: const Duration(seconds: 3),
                                    );
                                    pop(context);
                                  }
                                },
                                backgroundColor: AppColors.primary,
                                label: S().complaints),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
