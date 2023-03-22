

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class NotificationService{
static  final FlutterLocalNotificationsPlugin _notificationsPlugin=FlutterLocalNotificationsPlugin();
static Future<void> initialize()async{
  NotificationSettings services=await  FirebaseMessaging.instance.requestPermission();
  if(services.authorizationStatus==AuthorizationStatus.authorized){


    print("background received");
  }
}

static void display(RemoteMessage message) async {
print("forbackgroundmessage");
  try {
    final id = DateTime.now().millisecondsSinceEpoch ~/1000;

    NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails(
          "YousufMobiles",
          "My  channel",
          importance: Importance.max,
          priority: Priority.high,
          showProgress: true
        )
    );


    await _notificationsPlugin.show(
      id,
      message.notification!.title,
      message.notification!.body,
      notificationDetails,
      //payload: message.data["route"],
    );
  } on Exception catch (e) {
    print(e);
  }
}


}