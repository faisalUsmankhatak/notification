import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification/therdPage.dart';
import 'package:share_plus/share_plus.dart';
import 'fourth.dart';
import 'notificationServices.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //FirebaseMessaging messaging=FirebaseMessaging.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then((value) => {

      if(value!=null){
Navigator.push(context, MaterialPageRoute(builder: (context)=>const Fourth()))}
    });
    FirebaseMessaging.onMessage.listen((event) {
      print("oooooooooooooook");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(event.notification!.title!)),
      );
      // if(event.notification!=null){
      //   NotificationService.display(event);
      // }
      // else{
      //   print("empty");
      // }

      //print("message received ${event.notification!.title!}");
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print("onmessageopendedapp");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const TherdPage()));
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children:  [
             TextButton(onPressed: ()async{
               String url="https://testdomains.page.link/downlods";
              await Share.share(url);
              Navigator.push(context, MaterialPageRoute(builder: ( context)=>const TherdPage()));
             }, child: const Text("Click here")),
            ],
          ),
        ),
      ),
    );
  }
}
