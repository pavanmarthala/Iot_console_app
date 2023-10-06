// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iot_console/pages/settings.dart';

class Limits extends StatefulWidget {
  const Limits({super.key});

  @override
  State<Limits> createState() => _LimitsState();
}

class _LimitsState extends State<Limits> {
    final _minimumVoltageController = TextEditingController();
  final _maximumVoltageController = TextEditingController();
  final _minimumCurrentController = TextEditingController();
  final _maximumCurrentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,      
         title: const Text("Set Limits", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Device',
                style: Theme.of(context).textTheme.headline6,
              ),
              DropdownButton<String>(
                value: 'Device 1',
                items: const [
                  DropdownMenuItem(value: 'Device 1', child: Text('Device 1')),
                  DropdownMenuItem(value: 'Device 2', child: Text('Device 2')),
                  DropdownMenuItem(value: 'Device 3', child: Text('Device 3')),
                ],
                onChanged: (value) {},
                
              ),
              
              Container(
                       height: 1,
                       color: Colors.grey,
                     
             ),
             SizedBox(height: 20,),
              Text(
                'Minimum Voltage',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _minimumVoltageController,
                decoration: InputDecoration(
                  hintText: 'Enter minimum voltage',
                ),
              ),
             SizedBox(height: 20,),

              Text(
                'Maximum Voltage',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _maximumVoltageController,
                decoration: InputDecoration(
                  hintText: 'Enter maximum voltage',
                ),
              ),
             SizedBox(height: 20,),

              Text(
                'Minimum Current',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _minimumCurrentController,
                decoration: InputDecoration(
                  hintText: 'Enter minimum current',
                ),
              ),
             SizedBox(height: 20,),

              Text(
                'Maximum Current',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _maximumCurrentController,
                decoration: InputDecoration(
                  hintText: 'Enter maximum current',
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
                  child: Text('Save Device Limits',  style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    
  }
}