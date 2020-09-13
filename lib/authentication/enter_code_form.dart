import 'package:flutter/material.dart';
import 'package:flutterapplogin/main_menu.dart';

class CodeForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _CodeFormState();
}

class _CodeFormState extends State<CodeForm> {
  final GlobalKey<_CodeFormState> _formKey = GlobalKey<_CodeFormState>();
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 40, 40, 1),
      body: ListView(
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
          Form(
            key: _formKey,
            child: TextFormField(
              controller: codeController,
              keyboardType: TextInputType.numberWithOptions(
                  decimal: true
              ),
              style: TextStyle(
                color: Colors.grey,
              ),
              validator: (input) {
                if(input.isEmpty)
                  return "Enter your number";
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  borderSide: BorderSide(width: 1,color: Colors.grey),
                ),
              ),
            ),
          ),
          RaisedButton(
            textColor: Colors.white,
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 80.0
              ),
              child: Text("Далі"),
            ),
            shape: StadiumBorder(),
            onPressed: () {
              if(codeController.text.isEmpty || codeController.text.length != 6)
                return null;
              else
                Navigator.push(context,MaterialPageRoute(
                    builder:(context) => MainMenu()));
            },
          )
        ],
      ),
    );
  }
}