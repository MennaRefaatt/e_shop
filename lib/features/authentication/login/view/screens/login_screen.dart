import 'package:e_shop/core/utils/navigators.dart';
import 'package:e_shop/features/authentication/login/view/widgets/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/easy_loading.dart';
import 'package:e_shop/core/utils/spacing.dart';
import 'package:e_shop/core/widgets/app_button.dart';
import 'package:e_shop/core/widgets/app_text_field.dart';
import 'package:e_shop/generated/l10n.dart';
import '../../../../../routing/routes.dart';
import '../../manager/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final cubit = LoginCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            showLoading();
          }
          if (state is LoginSuccess) {
            showSuccess("");
          }

          if (state is LoginError) {
            showError(state.error);
          }
        },
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20.sp),
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 230.h,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColors.black,
                                  AppColors.primary
                                ])),
                        padding: EdgeInsets.all(20.sp),
                        child: SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: AppColors.primaryLight,
                                  )),
                              verticalSpacing(30.h),
                              Text(S().login,
                                  style: TextStyle(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryLight)),
                              verticalSpacing(5.h),
                            ],
                          ),
                        )),
                    LoginWidget(cubit: cubit)

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
