import 'package:e_shop/features/authentication/login/manager/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/utils/navigators.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../routing/routes.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key, required this.cubit});
  final LoginCubit cubit;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.sp),
      child: Form(
        key: widget.cubit.formKey,
        child: Column(children: [
          AppTextField(
              textInputAction: TextInputAction.next,
              withTitle: true,
              controller: widget.cubit.emailController,
              backgroundColor: AppColors.primaryLight,
              keyboardType: TextInputType.emailAddress,
              hint: "shop@gmail.com",
              title: S().email,
              filledColor: AppColors.greyInput,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S().pleaseEnterYourEmail;
                }
                if (!value.contains('@') || !value.contains('.')) {
                  return S().invalidEmail;
                }
                if (!Validators.isValidEmail(value)) {
                  return S().invalidEmail;
                }
                return null;
              }),
          verticalSpacing(15.h),
          AppTextField(
            withTitle: true,
            hint: "xxxxxxxxx",
            textInputAction: TextInputAction.next,
            title: S().password,
            backgroundColor: AppColors.primaryLight,
            keyboardType: TextInputType.visiblePassword,
            filledColor: AppColors.greyInput,
            validator: (value) {
              if (value!.isEmpty) {
                return S().pleaseEnterYourPassword;
              }
              if (value.length < 6) {
                return S().invalidPassword;
              }
              return null;
            },
            suffixIcon: IconButton(
              onPressed: () {
                widget.cubit.obscureText1 = !widget.cubit.obscureText1;
                setState(() {});
              },
              icon: Icon(widget.cubit.obscureText1
                  ? Icons.visibility_off
                  : Icons.visibility),
            ),
            obscureText: widget.cubit.obscureText1,
            controller: widget.cubit.passwordController,
          ),
          verticalSpacing(15.h),
          AppButton(
            margin: const EdgeInsets.all(0),
            backgroundColor: AppColors.primary,
            onPressed: () {
              widget.cubit.login();
            },
            label: S().signIn,
          ),
          verticalSpacing(10.h),
          AppButton(
            margin: const EdgeInsets.all(0),
            backgroundColor: AppColors.primaryLight,
            onPressed: () {
              pushNamed(context, Routes.register);
            },
            label:S().signUp,
            textColor: AppColors.primary,
          )
        ]),
      ),
    );
  }
}
