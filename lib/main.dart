import 'package:flutter/material.dart';
import 'package:e_shop/app.dart';
import 'package:e_shop/core/shared_preferences/my_shared.dart';
import 'package:e_shop/core/shared_preferences/my_shared_keys.dart';
import 'package:e_shop/core/utils/safe_print.dart';
import 'core/api/my_dio.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyDio.init();
  await MyShared.init();
  safePrint(MyShared.getString(key: MySharedKeys.currentLanguage));
  safePrint(MyShared.getString(key: MySharedKeys.apiToken));
  runApp(const MyApp());
}

