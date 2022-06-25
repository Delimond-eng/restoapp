import 'package:dashui/services/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/navigator_controller.dart';
import 'controllers/sell_controller.dart';
import 'screens/auth/authenticate_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDbLibrary();
  await DbHelper.init();
  Get.put(NavigatorController());
  Get.put(SellController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dash ui',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Didact Gothic',
      ),
      home: Builder(
        builder: (context) {
          return const AuthenticateScreen();
        },
      ),
    );
  }
}
