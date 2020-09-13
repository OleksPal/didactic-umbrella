import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: Color.fromRGBO(40, 40, 40, 1),
          body: Center(
          )
      ),
    );
  }
}