// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:iot_console/pages/Drawer/Add_user.dart';
import 'package:iot_console/pages/Drawer/map_device.dart';
import 'package:iot_console/pages/Home_page.dart';
import 'package:iot_console/pages/Drawer/add_device.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  // const MyDrawer({super.key});
 
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List<String> deviceList = [];

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Drawer(
         backgroundColor: Colors.white,
    
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                        
                  height: 180,
                  width: 60,
                   decoration: BoxDecoration(color: Colors.white,),
                    child: Image.network('https://i.imgur.com/GzZgRzZ.png',),
            
              ),
            ),
            // SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.pop(context);
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Adduser(),),);

                },
                
                child: Row(
                  children: [
                     SizedBox(width: 60),
    
                     Icon(Icons.person_add,color: Colors.green),
                     SizedBox(width: 8),
                    Text('Add User',style: TextStyle(color: Colors.green),),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white.withOpacity(0.9),
                  onPrimary: Colors.black,
                  fixedSize: Size(150, 60),
                side: BorderSide(
                 color: Colors.green,
                 width:2,
                 style: BorderStyle.solid,
               ),
               shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                 ),
              ),
              ),
            ),
    
            SizedBox(height: 15,),
    
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: ElevatedButton(
                onPressed: () {
                                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Mapdevice(),),);

                },
                child: Row(
                  children: [
                     SizedBox(width: 60),
    
                    //  Icon(Icons.person_add,color: Colors.green),
                     SizedBox(width: 8),
                    Text('Map Device',style: TextStyle(color: Colors.green),),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  fixedSize: Size(150, 60),
                side: BorderSide(
                 color: Colors.green,
                 width:2,
                 style: BorderStyle.solid,
               ),
               shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                 ),
              ),
              ),
            ),
    
            SizedBox(height: 15,),
    
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: ElevatedButton(
                onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Homepage(),),);
    
                },
                child: Row(
                  children: [
                    Text('Device No: 1',style: TextStyle(color: const Color.fromARGB(255, 195, 51, 41),fontSize: 15),),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(223, 240, 200, 200),
                  fixedSize: Size(70, 60),
                side: BorderSide(
                 color: Color.fromARGB(255, 218, 117, 110),
                 width:2,
                 style: BorderStyle.solid,
               ),
               shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                 ),
              ),
              ),
            ),
    

            
    
            SizedBox(height: 105,),
    
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: ElevatedButton(
                onPressed: () {
                                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>data()));
                  
                },
                child: Row(
                  children: [
                    SizedBox(width: 60),
    
                     Icon(Icons.add,color: Colors.white),
                     SizedBox(width: 8),
                    Text('Add Devices',style: TextStyle(color: Colors.white),),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  fixedSize: Size(150, 60),
                side: BorderSide(
                 color: Colors.green,
                 width:2,
                 style: BorderStyle.solid,
               ),
               shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                 ),
              ),
              ),
            ),
            // Dynamically generate device buttons
            
          ],
        ),
      ),
    );
  }
}





