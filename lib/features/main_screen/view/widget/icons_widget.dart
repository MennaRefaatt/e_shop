import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/utils/safe_print.dart';
import '../../../../core/utils/svg.dart';

class IconsWidget extends StatefulWidget {
  IconsWidget(
      {super.key,
      required this.index,
      required this.assetName,
      required this.title,
      required this.inputIndex});
  late int index;
  final String assetName;
  final String title;
  late int inputIndex;
  @override
  State<IconsWidget> createState() => _IconsWidgetState();
}

class _IconsWidgetState extends State<IconsWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.sp),
      onTap: () {
        setState(() {
          widget.index = widget.inputIndex;
          safePrint(widget.index);
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSVG(
            assetName: widget.assetName,
            color: AppColors.black,
          ),
          Visibility(
              visible: widget.index==widget.inputIndex,
              child: Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              )),
        ],
      ),
    );
  }
}
