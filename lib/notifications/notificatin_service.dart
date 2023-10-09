import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class notifaction {
  FirebaseMessaging messaging =FirebaseMessaging.instance;
  void requestNotificationPermission()async{
     NotificationSettings settings =await messaging.requestPermission(
      alert: true,
      announcement: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,


     );
     if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print("user Granted Permission");
     }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      print("user Granted provisional Permission");
       
     }else{
      print("user denide Permission");

     }
  }

}