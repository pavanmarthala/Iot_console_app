// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, no_leading_underscores_for_local_identifiers


import 'package:flutter/material.dart';

class data extends StatefulWidget {
  const data({super.key});

 

  @override
  State<data> createState() => _dataState();
  
  // void onDeviceAdded(String deviceName) {}
}

class _dataState extends State<data> {
  @override
  Widget build(BuildContext context) {
     final _deviceController = TextEditingController();
  final _devicenameController = TextEditingController();
  final _pinController = TextEditingController();
  final _simController = TextEditingController();
  final _topiccontroller = TextEditingController();
  final _zonecontroller = TextEditingController();
  final _serialNocontroller = TextEditingController();
  final _mobileNocontroller = TextEditingController();




  
     return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,      
         title: const Text("Add Device", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              
            
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
             SizedBox(height: 20,),

              Text(
                'Device Name',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _devicenameController,
                decoration: InputDecoration(
                  hintText: 'Enter Device Name',
                ),
              ),
             SizedBox(height: 20,),

              Text(
                'PIN',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _pinController,
                decoration: InputDecoration(
                  hintText: 'Enter Device Pin',
                ),
              ),
             SizedBox(height: 20,),

              Text(
                'sim',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _simController,
                decoration: InputDecoration(
                  hintText: 'Enter device sim',
                ),
              ),
              SizedBox(height: 20,),

              Text(
                'topic',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _topiccontroller,
                decoration: InputDecoration(
                  hintText: 'Enter topic',
                ),
              ),
              SizedBox(height: 20,),

              Text(
                'zone',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _zonecontroller,
                decoration: InputDecoration(
                  hintText: 'Enter zone',
                ),
              ),
              SizedBox(height: 20,),

              Text(
                'Device  serial Number',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _serialNocontroller,
                decoration: InputDecoration(
                  hintText: 'Enter mobile serial number',
                ),
              ),
              SizedBox(height: 20,),

              Text(
                'Mobile Number',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _mobileNocontroller,
                decoration: InputDecoration(
                  hintText: 'Enter Mobile Number',
                ),
              ),
             SizedBox(height: 90,),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                           // Navigator.pop(context); // Close the dialog
                      },
                    style: ElevatedButton.styleFrom(
                       primary: Colors.green, // Change the button's background color
                       fixedSize: Size(500, 50), // Increase the button's size
  ),
                  child: Text('Add Device',  style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  
}


}
