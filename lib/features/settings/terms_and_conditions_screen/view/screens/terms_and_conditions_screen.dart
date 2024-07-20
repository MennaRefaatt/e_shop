import 'package:e_shop/core/utils/spacing.dart';
import 'package:e_shop/features/settings/terms_and_conditions_screen/manager/terms_and_conditions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../generated/l10n.dart';

class TermsAndConditionsScreen extends StatelessWidget {
   TermsAndConditionsScreen({super.key});
final cubit=TermsAndConditionsCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getTermsAndConditions(),
      child: BlocBuilder<TermsAndConditionsCubit, TermsAndConditionsState>(
        builder: (context, state) {
          if (state is TermsAndConditionsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          }
      if (state is  TermsAndConditionsSuccess) {
        return Scaffold(
        appBar: AppBar(
          title: Text(
            S().termsAndConditions, style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp),),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_outlined, size: 20.sp, color: Colors.black,),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15.sp),
            child:  Column(
                  children: [
                    Text(state.termsAndConditionsModel.data!.about,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
                    verticalSpacing(15.h),
                    Divider(
                      color: Colors.grey,
                      thickness: 1.h,
                    ),
                    verticalSpacing(15.h),
                    Text(state.termsAndConditionsModel.data!.terms,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
                  ],
                )
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
      },
      ),
    );
  }
}
