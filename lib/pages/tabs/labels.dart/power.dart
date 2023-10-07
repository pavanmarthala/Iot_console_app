// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:iot_console/providers/json.dart';

class Power extends StatefulWidget {
  
  @override
  State<Power> createState() => _PowerState();
}

class _PowerState extends State<Power> {
late Future<List<Photo>> futurePhotos;
  List<Photo> photos = [];
    bool isRefreshing = false;

 @override
  void initState() {
    super.initState();
    futurePhotos = fetchData();
  }

  Future<List<Photo>> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Photo.fromJson(json)).toList();
      
    } else {
      throw Exception('Failed to load data');
    }
  }

 

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
//   void updateData(Map<String, dynamic> data) {
//   // Update the data in the Power tab
//   // Extract the ON, OFF, duration, and total duration data from 'data' and update your UI accordingly.
// }

  @override
  Widget build(BuildContext context) {
    // var list = [
    //      {'on':"01:02:13",'off':'04:48:54','duration':'03:43:04'},
    //      {'on':"01:02:13",'off':'04:48:54','duration':'03:43:04'},
    //      {'on':"01:02:13",'off':'04:48:54','duration':'03:43:04'},
    //      {'on':"01:02:13",'off':'04:48:54','duration':'03:43:04'},
    //      {'on':"01:02:13",'off':'04:48:54','duration':'03:43:04'},
    //      {'on':"01:02:13",'off':'04:48:54','duration':'03:43:04'},
    //      {'on':"01:02:13",'off':'04:48:54','duration':'03:43:04'},
    //      {'on':"01:02:13",'off':'04:48:54','duration':'03:43:04'},
    //      {'on':"01:02:13",'off':'04:48:54','duration':'03:43:04'},
    //      {'on':"01:02:13",'off':'04:48:54','duration':'03:43:04'},
    //      {'on':"01:02:13",'off':'04:48:54','duration':'03:43:04'},

    // ];
       return SingleChildScrollView(
                   scrollDirection: Axis.vertical, 


      child: Column(
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
                 
              FutureBuilder<List<Photo>>(
            future: futurePhotos,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<Photo> photos = snapshot.data ?? [];
                return Table(
                  border: TableBorder(
                    horizontalInside: BorderSide(color: Colors.grey),
                    bottom: BorderSide(color: Colors.grey),
                  ),
                  columnWidths: {
                    0: FixedColumnWidth(120),
                    1: FixedColumnWidth(120),
                    2: FixedColumnWidth(120),
                  },
                  children: [
                    for (var photo in photos)
                      TableRow(children: [
                        SizedBox(
                            height: 30,
                            child: Center(child: Text(photo.id.toString()))),
                        SizedBox(
                            height: 30,
                            child: Center(
                                child: Text(photo.albumId.toString()))),
                        SizedBox(
                            height: 30,
                            child: Center(child: Text(photo.id.toString()))),
                      ]),
                  ],
                );
              }
            },
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
      ),
    );
  }
}