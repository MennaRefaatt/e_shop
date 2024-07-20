import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    required this.title,
    this.back = true,
    this.centerTitle = false,
    this.onPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String title;
  final bool back;
  final bool? centerTitle;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      leading: back
          ? IconButton(
              onPressed: onPressed ?? () => pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            )
          : const SizedBox(),
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.purple,
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }
}
