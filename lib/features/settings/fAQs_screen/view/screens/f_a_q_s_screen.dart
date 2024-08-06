import 'package:e_shop/features/settings/fAQs_screen/manager/f_aqs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../generated/l10n.dart';

class FAQsScreen extends StatelessWidget {
  FAQsScreen({super.key});
  final cubit = FAqsCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getFAQsData(),
      child: Scaffold(
        body: BlocBuilder<FAqsCubit, FAqsState>(
          builder: (context, state) {
            if (state is FAqsSuccess) {
              return Column(
                children: [
                  DefaultAppBar(
                      text: S().fAQs, cartIcon: false, backArrow: true),
                  Container(
                    margin: EdgeInsets.all(15.sp),
                    child: ListView.builder(
                      shrinkWrap: true,
                        itemCount: state.fAQsModel.data!.data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.fAQsModel.data!.data[index].question,
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                state.fAQsModel.data!.data[index].answer,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
