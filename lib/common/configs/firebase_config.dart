import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import '../../firebase_options.dart';
import 'default_environment.dart';

@singleton
class FirebaseConfig {
  late FirebaseApp app;
  late DocumentReference userDoc;
  late Reference userStorage;
  late FirebaseAuth auth;
  late final GoogleSignIn googleSignIn;
  late final FacebookAuth facebookAuth;

  @postConstruct
  init() async {
    app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    userDoc = FirebaseFirestore.instance
        .collection(DefaultEnvironment.environmentHome)
        .doc(DefaultEnvironment.environment);
    userStorage = FirebaseStorage.instance
        .ref(DefaultEnvironment.environmentHome)
        .child(DefaultEnvironment.environment);
    auth = FirebaseAuth.instance;
    googleSignIn = GoogleSignIn();
    facebookAuth = FacebookAuth.i;
  }
}
