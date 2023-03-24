import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth fAuth = FirebaseAuth.instance; //remembers last known user logged in, "app instance"
User? currentFirebaseUser;