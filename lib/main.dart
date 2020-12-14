import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vscanner/modules/login/login_binding.dart';
import 'package:vscanner/routes/app_routes.dart';
import 'package:vscanner/utils/app_translatation.dart';
import 'package:vscanner/utils/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIOverlays([]);
  DependencyInjection.init();

  runApp(GetMaterialApp(
    translations: AppTranslations(),
    title: 'VScanner',
    initialRoute: AppRouters.INITIAL,
    initialBinding: LoginBinding(),
    locale: Locale('en', 'US'),
    debugShowCheckedModeBanner: false,
    getPages: AppRouters.routes,
  ));
}
