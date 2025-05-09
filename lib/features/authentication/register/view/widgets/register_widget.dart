import 'package:e_shop/core/utils/navigators.dart';
import 'package:e_shop/features/authentication/register/manager/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../routing/routes.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        } else if (state is RegisterSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S().register),
            ),
          );
          pushNamedAndRemoveUntil(context, Routes.login);
        }
        if (state is RegisterErrorState) {
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
          key: widget.cubit.formKey,
          child: Column(children: [
            AppTextField(
              withTitle: true,
              textInputAction: TextInputAction.next,
              controller: widget.cubit.nameController,
              keyboardType: TextInputType.name,
              hint: "shop",
              title: S().name,
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
              keyboardType: TextInputType.phone,
              hint: "01XXXXXXXXX",
              title: S().phone,
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
              controller: widget.cubit.phoneController,
              maxLength: 11,
            ),
            verticalSpacing(15.h),
            AppTextField(
                textInputAction: TextInputAction.next,
                withTitle: true,
                controller: widget.cubit.emailController,
                keyboardType: TextInputType.emailAddress,
                hint: "shop@gmail.com",
                title: S().email,
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
              keyboardType: TextInputType.visiblePassword,
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
                icon: Icon(
                    widget.cubit.obscureText1
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors.greyBorder),
              ),
              obscureText: widget.cubit.obscureText1,
              controller: widget.cubit.passController,
            ),
            verticalSpacing(15.h),
            AppTextField(
              textInputAction: TextInputAction.done,
              withTitle: true,
              keyboardType: TextInputType.visiblePassword,
              hint: "xxxxxxxxx",
              title: S().confirmPassword,
              controller: widget.cubit.confirmPasswordController,
              suffixIcon: IconButton(
                onPressed: () {
                  widget.cubit.obscureText2 = !widget.cubit.obscureText2;
                  setState(() {});
                },
                icon: Icon(
                    widget.cubit.obscureText2
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors.greyBorder),
              ),
              obscureText: widget.cubit.obscureText2,
              validator: (value) {
                if (value!.isEmpty) {
                  return S().pleaseEnterConfirmPassword;
                }
                if (value.length < 6) {
                  return S().invalidPassword;
                }
                if (widget.cubit.passController.text != value) {
                  return S().passwordNotMatch;
                }
                return null;
              },
            ),

          ]),
        ),
      ),
    );
  }
}
