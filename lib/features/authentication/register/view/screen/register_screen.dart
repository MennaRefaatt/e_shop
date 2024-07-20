import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                      Text(S().register,
                          style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryLight)),
                      verticalSpacing(5.h),
                      Text(S().createAccount,
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColors.primaryLight,
                              fontWeight: FontWeight.w300))
                    ],
                  ),
                )),
            RegisterWidget(
              cubit: cubit,
            ),
                    ],
                  ),
          )),
    );
  }
}
