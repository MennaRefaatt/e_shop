import 'package:e_shop/features/address/view/screens/address_screen.dart';
import 'package:e_shop/features/authentication/register/view/screen/register_screen.dart';
import 'package:e_shop/features/categories/view/screens/categories_screen.dart';
import 'package:e_shop/features/product_details/product_details_args.dart';
import 'package:e_shop/features/product_details/view/screens/product_details_screen.dart';
import 'package:e_shop/features/settings/contact_us_screen/view/screens/contact_us_screen.dart';
import 'package:e_shop/features/suggested_products/view/screen/suggested_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_shop/core/utils/safe_print.dart';
import 'package:e_shop/features/main_screen/view/screens/main_screen.dart';
import 'package:e_shop/features/splash/splash_screen.dart';
import 'package:e_shop/routing/routes.dart';

import '../features/address/view/screens/add_address_screen/view/screen/add_address_screen.dart';
import '../features/authentication/login/view/screens/login_screen.dart';
import '../features/cart/view/screens/cart_screen.dart';
import '../features/category_details/category_details_args.dart';
import '../features/category_details/view/screens/category_details_screen.dart';
import '../features/favorite/manager/favourite_cubit.dart';
import '../features/settings/complaints_screen/view/screens/complaints_screen.dart';
import '../features/settings/fAQs_screen/view/screens/f_a_q_s_screen.dart';
import '../features/settings/profile_screen/view/screens/change_password/view/screens/change_password_screen.dart';
import '../features/settings/profile_screen/view/screens/profile_screen.dart';
import '../features/settings/profile_screen/view/screens/update_account/view/screens/update_account_screen.dart';
import '../features/settings/terms_and_conditions_screen/view/screens/terms_and_conditions_screen.dart';
import '../features/suggested_products/view/suggested_products_args.dart';

class RouteServices {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    safePrint('generateRoute => ${routeSettings.name}');
    safePrint('generateRoute => ${routeSettings.arguments}');

    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case Routes.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case Routes.addressScreen:
        return MaterialPageRoute(builder: (_) =>  AddressScreen());

        case Routes.addAddressScreen:
        return MaterialPageRoute(builder: (_) {
          //final args = routeSettings.arguments as AddressArgs;
          return AddAddressScreen();
        });

      // case Routes.notificationScreen:
      // return MaterialPageRoute(builder: (_) =>  const NotificationScreen());
      //
      case Routes.suggestedProductsScreen:
        return MaterialPageRoute(builder: (_) {
          final args = routeSettings.arguments as SuggestedProductsArgs;
          return SuggestedProductsScreen(
            args: args, favouriteCubit: FavouriteCubit(),
          );
        });

        case Routes.categoryDetailsScreen:
        return MaterialPageRoute(builder: (_) {
          final args = routeSettings.arguments as CategoryDetailsArgs;
          return CategoryDetailsScreen(
            args: args,
          );
        });

        case Routes.cartScreen:
        return MaterialPageRoute(builder: (_) =>  CartScreen());

      case Routes.categoriesScreen:
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());
      case Routes.termsAndConditionsScreen:
        return MaterialPageRoute(builder: (_) => TermsAndConditionsScreen());

      case Routes.contactUsScreen:
        return MaterialPageRoute(builder: (_) => ContactUsScreen());

      case Routes.complaintsScreen:
        return MaterialPageRoute(builder: (_) => ComplaintsScreen());

      case Routes.fAQsScreen:
        return MaterialPageRoute(builder: (_) => FAQsScreen());

      case Routes.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());

      case Routes.updateAccountScreen:
        return MaterialPageRoute(builder: (_) => UpdateAccountScreen());

      case Routes.productDetailsScreen:
        return MaterialPageRoute(builder: (_) {
          final args = routeSettings.arguments as ProductDetailsArgs;
          return ProductDetailsScreen(
            args: args,
          );
        });

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Page Not Found"),
        ),
      );
    });
  }
}
