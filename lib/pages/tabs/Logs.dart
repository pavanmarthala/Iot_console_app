// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, unused_local_variable


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iot_console/pages/tabs/labels.dart/load.dart';
import 'package:iot_console/pages/tabs/labels.dart/motor.dart';
import 'package:iot_console/pages/tabs/labels.dart/power.dart';
import 'package:iot_console/providers/app_provider.dart';
import 'package:provider/provider.dart';

class Logs extends StatefulWidget {
  const Logs({super.key});
  

  @override
  State<Logs> createState() => _LogsState();
}

class _LogsState extends State<Logs>  
   with SingleTickerProviderStateMixin {
   
   

  late TabController tabController;
   DateTime _dateTime = DateTime.now();
  late String _formattedDate = DateFormat('yyyy/MM/dd').format(_dateTime);
  
    late Power powerTab;
    late Motor motorTab; // Create an instance of the Power tab
    late Load loadTab; // Create an instance of the Power tab
     // Create an instance of the Power tab

  // Method to pass data to the Power tab
  void updatePowerTabData(Map<String, dynamic> data) {
    tabController.index = 0; // Switch to the Power tab
    // Call the method onDataUpdated in the Power widget to pass data
    powerTab.onDataUpdated!(data);
  }

  void updateMotorTabData(Map<String, dynamic> data) {
    tabController.index = 1; // Switch to the Motor tab
    // Call the method onDataUpdated in the Motor widget to pass data
    motorTab.onDataUpdated(data);
  }

  void updateLoadTabData(Map<String, dynamic> data) {
    tabController.index = 2; // Switch to the Load tab
    // Call the method onDataUpdated in the Load widget to pass data
    loadTab.onDataUpdated(data);
  }
  @override
 void initState() {
   tabController = TabController(length: 3, vsync: this);
   super.initState();
   
 }
 @override
 void dispose(){
   tabController.dispose();
   super.dispose();

 }
//  DateTime _dateTime = DateTime.now();
//   String _formattedDate = '';
void _showDatePicker() {
  showDatePicker(
    context: context,
    initialDate: _dateTime,
    firstDate: DateTime(2021),
    lastDate: DateTime(2025),
  ).then((value) {
    if (value != null) {
      // Format the date to display only the date part
      final formattedDate = DateFormat('yyyy/MM/dd').format(value);
      
      setState(() {
        _dateTime = value;
        _formattedDate = formattedDate; // Store the formatted date
      });
    }
  });
}

// void passDataToLogs(Map<String, dynamic> data) {
//   // Pass the data to the Power tab widget
//   tabController.index = 0; // Switch to the Power tab
//   powerTab.onDataUpdated(data);
// }

  @override
  Widget build(BuildContext context) {
     final statusProvider = Provider.of<StatusProvider>(context);
    final statusData = statusProvider.statusData;
    return Container(
      color:Color.fromARGB(255, 247, 242, 242),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 30,top: 55),
    
              child: Row(
                children: [
                  Text(
                    'Device No.1',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                 
                  
                ],
              ),
            ),

                      Padding(
            padding: const EdgeInsets.only(left: 30,top: 40),

            child: Row(
              children: [
                Text(
                  'Log Date',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 150),
               
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextButton(
                     onPressed: _showDatePicker,
                             child: Text(
                             _formattedDate,
                              
                            style: TextStyle(
                             color: Colors.black, // Change the text color as needed
                          fontSize: 18, // Adjust the text size as needed
                           ),
                             ),
                          ),                                                                    
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.only(left: 15,right: 20),
            child: Container(
              //  height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 180, 179, 179),
                borderRadius: BorderRadius.circular(5)
                ),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(5),
                  child: TabBar(
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.white,
                    indicatorColor: Colors.black38,
                    // indicatorWeight: 3,
                    indicator: BoxDecoration(
                      color: Color.fromARGB(181, 51, 42, 55),
                      borderRadius: BorderRadius.circular(5)
                      
                      ),
                    controller: tabController,
                     tabs: [
                          Tab( child: Text( 'Power',  style: TextStyle(fontSize: 20, ), ), ),
                          Tab( child: Text( 'Motor',  style: TextStyle(fontSize: 20, ), ), ),
                          Tab( child: Text( 'Load',  style: TextStyle(fontSize: 20, ), ), ),
                           ],
                    ),)
                ],
              ),
            ),
          ),
            Expanded(child: TabBarView(
              controller: tabController,
              children: [
              Power(onDataUpdated: updatePowerTabData),
              Motor(onDataUpdated: updateMotorTabData),
              Load(onDataUpdated: updateLoadTabData),
            ]) ,)

        ],
      ),
    );
  }
}