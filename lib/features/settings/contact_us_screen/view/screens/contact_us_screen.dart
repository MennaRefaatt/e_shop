import 'package:e_shop/core/utils/safe_print.dart';
import 'package:e_shop/core/widgets/app_image.dart';
import 'package:e_shop/features/settings/contact_us_screen/manager/contact_us_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../routing/routes.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});

  final cubit = ContactUsCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getContactUs(),
      child: BlocBuilder<ContactUsCubit, ContactUsState>(
        builder: (context, state) {
          if (state is ContactUsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          } else if (state is ContactUsSuccess) {
            return Scaffold(
              backgroundColor:AppColors.primary.withOpacity(0.2),
              appBar: AppBar(
                title: Text(S().contactUs,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              body: Container(
               // height: 300.h,
                margin: EdgeInsets.all(15.sp),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state.contactUsModel.data!.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:  EdgeInsets.all(20.sp),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10.sp),
                          onTap: () {
                            safePrint("value ${state.contactUsModel.data!.data[index].value}");
                          //launchUrl(Uri.parse(state.contactUsModel.data!.data[index].value));
                          launch(state.contactUsModel.data!.data[index].value);
                          },
                          child: AppImage(
                              imageUrl: state
                                  .contactUsModel.data!.data[index].image,
                              width: 1.w,
                              height: 100.h,
                              borderRadius: BorderRadius.circular(10.sp)),
                        ),
                      );
                    }),
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
