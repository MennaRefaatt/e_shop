import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/navigators.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/register_cubit.dart';
import '../widgets/register_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final cubit = RegisterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpacing(150.h),
            Center(
              child: Text(
                S().signUp,
                style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary),
              ),
            ),
            RegisterWidget(
              cubit: cubit,
            ),
            verticalSpacing(15.h),
            BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                if (state is RegisterLoadingState) {
                  return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                        backgroundColor: Colors.white70,
                      ));
                } else {
                  return AppButton(
                    margin: const EdgeInsets.all(0),
                    backgroundColor: AppColors.primary,
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.register();
                      }
                    },
                    label: S().register,
                    fontSize: 20.sp,
                    textColor: AppColors.primaryLight,
                  );
                }
              },
            ),
            verticalSpacing(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S().iAlreadyHaveAnAccount,
                  style: TextStyle(
                      color: AppColors.greyBorder,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      pop(context);
                    },
                    child: Text(
                      S().signIn,
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            )
          ],
        ),
      )),
    );
  }
}
