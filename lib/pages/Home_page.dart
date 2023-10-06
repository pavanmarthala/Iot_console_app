// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iot_console/pages/Drawer.dart';
import 'package:iot_console/pages/settings.dart';
import 'package:iot_console/pages/tabs/Logs.dart';
import 'package:iot_console/pages/tabs/status.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int index =0;
   final screens = [

   Status(onDataUpdated: (Map<String, dynamic> data) {  },),
     Logs(),


   
   ];

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
       backgroundColor: const Color(0xffcbcbcb),
       drawer: MyDrawer(),
       appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
         title: const Text("Dashboard", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),),
         actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 30.0),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.green,
              child: IconButton(onPressed: () { Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>Settings(),),); }, icon: Icon(Icons.settings, size: 30,color: Colors.black,)),
            ),
          ),
         ],
       ),
       body: screens[index],
       bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade100,
          labelTextStyle: MaterialStateProperty.all(TextStyle(fontSize: 14,fontWeight: FontWeight.w500))
        ),
         child: NavigationBar(
          height: 60,
          backgroundColor:Colors.green ,
          selectedIndex: index,
          onDestinationSelected: (index) => 
          setState(() => this.index = index),

          destinations: [
          NavigationDestination(
            icon:Icon(Icons.signal_cellular_alt_outlined, ),
            // selectedIcon:Icon(Icons.signal_cellular_alt_outlined, ) ,
             label:'status'),
       
               NavigationDestination(
            icon:Icon(Icons.format_list_bulleted),
             label:'Logs')
         ]),
       ),
      
    );
  }
}


