import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';

import '../models/user_model.dart';

final FirebaseAuth fAuth = FirebaseAuth.instance; //remembers last known user logged in, "app instance"
User? currentFirebaseUser;
UserModel? userModelCurrentInfo;
StreamSubscription<Position>? streamSubscriptionPosition;