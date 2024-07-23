import 'package:e_shop/core/cubits/language/language_cubit.dart';
import 'package:e_shop/core/shared_preferences/my_shared.dart';
import 'package:e_shop/core/utils/navigators.dart';
import 'package:e_shop/core/utils/safe_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_preferences/my_shared_keys.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../generated/l10n.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.3),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(21.r),
            topRight: Radius.circular(21.r)),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        mainAxisAlignment:
        MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextButton(
              child: Text(
                S().english,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              onPressed: () {
                context
                    .read<LanguageCubit>()
                    .changeLanguageToEn();
                pop(context);
                safePrint(MyShared.getString(key: MySharedKeys.currentLanguage));
              }),
          const Divider(
            color: AppColors.primaryLight,
          ),
          TextButton(
              child: Text(
                S().arabic,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              onPressed: () {
                context
                    .read<LanguageCubit>()
                    .changeLanguageToAr();
                pop(context);
                safePrint(MyShared.getString(key: MySharedKeys.currentLanguage));
              }),
        ],
      ),
         );
  }
}
