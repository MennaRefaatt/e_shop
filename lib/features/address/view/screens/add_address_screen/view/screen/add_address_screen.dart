import 'package:e_shop/core/widgets/app_bar.dart';
import 'package:e_shop/features/address/manager/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/styles/colors.dart';
import '../../../../../../../core/widgets/app_button.dart';
import '../../../../../../../generated/l10n.dart';
import '../widgets/address_data_entry.dart';

class AddAddressScreen extends StatelessWidget {
   AddAddressScreen({super.key,
   });
final cubit= AddressCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultAppBar(
                text: S().addNewAddress,
                cartIcon: false,
                backArrow: true),
              Container(
                margin: EdgeInsets.all(15.sp),
                child: Column(
                  children: [
                    AddressDataEntry(
                      cubit:cubit,
                     ),
                    BlocBuilder<AddressCubit, AddressState>(
                      builder: (context, state) {
                        if (state is AddressLoading) {
                          return const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                                backgroundColor: Colors.white70,
                              ));
                        } else {
                          return AppButton(
                            margin: const EdgeInsets.all(0),
                            backgroundColor: AppColors.primary,
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.addAddress();
                              }
                            },
                            label: S().save,
                            fontSize: 20.sp,
                            textColor: AppColors.primaryLight,
                          );
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
