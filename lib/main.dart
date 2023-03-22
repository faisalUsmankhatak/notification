import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notification/therdPage.dart';

import 'home_screen.dart';
import 'notificationServices.dart';
Future<void> backgroundHandler(RemoteMessage message)async{
  //NotificationService.display(message);
  print("backgroundHandler");
}
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  NotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        "homePage":(context)=>const Home(),
        "therdPage":(context)=>const TherdPage()
      },
      initialRoute: "homePage",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}




