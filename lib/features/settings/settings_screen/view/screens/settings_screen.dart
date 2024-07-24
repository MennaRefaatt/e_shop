import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_shop/core/shared_preferences/my_shared.dart';
import 'package:e_shop/core/utils/navigators.dart';
import 'package:e_shop/core/utils/spacing.dart';
import 'package:e_shop/features/settings/settings_screen/view/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../routing/routes.dart';
import '../../manager/settings_cubit.dart';
import '../widgets/ink_well_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final cubit = SettingsCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Container(
        margin: EdgeInsets.all(15.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpacing(20.h),
              Text(
                S().settings,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              verticalSpacing(20.h),
              Container(
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    inkWell(
                      icon: Icons.person_2_outlined,
                      text: S().profile,
                      context: context,
                      onTap: () => pushNamed(context, Routes.profileScreen),
                    ),
                    verticalSpacing(20.h),
                    inkWell(
                        icon: Icons.notifications_active_outlined,
                        text: S().notification,
                        context: context,
                        onTap: () {}),
                    verticalSpacing(20.h),
                    inkWell(
                        icon: Icons.language_outlined,
                        text: S().appLanguage,
                        context: context,
                        onTap: () {
                          showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return const BottomSheetContainer();
                              });
                        }),
                    verticalSpacing(20.h),
                    inkWell(
                      icon: Icons.warning_amber_outlined,
                      text: S().termsAndConditions,
                      context: context,
                      onTap: () =>
                          pushNamed(context, Routes.termsAndConditionsScreen),
                    ),
                    verticalSpacing(20.h),
                    inkWell(
                      icon: Icons.help_outline_outlined,
                      text: S().fAQs,
                      context: context,
                      onTap: () => pushNamed(context, Routes.fAQsScreen),
                    ),
                    verticalSpacing(20.h),
                  ],
                ),
              ),
              verticalSpacing(15.h),
              Container(
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    inkWell(
                      icon: Icons.chat_bubble_outline_rounded,
                      text: S().contactUs,
                      context: context,
                      onTap: () => pushNamed(context, Routes.contactUsScreen),
                    ),
                    verticalSpacing(20.h),
                    inkWell(
                        icon: Icons.people_outline,
                        text: S().complaints,
                        context: context,
                        onTap: () =>
                            pushNamed(context, Routes.complaintsScreen)),
                    verticalSpacing(20.h),
                    inkWell(
                      icon: Icons.logout,
                      text: S().logOut,
                      context: context,
                      onTap: () {
                        awesomeDialog(
                            S().areYouSuretyYouWantToLogout, context);
                      },
                    ),
                    verticalSpacing(20.h),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void awesomeDialog(String message, BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.rightSlide,
      barrierColor: Colors.white54,
      btnCancelColor: AppColors.primary,
      btnOkColor: Colors.red[900],
      btnOkText: "Yes",
      dialogBackgroundColor: Colors.white70,
      title: message,
      //desc: message,
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        MyShared.clearUserData().then((onValue){
          pushNamedAndRemoveUntil(context,  Routes.login,);
        });
        setState(() {});
      },
    ).show();
  }
}
