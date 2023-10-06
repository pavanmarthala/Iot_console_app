import 'package:flutter/material.dart';
import 'package:iot_console/pages/Home_page.dart';
import 'package:iot_console/providers/app_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
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
    
        home: const Homepage(),
    
    
        theme: ThemeData(
    
            primarySwatch: Colors.green,
        ),
      ),
    );
  }
}
