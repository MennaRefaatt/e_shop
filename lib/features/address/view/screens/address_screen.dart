import 'package:e_shop/core/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultAppBar(text: S().address, cartIcon: false, backArrow: true,),
        ],
      )
    );
  }
}
