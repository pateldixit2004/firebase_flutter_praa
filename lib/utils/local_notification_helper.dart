import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Notifactionhelper
{
  static final notification=Notifactionhelper._();
  Notifactionhelper._();
  
  FlutterLocalNotificationsPlugin notificationsPlugin=FlutterLocalNotificationsPlugin();
  
  Future<void> intiltionNoti()
  async {
    AndroidInitializationSettings androidInt=AndroidInitializationSettings('logo');
    DarwinInitializationSettings iosInt=DarwinInitializationSettings();
    InitializationSettings initializationSettings=InitializationSettings(android: androidInt,iOS: iosInt);
    tz.initializeTimeZones();
    await notificationsPlugin.initialize(initializationSettings);
  }

  void showSimpleNotifiction()
  {
    AndroidNotificationDetails androidShow=AndroidNotificationDetails('1', 'simple');
    DarwinNotificationDetails iosShow=DarwinNotificationDetails();
    NotificationDetails notificationDetails=NotificationDetails(android: androidShow,iOS: iosShow);
    notificationsPlugin.show(1,"Succes", "Add Product", notificationDetails);

  }


  void timerNoti()
  {
    AndroidNotificationDetails androidNoti=AndroidNotificationDetails("2", "Timer",priority: Priority.high,importance: Importance.max);
    DarwinNotificationDetails iosNoti=DarwinNotificationDetails();
    NotificationDetails notificationDetails=NotificationDetails(android: androidNoti,iOS: iosNoti);
    notificationsPlugin.zonedSchedule(2, "Time Testing", "Flutter", tz.TZDateTime.now(tz.local).add(Duration(seconds: 4)), notificationDetails, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
  }

  //======================= fire message=====

Future<void> initMessage()
async {
  final fcmToken=await FirebaseMessaging.instance.getToken();
  print("Token     ===${fcmToken}");
  FirebaseMessaging.onMessage.listen((msg) {
    var notifi= msg.notification;

    if(notifi!=null)
      {
        var title= notifi.title;
        var body= notifi.body;
        Notifactionhelper.notification.showFireSimpleNotifiction(title,body);
      }
  });
}

  void showFireSimpleNotifiction(title,body)
  {
    AndroidNotificationDetails androidShow=AndroidNotificationDetails('4', 'simple');
    DarwinNotificationDetails iosShow=DarwinNotificationDetails();
    NotificationDetails notificationDetails=NotificationDetails(android: androidShow,iOS: iosShow);
    notificationsPlugin.show(1,"$title", "$body", notificationDetails);

  }

}