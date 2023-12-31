import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/layout/homeLayout.dart';
import 'package:todo/screens/tasks/editTaskTab.dart';
import 'package:todo/shared/style/MyThemeData.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        EditTask.routeName:(context)=>EditTask(),
      },
    );
  }


}

