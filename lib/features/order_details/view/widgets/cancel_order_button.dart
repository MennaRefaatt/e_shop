import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/features/order_details/model/order_details_model.dart';
import 'package:e_shop/features/order_details/order_details_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/navigators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../generated/l10n.dart';
import '../../../../routing/routes.dart';
import '../../manager/order_details_cubit.dart';

class CancelOrderButton extends StatelessWidget {
  const CancelOrderButton(
      {super.key, required this.args, required this.orderDetailsModel});
  final OrderDetailsArgs args;
  final OrderDetailsModel orderDetailsModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder: (context, state) {
        if (state is CancelOrderSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.cancelOrderModel.message),
              backgroundColor: AppColors.green,
            ),
          );
          pushNamedAndRemoveUntil(context, Routes.mainScreen);
        }
        if (state is CancelOrderError) {
          return Center(
            child: Text(state.error),
          );
        }
        return Visibility(
          visible: orderDetailsModel.data!.status == "New" ||
                  orderDetailsModel.data!.status == "pending"
              ? true
              : false,
          child: AppButton(
              onPressed: () {
                context.read<OrderDetailsCubit>().cancelOrder(orderId: args.id);
              },
              backgroundColor: Colors.red[900],
              label: S().cancelOrder),
        );
      },
    );
  }
}
