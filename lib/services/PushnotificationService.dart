

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';


Future<void> backgroundHandler(RemoteMessage message) async {

    if (kDebugMode) {
      print('Title: ${message.notification?.title}');
    }
    if (kDebugMode) {
      print('body: ${message.notification?.body}');
    }
    if (kDebugMode) {
      print('payload: ${message.data}');
    }

}
class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  // Future initialize() async {
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     if (kDebugMode) {
  //       print('Got a message whilst in the foreground!');
  //     }
  //     if (kDebugMode) {
  //       print('Message data: ${message.data}');
  //     }
  //
  //     if (message.notification != null) {
  //       if (kDebugMode) {
  //         print('Message also contained a notification: ${message.notification}');
  //       }
  //     }
  //   });
  //   FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  // }
  //
  //
  //
  // Future<String?> getToken() async {
  //   String? token = await _fcm.getToken();
  //   print('Token: $token');
  //   return token;
  // }

   Future<void> initNotification() async{
    await _fcm.requestPermission();
    final fcmtoken = await _fcm.getToken();
    if (kDebugMode) {
      print('Token $fcmtoken');
    }
 }

}