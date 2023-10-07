// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iot_console/pages/settings.dart';

class Mapdevice extends StatefulWidget {
  const Mapdevice({super.key});


  @override
  State<Mapdevice> createState() => _LimitsState();
}

class _LimitsState extends State<Mapdevice> {
    final _userController = TextEditingController();
  final _deviceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,      
         title: const Text("Map user to Device", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
            
             
             SizedBox(height: 20,),
              Text(
                'User Id',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _userController,
                decoration: InputDecoration(
                  hintText: 'Enter user id',
                ),
              ),
             SizedBox(height: 20,),

              Text(
                'Device Id',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _deviceController,
                decoration: InputDecoration(
                  hintText: 'Enter device id',
                ),
              ),
             
             SizedBox(height: 90,),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Settings(),),);

                  },
                    style: ElevatedButton.styleFrom(
                       primary: Colors.green, // Change the button's background color
                       fixedSize: Size(500, 50), // Increase the button's size
  ),
                  child: Text('Map user to Device',  style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    
  }
}