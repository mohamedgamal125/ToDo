import 'package:flutter/material.dart';
import 'package:todo/layout/homeLayout.dart';
import 'package:todo/shared/style/MyThemeData.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: MyThemeData.liteMode,
      initialRoute: HomeLayout.routeName,
      routes: {

        HomeLayout.routeName:(context)=>HomeLayout(),
      },
    );
  }


}

