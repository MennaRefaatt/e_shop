import 'package:e_shop/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPItem extends StatefulWidget {
  const OTPItem({Key? key, required this.first, required this.last, required this.controller}) : super(key: key);
  final bool first;
  final bool last;
  final TextEditingController controller;

  @override
  State<OTPItem> createState() => _OTPItemState();
}

class _OTPItemState extends State<OTPItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      margin: EdgeInsets.symmetric(horizontal: 7.sp),
      child: TextFormField(
        validator: (value) {
          if(value!.isEmpty){
            return "";
          }
          return null;
        },
        controller: widget.controller,
        onChanged: (value) {
          if (value.length == 1 && widget.last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && widget.first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: true,
        readOnly: false,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        maxLength: 1,

        decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.symmetric(
              horizontal: 0.sp ,
              vertical: 20.sp
          ),
          counter: const Offstage(),
          focusColor: Colors.grey.shade200,
          fillColor: AppColors.primaryLight,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: const BorderSide(color: Colors.grey),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: const BorderSide(color: Colors.grey),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),


      ),
    );

  }
}