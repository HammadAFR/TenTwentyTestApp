import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'core/constants/multiproviders_list.dart';
import 'core/utils/locator.dart';
import 'view/Custom Bottom Nav Bar/custom_bottom_nav_bar.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const double _designWidth = 375;
  static const double _designHeight = 812;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(_designWidth, _designHeight),
        builder: (context, widget) {
          return MultiProvider(
            providers: providers,
            child: GetMaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const CustomBottomNavBar(),
            ),
          );
        });
  }
}
