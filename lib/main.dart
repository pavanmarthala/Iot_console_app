// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iot_console/Auth/singin.dart';
import 'package:iot_console/pages/Home_page.dart';
import 'package:iot_console/pages/tabs/dash.dart';
import 'package:provider/provider.dart';


void main()  {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => SwitchState(),
      child: MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
    
        home:  Homepage(),
    
    
        theme: ThemeData(
    
            primarySwatch: Colors.green,
        ),
      );
    
  }
}
