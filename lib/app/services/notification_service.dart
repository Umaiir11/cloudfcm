import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../appWidget.dart';

class NotificationService {
  static int id = 0;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initialize(BuildContext context, RemoteMessage message) async {
    await _configureLocalTimeZone();
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
        handleMessage(context, message);
        print('notification payload: ${notificationResponse.payload}');
      },
    );
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;

      if (kDebugMode) {
        print(' hi i am here  ${notification?.title}');
        print(' hi i am here  ${notification?.body}');
      }

      if (Platform.isIOS) {
        iosForeGroundMessage();
      }

      if (Platform.isAndroid) {
        initialize(context, message);
        showFcmNotifications(message);
      }
    });
  }

  //function  that show notifications

  Future<void> showFcmNotifications(RemoteMessage message) async {
    //channel settings
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        message.notification?.android?.channelId.toString() ?? "", message.notification?.android?.channelId.toString() ?? "",
        importance: Importance.high, playSound: true, showBadge: true);

    //android settings
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(channel.id.toString(), channel.name.toString(),
        channelDescription: 'your channel description',
        // sound: RawResourceAndroidNotificationSound('slow_spring_board'),
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        playSound: true,
        sound: channel.sound);

    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    Future.delayed(Duration.zero, () {
      flutterLocalNotificationsPlugin.show(id++, message.notification?.title.toString(), message.notification?.body.toString(), notificationDetails, payload: 'item x');
    });
  }

  //background and terminate state

  Future<void> bgAndTrSatate(BuildContext context) async {
    //backgroundState
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      handleMessage(context, message);
    });
    //terminate state
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null && message.data.isNotEmpty) {
        handleMessage(context, message);
      }
    });
  }

  //handler handle notifications

  Future<void> handleMessage(BuildContext context, RemoteMessage message) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => UiView()));
  }

  Future iosForeGroundMessage() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName!));
  }
//
// Future<void> showNotificationCustomSound() async {
//   const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
//     'your channel id',
//     'your channel name',
//     channelDescription: 'your channel description',
//     // sound: RawResourceAndroidNotificationSound('slow_spring_board'),
//     importance: Importance.max,
//     priority: Priority.high,
//     ticker: 'ticker',
//   );
//   const NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
//   await flutterLocalNotificationsPlugin.show(id++, 'Custom Sound Title', 'Custom Sound Body', notificationDetails, payload: 'item x');
// }
//
// Future<void> scheduleNotificationCustomSound() async {
//   await flutterLocalNotificationsPlugin.zonedSchedule(
//     id++,
//     'Scheduled Custom Sound Title',
//     'Scheduled Custom Sound Body',
//     tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
//     const NotificationDetails(
//       android: AndroidNotificationDetails(
//         'your channel id',
//         'your channel name',
//         channelDescription: 'your channel description',
//         // sound: RawResourceAndroidNotificationSound('slow_spring_board'),
//         importance: Importance.max,
//         priority: Priority.high,
//         ticker: 'ticker',
//       ),
//     ),
//     androidAllowWhileIdle: true,
//     uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime,
//   );
// }
//
}
