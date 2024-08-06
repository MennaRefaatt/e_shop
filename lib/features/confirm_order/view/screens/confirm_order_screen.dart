import 'package:e_shop/core/shared_preferences/my_shared.dart';
import 'package:e_shop/core/widgets/app_button.dart';
import 'package:e_shop/features/confirm_order/manager/confirm_order_cubit.dart';
import 'package:e_shop/features/confirm_order/view/widgets/default_address.dart';
import 'package:e_shop/features/confirm_order/view/widgets/item_details.dart';
import 'package:e_shop/features/confirm_order/view/widgets/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared_preferences/my_shared_keys.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../address/manager/address_cubit.dart';
import '../../../cart/manager/cart_cubit.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({
    super.key,
  });

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  final cubit = ConfirmOrderCubit();
  final addressCubit = AddressCubit();
  final cartCubit = CartCubit();
  late int selectedPaymentMethod;

  @override
  void initState() {
    super.initState();
    selectedPaymentMethod = 1; // Default to "Cash on Delivery"
  }

  void _updatePaymentMethod(String method) {
    setState(() {
      selectedPaymentMethod = method == 'Cash on Delivery' ? 1 : 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => cubit,
        ),
        BlocProvider(
          create: (context) => addressCubit..getAddress(),
        ),
        BlocProvider(
          create: (context) => cartCubit..getCartData(),
        ),
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              DefaultAppBar(
                text: S().confirmOrder,
                cartIcon: false,
                backArrow: true,
              ),
              Divider(
                thickness: 1.sp,
                color: AppColors.greyBorder.withOpacity(0.1),
              ),
              const DefaultAddress(),
              Divider(
                thickness: 5.sp,
                color: AppColors.greyBorder.withOpacity(0.1),
              ),
              const ItemDetails(),
              Divider(
                thickness: 5.sp,
                color: AppColors.greyBorder.withOpacity(0.1),
              ),
              PaymentMethod(
                initialPaymentMethod: selectedPaymentMethod.toString(),
                onChange: _updatePaymentMethod,
              ),
              AppButton(
                onPressed: () {
                  cubit.addConfirmOrderData(
                    addressId:
                        MyShared.getInt(key: MySharedKeys.defaultAddressId)!,
                    paymentMethod: selectedPaymentMethod,
                  );
                },
                label: S().confirmOrder,
                backgroundColor: AppColors.primary,
                fontSize: 20.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
