

import 'package:aisonedashboard/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Screens/vi_Login.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';




void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.lightBlue),
         home:vi_login() );






  }
}
