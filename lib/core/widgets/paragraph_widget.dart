import 'package:e_shop/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParagraphWidget extends StatelessWidget {
  const ParagraphWidget({super.key, required this.title, required this.body});
final String title,body;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w900
          ),),
          verticalSpacing(5),
          Text(body),
        ],
      ),
    );
  }
}
