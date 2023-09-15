import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/services/services_locator.dart';
import 'core/getx/routes/routs.dart';
import 'core/manager/themes_manager.dart';


void main() async {
  ServiceLocator().init();
 
  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home:DetailsTvScreen()
      title: 'Movie',
      theme: themeManager(),
      initialRoute: RouteName.mainScreen,
      getPages: RoutePage.pageRoute,
    );
  }
}
