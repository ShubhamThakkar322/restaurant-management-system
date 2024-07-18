import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:resapp/pages/intro_slider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //       options: const FirebaseOptions(
  //           apiKey: "AIzaSyD1IpDQawoICpNjPUaLTJD5tdhsPmX2Ibo",
  //           authDomain: "cuisineous-463c2.firebaseapp.com",
  //           projectId: "cuisineous-463c2",
  //           storageBucket: "cuisineous-463c2.appspot.com",
  //           messagingSenderId: "598872060160",
  //           appId: "1:598872060160:web:1a4dab03a0bb27ade043e5",
  //           measurementId: "G-YP340Y5RR2"));
  // } else {
  await Firebase.initializeApp();
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Urbanist',
        ),
        debugShowCheckedModeBanner: false,
        home: IntroSlider(),
      ),
    );
  }
}
