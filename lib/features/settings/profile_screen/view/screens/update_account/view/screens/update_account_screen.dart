import 'package:e_shop/features/settings/profile_screen/view/screens/update_account/view/widgets/update_account_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/widgets/app_bar.dart';
import '../../../../../../../../generated/l10n.dart';
import '../../../../../manager/update_account_manager/update_account_cubit.dart';

class UpdateAccountScreen extends StatelessWidget {
  UpdateAccountScreen({super.key});

  final cubit = UpdateAccountCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<UpdateAccountCubit, UpdateAccountState>(
        listener: (context, state) {
          if (state is UpdateAccountError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
          if (state is UpdateAccountSuccess) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(S().done),
              ),
            );
          }
        },
        child: Scaffold(
          body: Column(
            children: [
              DefaultAppBar(
                  text: S().profileInfo, cartIcon: false, backArrow: true),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(15.sp),
                  padding: EdgeInsets.all(15.sp),
                  child: UpdateAccountForm(cubit: cubit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
