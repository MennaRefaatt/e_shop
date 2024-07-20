import 'package:e_shop/core/styles/colors.dart';
import 'package:e_shop/core/utils/svg.dart';
import 'package:e_shop/features/categories/view/screens/categories_screen.dart';
import 'package:e_shop/features/favorite/view/screens/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_shop/features/home/view/screens/home_screen.dart';

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
    const CategoriesScreen(),
    FavoriteScreen(),
    const SettingsScreen()
  ];
  int index = 0;
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
        items:  [
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
            icon: const AppSVG(assetName: "search"),
            label: S().favorite,
            activeIcon: const AppSVG(
              assetName: "search",
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
