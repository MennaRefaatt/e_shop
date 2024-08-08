import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/svg.dart';
import 'package:e_shop/features/favorite/view/screens/favorite_screen.dart';
import 'package:e_shop/features/main_screen/view/widget/icons_widget.dart';
import 'package:e_shop/features/orders/view/screen/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_shop/features/home/view/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/safe_print.dart';
import '../../../../generated/l10n.dart';
import '../../../settings/settings_screen/view/screens/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    const HomeScreen(),
     OrdersScreen(),
    const FavoriteScreen(),
    const SettingsScreen()
  ];
  int index = 0;
  final bool isSelected=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        elevation: 0,
        showSelectedLabels: true,
        selectedItemColor: AppColors.primary,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        backgroundColor: AppColors.primary,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const AppSVG(assetName: "home"),
            label: S().home,
            activeIcon: const AppSVG(
              assetName: "home",
              color: AppColors.primary,
            ),
          ),
          BottomNavigationBarItem(
            icon: const AppSVG(assetName: "order-history"),
            label: S().orders,
            activeIcon: const AppSVG(
              assetName: "order-history",
              color: AppColors.primary,
            ),
          ),
          BottomNavigationBarItem(
            icon: const AppSVG(assetName: "heart"),
            label: S().favorite,
            activeIcon: const AppSVG(
              assetName: "heart",
              color: AppColors.primary,
            ),
          ),
          BottomNavigationBarItem(
            icon: const AppSVG(assetName: "settings"),
            label: S().settings,
            activeIcon: const AppSVG(
              assetName: "settings",
              color: AppColors.primary,
            ),
          ),
        ],
      ),

      body: screens[index],
    );
  }
}
