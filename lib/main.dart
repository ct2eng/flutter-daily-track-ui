import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_track/common/lang/translation_service.dart';
import 'package:stock_track/common/routes/app_pages.dart';
import 'package:stock_track/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      theme: Themes.light,
      darkTheme: Themes.dark,
      locale: TranslationService.locale,
      getPages: AppPages.routes,
    );
  }
}
