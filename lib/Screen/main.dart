import 'package:flutter/material.dart';
import 'package:login_sign_up/Screen/ui/Dashboard/dashboard.dart';
import 'package:login_sign_up/Screen/ui/login/Welcome.dart';
import '../firebase_options.dart';
import 'ui/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);


  final auth = FirebaseAuth.instance;
  User? user;

  @override
  Widget build(BuildContext context) {
    user = auth.currentUser;
    if(user == null){
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Welcome(),
      );
    }else{
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DashBoard(),
      );
    }
    //MaterialApp
  }
}

// com.JvWorld.login_sign_up