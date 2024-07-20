import 'package:e_shop/features/settings/fAQs_screen/manager/f_aqs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class FAQsScreen extends StatelessWidget {
  FAQsScreen({super.key});
  final cubit=FAqsCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getFAQsData(),
      child: BlocBuilder<FAqsCubit, FAqsState>(
        builder: (context, state) {
          if (state is  FAqsSuccess) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  S().fAQs, style: TextStyle(color: Colors.black,
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
              body: Container(
                margin: EdgeInsets.all(15.sp),
                child: ListView.builder(
                  itemCount: state.fAQsModel.data!.data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.fAQsModel.data!.data[index].question,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold
                          ),),
                        Text(state.fAQsModel.data!.data[index].answer,
                          style: TextStyle(
                              fontSize: 16.sp
                          ),),
                      ],
                    );
                  }
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
