import 'package:e_shop/features/authentication/login/view/widgets/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/spacing.dart';
import 'package:e_shop/generated/l10n.dart';
import '../../../../../core/utils/navigators.dart';
import '../../../../../core/utils/safe_print.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../routing/routes.dart';
import '../../manager/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final cubit = LoginCubit();

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
                    S().signInToEShop,
                    style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary),
                  ),
                ),
                LoginWidget(cubit: cubit),
                verticalSpacing(15.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(S().forgotPassword,
                        style: TextStyle(
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primary,
                            fontSize: 15.sp)),
                  ),
                ),
                AppButton(
                  backgroundColor: AppColors.primary,
                  onPressed: () {
                    safePrint("clicked");
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.login();
                    }
                  },
                  label: S().signIn,
                ),
                verticalSpacing(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S().dontHaveAnAccount,
                        style: TextStyle(
                            color: AppColors.greyBorder,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {
                          pushNamed(context, Routes.register);
                        },
                        child: Text(
                          S().signUp,
                          style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}
