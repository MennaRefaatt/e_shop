import 'package:e_shop/features/settings/settings_screen/view/widgets/ink_well_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/utils/navigators.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../routing/routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(text: S().profile, cartIcon: false, backArrow: true),
          Container(
            margin: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(20.h),
                inkWell(
                    icon: Icons.person_2_outlined,
                    text: S().profileInfo,
                    context: context,
                    onTap: () =>
                        pushNamed(context, Routes.updateAccountScreen)),
                verticalSpacing(25.h),
                Divider(
                  color: AppColors.primary,
                  thickness: 1.sp,
                ),
                verticalSpacing(25.h),
                inkWell(
                  icon: Icons.lock_open,
                  text: S().changePassword,
                  context: context,
                  onTap: () => pushNamed(context, Routes.changePassword),
                ),
                verticalSpacing(50.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
