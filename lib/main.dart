import 'package:e_commerce/routers/app_pages.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/widgets/ignore_text_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  await GetStorage.init();
  runApp(IgnoreTextScale(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final storage = GetStorage();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Shopping store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: storage.read('isLogin') ?? false
          ? AppRoutes.home
          : storage.read('isIntro') ?? false
              ? AppRoutes.login
              : AppRoutes.index,
      getPages: AppPages.pages,
      defaultTransition: Transition.rightToLeftWithFade,
    );
  }
}
