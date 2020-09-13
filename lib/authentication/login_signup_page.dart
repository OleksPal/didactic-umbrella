import 'package:flutter/material.dart';
import 'tel_form.dart';

class LoginSignUpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 40, 40, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset("assets/kopa-rp.png",
              alignment: Alignment.topLeft,
              fit: BoxFit.fill),
          Container(
            height: 100,
            alignment: Alignment.center,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Color.fromRGBO(60, 60, 60, 1)
            ),
            child: Text("Вхід",
              style: TextStyle(
                color: Colors.white,
                fontSize: 34.0,
              ),
            ),
          ),
          SizedBox(height: 80.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(
                      builder:(context) => TelForm()));
                },
                colorBrightness: Brightness.light,
                color: Colors.green,
                shape: CircleBorder(),
                padding: EdgeInsets.all(20.0),
                child: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 20.0,),
              RaisedButton(
                onPressed: () {},
                colorBrightness: Brightness.light,
                color: Colors.blue,
                shape: CircleBorder(),
                padding: EdgeInsets.all(20.0),
                child: Image.asset("assets/facebook.png")
              ),
              SizedBox(width: 20.0,),
              RaisedButton(
                onPressed: () {},
                colorBrightness: Brightness.light,
                color: Colors.red,
                shape: CircleBorder(),
                padding: EdgeInsets.all(20.0),
                child: Image.asset("assets/google.png")
              )
            ],
          ),
          SizedBox(height: 50.0,)
        ],
      ),
    );
  }
}