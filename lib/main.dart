import 'package:flutter/material.dart';
import 'authentication/login_signup_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.grey,
        backgroundColor: Color.fromRGBO(40, 40, 40, 1),
      ),
      home: new LoginSignUpPage()
    );
  }
}
