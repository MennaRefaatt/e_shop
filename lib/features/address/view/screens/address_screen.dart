import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/navigators.dart';
import 'package:e_shop/core/utils/spacing.dart';
import 'package:e_shop/core/widgets/app_bar.dart';
import 'package:e_shop/core/widgets/app_button.dart';
import 'package:e_shop/features/address/manager/address_cubit.dart';
import 'package:e_shop/features/address/view/widgets/saved_addresses_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/l10n.dart';
import '../../../../routing/routes.dart';
import 'add_address_screen/view/address_args.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});
  final cubit = AddressCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        body: BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            if (state is AddressLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            } else if (state is AddressError) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is AddressSuccess) {
              return Column(
                children: [
                  DefaultAppBar(
                    text: S().address,
                    cartIcon: false,
                    backArrow: true,
                  ),
                  Container(
                    margin: EdgeInsets.all(15.sp),
                    child: Column(
                      children: [
                        AppButton(
                            onPressed: () =>
                                pushNamed(context, Routes.addAddressScreen),
                            backgroundColor: AppColors.primary,
                            label: S().addNewAddress),
                        verticalSpacing(10.h),
                        Text(
                          S().savedAddresses,
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        verticalSpacing(10.h),
                        SavedAddressesListView(
                          cubit: cubit,
                          addressData: state.addressModel.addressData!,
                          args: AddressArgs(addressModel: state.addressModel),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
