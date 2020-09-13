import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main_menu.dart';

class ShowDetails extends StatefulWidget {
  final String url, price, producer, size, length, width, material, description;

  ShowDetails(this.url, this.price, this.producer, this.size, this.length, this.width, this.material, this.description);

  @override
  ShowDetailsState createState() => ShowDetailsState(this.url, this.price, this.producer, this.size,
      this.length, this.width, this.material, this.description);
}

class ShowDetailsState extends State<ShowDetails> {
  String url, price, producer, size, length, width, material, description;

  ShowDetailsState(this.url, this.price, this.producer, this.size,
      this.length, this.width, this.material, this.description);

  TextStyle textStyle = TextStyle(
      color: Colors.white,
      fontSize: 12.0
  );

  TextStyle subtextStyle = TextStyle(
      color: Colors.grey,
      fontSize: 14.0
  );

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 40, 40, 1),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 28.0,),
            Expanded(
              flex: 13,
              child: Container(
                width: MediaQuery.of(context).size.width - 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Color.fromRGBO(60, 60, 60, 1)
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(url,
                                fit: BoxFit.fill,),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ),
                          Positioned(
                            left: -20,
                            child: FlatButton(
                              child: Icon(Icons.arrow_back_ios,
                              color: Colors.white,),
                              onPressed: () {Navigator.push(context,MaterialPageRoute(
                                  builder:(context) => MainMenu()));},
                            ),
                          )
                        ],
                      ),
                      flex: 3,
                    ),
                    Container(height: 10.0,),
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: MediaQuery.of(context).size.width-40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                    vertical: 10.0
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0)),
                                    color: Colors.amberAccent
                                ),
                                child: Text(
                                  price + " грн",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 17.0
                                  ),
                                )
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(producer,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 24.0
                                ),
                              ),
                            ),
                            Text("Розміри стопи:",
                            style: subtextStyle),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(size,
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.lightBlue
                                          )),
                                      Text("EU",
                                          style: textStyle)
                                    ],
                                  ),
                                  SizedBox(width: 5),
                                  Column(
                                    children: [
                                      Text(length,
                                          style: textStyle),
                                      Text("Довжина / см",
                                          style: textStyle)
                                    ],
                                  ),
                                  SizedBox(width: 5),
                                  Column(
                                    children: [
                                      Text(width,
                                          style: textStyle),
                                      Text("Ширина / см",
                                          style: textStyle)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                children: [
                                  Text("Матеріал: ",
                                  style: subtextStyle),
                                  Text(material,
                                    style: subtextStyle
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(description,
                                  style: subtextStyle
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Container()
            ),
            Container(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}