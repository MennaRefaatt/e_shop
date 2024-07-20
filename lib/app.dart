import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_shop/core/cubits/language/language_cubit.dart';
import 'package:e_shop/core/shared_preferences/my_shared.dart';
import 'package:e_shop/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:e_shop/routing/route_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
final appNavKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.


  @override
  void initState() {
    Intl.defaultLocale = MyShared.getCurrentLanguage();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        buildWhen: (previous, current) => current is ChangeLanguageState,
        builder: (context, state) {
          return ScreenUtilInit(
          designSize: const Size(390, 844),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                title: 'Flutter Demo',
                navigatorObservers: [ChuckerFlutter.navigatorObserver],
                navigatorKey: appNavKey,
                key: ValueKey(MyShared.getCurrentLanguage()),
                locale: Locale(MyShared.getCurrentLanguage()),
                debugShowCheckedModeBanner: false,
                supportedLocales: S.delegate.supportedLocales,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                builder: EasyLoading.init(),
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                      seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                onGenerateRoute: RouteServices.generateRoute,


              );
            },
          );
        },
      ),
    );
  }
}
