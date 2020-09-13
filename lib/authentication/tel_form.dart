import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'enter_code_form.dart';

class TelForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _TelFormState();
}

class _TelFormState extends State<TelForm> {
  TextEditingController phoneNumberController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void signIn() async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumberController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = '123456';

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId,
            smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(phoneAuthCredential);
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
  }

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
            child: Column(
              children: [
                SizedBox(height: 30.0),
                TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white
                  ),
                  validator: (value) => value.isEmpty ? "Retart" : null,
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
                SizedBox(height: 30.0),
                RaisedButton(
                  shape: StadiumBorder(),
                  padding: EdgeInsets.all(10.0),
                  child: Text("Next"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    signIn();
                    Navigator.push(context,MaterialPageRoute(
                        builder:(context) => CodeForm()));
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}