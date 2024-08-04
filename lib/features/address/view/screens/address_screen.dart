import 'package:e_shop/core/shared_preferences/my_shared.dart';
import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/navigators.dart';
import 'package:e_shop/core/utils/safe_print.dart';
import 'package:e_shop/core/utils/spacing.dart';
import 'package:e_shop/core/widgets/app_bar.dart';
import 'package:e_shop/core/widgets/app_button.dart';
import 'package:e_shop/features/address/manager/address_cubit.dart';
import 'package:e_shop/features/address/view/widgets/saved_addresses_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared_preferences/my_shared_keys.dart';
import '../../../../generated/l10n.dart';
import '../../../../routing/routes.dart';
import 'add_address_screen/view/address_args.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});
  final cubit = AddressCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getAddress(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              DefaultAppBar(
                text: S().address,
                cartIcon: false,
                backArrow: true,
              ),
              BlocBuilder<AddressCubit, AddressState>(
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
                    return Container(
                      margin: EdgeInsets.all(15.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppButton(
                              onPressed: () =>
                                  pushNamed(context, Routes.addAddressScreen),
                              backgroundColor: AppColors.primary,
                              label: S().addNewAddress),
                          verticalSpacing(20.h),
                          Text(
                            S().savedAddresses,
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
                          SavedAddressesListView(
                            cubit: cubit,
                            addressData: state.addressModel.addressData!,
                            args: AddressArgs(addressModel: state.addressModel),
                          ),
                          verticalSpacing(20.h),
                          AppButton(
                              width: 200.w,
                              onPressed: () {
                                pushNamed(
                                  context, Routes.confirmOrderScreen,);
                                safePrint(MyShared.getInt(key: MySharedKeys.defaultAddressId));
                              },
                              backgroundColor: AppColors.primary,
                              label: S().saveAndContinue),
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
