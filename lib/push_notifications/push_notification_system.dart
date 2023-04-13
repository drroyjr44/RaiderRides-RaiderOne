import 'package:driver_app/global/global.dart';
import 'package:driver_app/models/user_ride_request_information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PushNotificationSystem
{
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future initializeCloudMessaging() async
  {
    //1. Terminated
    // (When app is completely closed and opened directly from push notification)
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? remoteMessage)
    {
      if(remoteMessage != null)
        {
          // display ride request info - user info who request a ride
          readUserRideRequestInformation(remoteMessage.data["rideRequestId"]);
        }
    });

    //2. Foreground
    //(When app is open and it receives a push notifications)
    FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage)
    {
      //display ride request information - user information who request a ride
      readUserRideRequestInformation(remoteMessage!.data["rideRequestId"]);
    });

    //3. Background
    // (When app is in background and opened directly from push notifications)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remoteMessage)
    {
      //display ride request information - user information who request a ride
      readUserRideRequestInformation(remoteMessage!.data["rideRequestId"]);
    });
  }

  readUserRideRequestInformation(String userRideRequestId)
  {
    FirebaseDatabase.instance.ref()
        .child("All Ride Requests")
        .child(userRideRequestId)
        .once()
        .then((snapData)
    {
      if(snapData.snapshot.value != null)
      {
        double originLat = double.parse((snapData.snapshot.value! as Map)["origin"]["latitude"]);
        double originLng = double.parse((snapData.snapshot.value! as Map)["origin"]["longitude"]);
        String originAddress = (snapData.snapshot.value! as Map)["originAddress"];

        double destinationLat = double.parse((snapData.snapshot.value! as Map)["destination"]["latitude"]);
        double destinationLng = double.parse((snapData.snapshot.value! as Map)["destination"]["longitude"]);
        String destinationAddress = (snapData.snapshot.value! as Map)["destinationAddress"];

        String userName = (snapData.snapshot.value! as Map)["userName"];
        String userPhone = (snapData.snapshot.value! as Map)["userPhone"];

        UserRideRequestInformation userRideRequestDetails = UserRideRequestInformation();

        userRideRequestDetails.originLatLng = LatLng(originLat, originLng);
        userRideRequestDetails.originAddress = originAddress;

        userRideRequestDetails.destinationLatLng = LatLng(destinationLat, destinationLng);
        userRideRequestDetails.destinationAddress = destinationAddress;

        userRideRequestDetails.userName = userName;
        userRideRequestDetails.userPhone = userPhone;
      }
      else
      {
        Fluttertoast.showToast(msg: "This Ride Request Id does not exist");
      }
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