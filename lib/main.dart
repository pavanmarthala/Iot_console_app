import 'package:flutter/material.dart';
import 'package:iot_console/Auth/singin.dart';
import 'package:iot_console/pages/tabs/dash.dart';
import 'package:iot_console/providers/app_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SwitchState(),
      child: MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StatusProvider>(
      create: (context)=> StatusProvider(),
      ),
      

      
       ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
    
        home:  SingIN(),
    
    
        theme: ThemeData(
    
            primarySwatch: Colors.green,
        ),
      ),
    );
  }
}
