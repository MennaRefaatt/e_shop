import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/widgets/app_bar.dart';
import 'package:e_shop/features/address/manager/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';

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
              return  const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            }
            else if (state is AddressError) {
              return Center(
                child: Text(state.error),
              );
            }
           else if (state is AddressSuccess) {
              return  Column(
                children: [
                  DefaultAppBar(
                    text: S().address,
                    cartIcon: false,
                    backArrow: true,
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
