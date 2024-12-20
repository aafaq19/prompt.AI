import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gemini_chat_app_tutorial/pages/demo_folder/demofirebase.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AuthPage(),
    );
  }
}
