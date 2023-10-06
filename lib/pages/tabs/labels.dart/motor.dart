// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Motor extends StatefulWidget {
  late final void Function(Map<String, dynamic>) onDataUpdated; // Add this line

   Motor({Key? key, required this.onDataUpdated}): super(key: key);
  @override
  State<Motor> createState() => _PowerState();
}

class _PowerState extends State<Motor> {
    bool isRefreshing = false;

   void handleRefresh() {
    setState(() {
      isRefreshing = true;
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          isRefreshing = false;
        });
      });
    });
  }
    void updateData(Map<String, dynamic> data) {
  // Update the data in the Power tab
  // Extract the ON, OFF, duration, and total duration data from 'data' and update your UI accordingly.
}
  @override
  Widget build(BuildContext context) {
      var list = [
         {'on':"01:02:13",'off':'04:48:54','duration':'03:43:04'},
         {'on':"01:02:13",'off':'04:48:54','duration':'03:43:04'},
         {'on':"01:02:13",'off':'04:48:54','duration':'03:43:04'},
         {'on':"01:02:13",'off':'04:48:54','duration':'03:43:04'},
      ];
    return Column(
      children: [
        SizedBox(height: 30,),
      Padding(
        padding: const EdgeInsets.only(left: 40,right: 40),
        child: Row(
          children: [

            SizedBox(width: 170,),
            Text('Refresh Logs',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            SizedBox(width: 5),
                  isRefreshing
                   ? CircularProgressIndicator()
                  : GestureDetector(
                    onTap: handleRefresh,
                    child: Icon(
                      Icons.refresh_sharp,
                      size: 35,
                      color: Color.fromARGB(255, 13, 13, 13),
                    ),
                  ),
               ],
             ),
           ),
           SizedBox(height: 10,),
                 Padding(
                   padding: const EdgeInsets.only(left: 26),
                   child: Row(
                       children: [
                         Container(
                           height: 50,
                           width: 90, // Adjust the height as needed for the first row
                           color: Color.fromARGB(181, 51, 42, 55), // Background color for the first row
                           child: Center(child: Text("ON", style: TextStyle(color: Colors.white,fontSize: 20,))),
                         ),
                         Container(
                           height: 50,
                           width: 135, // Adjust the height as needed for the first row
                            // Adjust the height as needed for the first row
                           color: Color.fromARGB(181, 51, 42, 55),
                           child: Center(child: Padding(
                             padding: const EdgeInsets.only(left: 30),
                             child: Text("OFF", style: TextStyle(color: Colors.white,fontSize: 20,)),
                           )),
                         ),
                        //  SizedBox(width: 10,),
                         Container(
                           height: 50,
                           width: 135, // Adjust the height as needed for the first row
                            // Adjust the height as needed for the first row
                           color: Color.fromARGB(181, 51, 42, 55),
                           child: Center(child: Text("Duration", style: TextStyle(color: Colors.white,fontSize: 20,))),
                         ),
                       ],
                     ),
                 ),
                 SizedBox(height: 10,),
              Table(
                   border: TableBorder(
                horizontalInside: BorderSide(color: Colors.grey), // Border for horizontal lines inside cells
                // verticalInside: BorderSide(color: Colors.black),   // Border for vertical lines inside cells
                bottom: BorderSide(color: Colors.grey),           // Border for the bottom of the table
              ),
                  columnWidths: {
                    0: FixedColumnWidth(120),
                    1: FixedColumnWidth(120),
                    2: FixedColumnWidth(120),
                    
                  },
                  children: [
                    for (var item in list)
                
                TableRow(children: [
                  SizedBox(
                     height: 30,
                    child: Center(child: Text(item['on']!))
                    ),
                  SizedBox(
                     height: 30,
                          
                    child: Center(child: Text(item['off']!))),
                  SizedBox(
                    
                     height: 30,
                    child: Center(child: Text(item['duration']!))),
                ]),
                
                  ],
                ),
    
                    SizedBox(height: 20,),
                    Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40),
                  child: Row(
                  children: [
                    SizedBox(width: 110,),
                   Text('Total Duration : 00:00:00',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    
                 ],
               ),
             ),

      ],
    );
  }
}