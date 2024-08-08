import 'package:e_shop/features/confirm_order/payment_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../generated/l10n.dart';

class PaymentMethod extends StatefulWidget {
  final String? initialPaymentMethod;
  final void Function(String) onChange;
  const PaymentMethod(
      {super.key, required this.initialPaymentMethod, required this.onChange});
  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  late String selectedPaymentMethod;
  @override
  void initState() {
    super.initState();
    selectedPaymentMethod = widget.initialPaymentMethod ??
        PaymentEnum.cashOnDelivery
            .toString(); // Initialize with initial value or empty string
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S().paymentMethod,
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold)),
          verticalSpacing(10.h),
          selectPaymentMethod(
            onChange: (String? value) {
              setState(() {
                selectedPaymentMethod = value!;
              });
            },
            selectedPaymentMethod: selectedPaymentMethod,
            title: S().cashOnDelivery,
            value: 1.toString(),
            icon: Icons.delivery_dining,
          ),
          selectPaymentMethod(
              onChange: (String? value) {
                setState(() {
                  selectedPaymentMethod = value!;
                });
              },
              selectedPaymentMethod: selectedPaymentMethod,
              title: S().onlinePayment,
              value: 2.toString(),
              icon: Icons.credit_card,
              subtitle: "XXXX XXXX XXXX 1111"),
        ],
      ),
    );
  }
}

selectPaymentMethod(
    {required void Function(String?) onChange,
    required String selectedPaymentMethod,
    required IconData icon,
    required String title,
    String? subtitle,
    required String value}) {
  return InkWell(
    onTap: () {
      onChange(value);
    },
    borderRadius: BorderRadius.circular(10.r),
    child: Container(
      margin: EdgeInsets.all(15.sp),
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        color: AppColors.primaryLight.withOpacity(0.1),
        border: Border.all(color: AppColors.greyBorder),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary), // Icon for visa
        title: Text(title,
            style: const TextStyle(
                color: AppColors.black, fontWeight: FontWeight.bold)),
        subtitle: subtitle == null
            ? null
            : Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.black,
                ),
              ),
        trailing: Radio<String>(
          value: value,
          activeColor: AppColors.primary,
          groupValue: selectedPaymentMethod,
          onChanged: (String? value) {
            onChange(value!);
          },
        ),
      ),
    ),
  );
}
