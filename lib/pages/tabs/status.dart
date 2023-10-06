// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iot_console/mock api/mock_api.dart';
import 'package:iot_console/models/Status_model.dart';
import 'package:iot_console/providers/app_provider.dart';
import 'package:provider/provider.dart';

class Status extends StatefulWidget {
   final Function(Map<String, dynamic> data)? onDataUpdated;
   final _pageStorageKey = PageStorageKey('Status');

   Status({required this.onDataUpdated, Key? key}) : super(key: key);
  @override
  State<Status> createState() => _StatusState();
}


class _StatusState extends State<Status> {
  
  bool isSwitched = false;

  var time = DateTime.now();

  bool isRefreshing = false;
  Map<String, dynamic> statusData = {}; 

  
  
  void handleRefresh() async {
    setState(() {
      isRefreshing = true;
    });

    final data = await MockApi.getStatusData(isSwitched); // Fetch mock data
     final statusProvider = Provider.of<StatusProvider>(context, listen: false);
    statusProvider.updateStatus(Statusmodel(
      powerStatus: data['powerStatus'] ?? 'OFF',
      motorStatus: data['motorStatus'] ?? 'OFF',
      motorSwitch: data['motorSwitch'] ?? false,
    ));
    updatePowerData(data);
    setState(() {
      statusData = data;
      isRefreshing = false;
    });
  }
  void updatePowerData(Map<String, dynamic> data) {
  // Pass the data to the Logs widget
  widget.onDataUpdated?.call(data);
}

 

  @override
  Widget build(BuildContext context) {
     String powerStatus = statusData['powerStatus'] ?? 'OFF';
    String motorStatus = statusData['motorStatus'] ?? 'OFF';
    bool motorSwitch = statusData['motorSwitch'] ?? false;


    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30,top: 20),

            child: Row(
              children: [
                Text(
                  'Device No.1',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 150),
                isRefreshing
                 ? CircularProgressIndicator()
                : GestureDetector(
                  onTap: handleRefresh, // Call handleRefresh when the icon is tapped
                  child: Icon(
                    Icons.refresh_sharp,
                    size: 35,
                    color: Color.fromARGB(255, 13, 13, 13),
                  ),
                ),
                
              ],
            ),
          ),
          SizedBox(height: 25,),

          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Container(
                  height:180 ,
                  width: 370,
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius:BorderRadius.circular(30),
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                            height: 70,
                            width: 370,
                            decoration: BoxDecoration(
                              color:Color.fromARGB(255, 192, 27, 16),
                              borderRadius:BorderRadius.only(topRight:Radius.circular(30),topLeft: Radius.circular(30)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child:
                              Row(
                                children: [
                                  Text('Motor Switch', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                                  SizedBox(width: 120,),
                                  Text(motorSwitch ? 'ON' : 'OFF',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
                                ],
                              ),

                            )
                        ),
                      ),

                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [


                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Switch(
                                    key: widget._pageStorageKey,
                                    value: isSwitched,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched = value;
                                        time = DateTime.now();
                                      });

                                      handleRefresh();

                                    },
                                    activeTrackColor: Colors.green,
                                    activeColor: Colors.white,
                                    inactiveTrackColor: Colors.red,
                                    inactiveThumbColor: Colors.white,
                                  ),
                                
                                ),
                                SizedBox(width: 70),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Text(
                                    'Last On : ${DateFormat('jms').format(time)}',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )

                    ],
                  ) ,


                ),
              ],
            ),
          ),
         SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Container(
                  height:180 ,
                   width: 370,
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius:BorderRadius.circular(30),
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: 70,
                          width: 370,
                         decoration: BoxDecoration(
                            color:Color.fromARGB(255, 192, 27, 16),
                            borderRadius:BorderRadius.only(topRight:Radius.circular(30),topLeft: Radius.circular(30)),
                            ),
                            child: Padding(
                            padding: const EdgeInsets.all(20),
                            child:
                           Row(
                         children: [
                           Text('Power Status', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                           SizedBox(width: 120,),
                           Text('$powerStatus',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
                         ],
                        ),
                                        
                       )
                        ),
                      ),
                      Expanded(
                        
                        flex: 2,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network('https://i.pinimg.com/564x/be/d9/bf/bed9bfa46f19c034ce8e50179011eefc.jpg',
                              // height: 50,
                              ),
                             
                            ),
                             SizedBox(width: 35,),
                              Text('Last On : ${DateFormat('jms').format(time)}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                          ],
                        ))
                    ],
                  ) ,
                  
                
                ),
              ],
            ),
          ),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Container(
                  height:180 ,
                   width: 370,
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius:BorderRadius.circular(30),
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: 70,
                          width: 370,
                         decoration: BoxDecoration(
                            color:Color.fromARGB(255, 192, 27, 16),
                            borderRadius:BorderRadius.only(topRight:Radius.circular(30),topLeft: Radius.circular(30)),
                            ),
                            child: Padding(
                            padding: const EdgeInsets.all(20),
                            child:
                           Row(
                         children: [
                           Text('Motor Status', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                           SizedBox(width: 120,),
                           Text('$motorStatus',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
                         ],
                        ),
                                        
                       )
                        ),
                      ),
                      Expanded(
                        
                        flex: 2,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network("https://img.freepik.com/premium-vector/water-pump-machine-icon-logo-vector-design-template_827767-2268.jpg",),
                             
                            ),
                             SizedBox(width: 35,),
                              Text('Last On : ${DateFormat('jms').format(time)}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                          ],
                        ))
                    ],
                  ) ,
                  
                
                ),
              ],
            ),
          ),
          SizedBox(height: 25,),

    
    
        ],
      ),
    );
  }
}
