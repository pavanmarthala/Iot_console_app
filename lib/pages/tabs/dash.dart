// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Dash extends StatefulWidget {
  const Dash({super.key});

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  bool isSwitched = false;
  var time = DateTime.now();
  DateTime motorSwitch = DateTime.now();
  DateTime motorStatus = DateTime.now(); 
  DateTime powerStatus = DateTime.now(); 

  @override
  Widget build(BuildContext context) {
        final switchState = Provider.of<SwitchState>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Row(
              children: [
                Text(
                  'Device No.1',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 150),
                     GestureDetector(
                        onTap: (){}, // Call handleRefresh when the icon is tapped
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
                  height: 180,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                            height: 70,
                            width: 370,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 192, 27, 16),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Text('Motor Switch',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                  ),
                                  SizedBox(width: 120,),
                                  Text(  switchState.isSwitched ? 'NO' : 'OFF',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
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
                                   
                                    onChanged: (value) {
                                      setState(() {
                                        switchState.toggleSwitch();
                                        isSwitched = value;
                                        motorSwitch = DateTime.now();

                                        
                                      });
                                    },
                                    activeTrackColor: Colors.green,
                                    activeColor: Colors.white,
                                    inactiveTrackColor: Colors.red,
                                    inactiveThumbColor: Colors.white, value: switchState.isSwitched, 
                                  ),
                                ),
                                SizedBox(width: 70),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Text(
                                    'Last On :${DateFormat('jms').format(motorSwitch)} ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
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
                  height: 180,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: 70,
                          width: 370,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 192, 27, 16),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Text(
                                  'Power Status',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(width: 120,),
                                Text(
                                  'on',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                'https://i.pinimg.com/564x/be/d9/bf/bed9bfa46f19c034ce8e50179011eefc.jpg',
                              ),
                            ),
                            SizedBox(width: 35,),
                            Text(
                              'Last On : ${DateFormat('jms').format(time)} ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
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
                  height: 180,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: 70,
                          width: 370,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 192, 27, 16),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Text(
                                  'Motor Status',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(width: 120,),
                                Text(
                                  'on',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                "https://img.freepik.com/premium-vector/water-pump-machine-icon-logo-vector-design-template_827767-2268.jpg",
                              ),
                            ),
                            SizedBox(width: 35,),
                            Text(
                              'Last On :${DateFormat('jms').format(time)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
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

class SwitchState extends ChangeNotifier {
  bool isSwitched = false;

  void toggleSwitch() {
    isSwitched = !isSwitched;
    notifyListeners();
  }
}
