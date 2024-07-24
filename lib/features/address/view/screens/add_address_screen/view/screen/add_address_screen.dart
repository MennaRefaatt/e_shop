import 'package:e_shop/core/widgets/app_bar.dart';
import 'package:e_shop/features/address/manager/address_cubit.dart';
import 'package:e_shop/features/address/view/screens/add_address_screen/view/address_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/styles/colors.dart';
import '../../../../../../../core/widgets/app_button.dart';
import '../../../../../../../generated/l10n.dart';
import '../widgets/address_data_entry.dart';

class AddAddressScreen extends StatelessWidget {
   AddAddressScreen({super.key, required this.args});
final cubit= AddressCubit();
final AddressArgs args;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        body: Column(
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
                    addressModel:args.addressModel ,
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
                              cubit.addAddress(address: args.addressModel);
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
    );
  }
}
