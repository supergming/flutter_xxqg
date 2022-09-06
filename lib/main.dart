import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:study_xxqg/base/utils/js.dart';
import 'package:study_xxqg/ui/app_home.dart';
import 'package:get_it/get_it.dart';
import 'package:study_xxqg/ui/page/log.dart';
import 'package:study_xxqg/ui/page/login.dart';
import 'package:study_xxqg/ui/page/other/config.dart';



final getIt = GetIt.instance;

void main(){
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyXxqg',
      routes: getRouters(),
      initialRoute: "/",
    );
  }

  Map<String, WidgetBuilder> getRouters(){
    return {
      "/":(context)=>const AppHomePage(),
      "/login":(context) => const LoginPage(),
      "/log":(context) => const LogPage(),
      "/config":(context) => const ConfigPage()
    };
  }
}


