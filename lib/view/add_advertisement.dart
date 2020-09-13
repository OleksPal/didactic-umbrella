import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class AddAdvertisement extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _AddAdvertisementState();
}

class _AddAdvertisementState extends State<AddAdvertisement> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController materialController = TextEditingController();

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(40, 40, 40, 1),
        body: Container(
          padding: EdgeInsets.all(15.0),
          //width: MediaQuery.of(context).size.width-20,
          child: ListView(
            //physics: BouncingScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: [
                  FlatButton(
                    child: Icon(Icons.arrow_back_ios,
                      color: Colors.white,),
                    onPressed: () {Navigator.push(context,MaterialPageRoute(
                        builder:(context) => MainMenu()));},
                  ),
                  FlatButton(
                    child: Text("Зберегти",
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 16.0
                      ),),
                    onPressed: () {
                      if(priceController.text == null || priceController.text == "" ||
                          descriptionController.text == null || descriptionController.text == ""){
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Заполните все поля"),
                          backgroundColor: Colors.grey,)); }
                      else{
                        FirebaseFirestore.instance.collection("items").add({
                          "producer" : modelController.text,
                          "url" : "https://lh3.googleusercontent.com/proxy/q7leUMWI_12gmSB3pvM1yhHTp8FCKon2bBantlpVjY8kbe9XMKyovp6YtjcMv1Rez5LUMjK4E7CAyxcRFwAhtmKyocGm237AViQAYZySB3_T8g",
                          "size" : sizeController.text,
                          "favourite" : false,
                          "description" : descriptionController.text,
                          "price" : priceController.text,
                          "length" : lengthController.text,
                          "width" : widthController.text,
                          "material" : materialController.text
                        });
                        Navigator.push(context,MaterialPageRoute(
                            builder:(context) => MainMenu()));}
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.brightness_1,
                  size: 10.0,
                  color: Colors.lightBlue),
                  SizedBox(width: 5.0,),
                  Text("Додати фото",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white
                  ),)
                ],
              ),
              SizedBox(height: 10.0),
              Container(
                alignment: Alignment.center,
                height: 190.0,
                color: Color.fromRGBO(80, 80, 80, 1),
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width/5,
                        height: MediaQuery.of(context).size.width/5,
                        child: _image == null ? Image.asset("assets/def_photo.png",
                          ) : Image.file(_image, fit: BoxFit.fill),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      onTap: getImage
                    ),
                    for(int i=1; i<8; i++)
                      photoElement()
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Icon(Icons.brightness_1,
                      size: 10.0,
                      color: Colors.lightBlue),
                  SizedBox(width: 5.0,),
                  Text("Розмір",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Container(
                alignment: Alignment.topCenter,
                color: Color.fromRGBO(80, 80, 80, 1),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container()
                    ),
                    Expanded(
                      child: Image.asset("assets/size.png"),
                      flex: 2,
                    ),
                    Expanded(
                      flex: 1,
                      child: Image.asset("assets/size2.png")
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Розмір"
                            ),
                            controller: sizeController,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                color: Colors.white
                            ),
                            maxLines: null,
                            maxLengthEnforced: true,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Довжина"
                            ),
                            controller: lengthController,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                color: Colors.white
                            ),
                            maxLines: null,
                            maxLengthEnforced: true,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Ширина"
                            ),
                            controller: widthController,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                color: Colors.white
                            ),
                            maxLines: null,
                            maxLengthEnforced: true,
                          ),
                        ],
                      )
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Icon(Icons.brightness_1,
                      size: 10.0,
                      color: Colors.lightBlue),
                  SizedBox(width: 5.0,),
                  Text("Модель",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: modelController,
                keyboardType: TextInputType.text,
                style: TextStyle(
                    color: Colors.white
                ),
                maxLines: null,
                maxLengthEnforced: true,
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Icon(Icons.brightness_1,
                      size: 10.0,
                      color: Colors.lightBlue),
                  SizedBox(width: 5.0,),
                  Text("Матеріал",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: materialController,
                keyboardType: TextInputType.text,
                style: TextStyle(
                    color: Colors.white
                ),
                maxLines: null,
                maxLengthEnforced: true,
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Icon(Icons.brightness_1,
                      size: 10.0,
                      color: Colors.lightBlue),
                  SizedBox(width: 5.0,),
                  Text("Опис",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.white
                ),
                maxLines: null,
                maxLengthEnforced: true,
                controller: descriptionController,
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Icon(Icons.brightness_1,
                      size: 10.0,
                      color: Colors.lightBlue),
                  SizedBox(width: 5.0,),
                  Text("Ціна",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white
                ),
                controller: priceController,
                style: TextStyle(
                  color: Colors.white),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: (String value) {
                  if(value.isEmpty) {return "Enter price";}
                  return null;
                },
              )
            ],
          ),
        )
    );
  }

  Widget photoElement() {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width/5,
        height: MediaQuery.of(context).size.width/5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white
        ),
      ),
      onTap: getImage
    );
  }
}

