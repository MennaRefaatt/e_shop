import 'package:e_shop/features/settings/profile_screen/view/screens/change_password/view/widgets/change_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/widgets/app_bar.dart';
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
            body: Column(
              children: [
                DefaultAppBar(
                    text: S().changePassword, cartIcon: false, backArrow: true),
                Container(
                  margin: EdgeInsets.all(15.sp),
                  child: SingleChildScrollView(
                    child: ChangePasswordForm(cubit: cubit),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
