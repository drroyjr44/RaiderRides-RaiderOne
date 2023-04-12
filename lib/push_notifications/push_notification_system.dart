import 'package:driver_app/global/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
class PushNotificationSystem
{
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future initializeCloudMessaging() async
  {
    //1. Terminated
    // (When app is completely closed and opened directly from push notif)
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? remoteMessage)
    {
      if(remoteMessage != null)
        {
          // display ride request info - user info who request a ride
        }
    });

    //2. Foreground
    //(When app is open and it receives a push notif)
    FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage)
    {
    //display ride request information - user information who request a ride
    });

    //3. Background
    // (When app is in background and opened directly from push notif)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remoteMessage)
    {
      //display ride request information - user information who request a ride
    });
  }

  Future generateAndGetToken() async
  {
    String? registrationToken = await messaging.getToken();

    FirebaseDatabase.instance.ref()
        .child("drivers")
        .child(currentFirebaseUser!.uid)
        .child("token")
        .set(registrationToken);

    messaging.subscribeToTopic("allDrivers");
    messaging.subscribeToTopic("allUsers");


  }
}