import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_auth/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Sign In demo',
      theme: ThemeData.dark(),
      home: LoginScreen(),
    );
  }
}
