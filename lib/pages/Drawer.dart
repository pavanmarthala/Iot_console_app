// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:iot_console/pages/Home_page.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
       backgroundColor: Colors.white,

      child: ListView(
        children: [
          
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'THEJA TECHNOLOGIES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Device that Thinks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);
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
                Navigator.pop(context);
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
            padding: const EdgeInsets.only(left: 35,right: 35),
            child: ElevatedButton(
              onPressed: () {

              },
              child: Row(
                children: [
                  Text('Device No:0',style: TextStyle(color: Color.fromARGB(255, 90, 88, 88)),),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(223, 228, 228, 228),
                fixedSize: Size(150, 60),
              side: BorderSide(
               color: Color.fromARGB(255, 178, 178, 178),
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
            padding: const EdgeInsets.only(left: 35,right: 35),
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

          SizedBox(height: 15,),

          Padding(
            padding: const EdgeInsets.only(left: 35,right: 35),
            child: ElevatedButton(
              onPressed: () {
                //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Homepage(),),);

              },
              child: Row(
                children: [
                  Text('Device No: 2',style: TextStyle(color: Color.fromARGB(255, 90, 88, 88),fontSize: 15),),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(223, 228, 228, 228),
                fixedSize: Size(70, 60),
              side: BorderSide(
               color: Color.fromARGB(255, 178, 178, 178),
               width:2,
               style: BorderStyle.solid,
             ),
             shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
               ),
            ),
            ),
          ),

          SizedBox(height: 155,),

          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
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
        ],
      ),
    );
  }
}
