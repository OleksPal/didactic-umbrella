import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'show_details.dart';

class MenuList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _MenuListState();
}

class _MenuListState extends State<MenuList> {

  TextStyle textStyle = TextStyle(
      color: Colors.white,
      fontSize: 12.0
  );

  Widget _listItemBuilder(BuildContext context, DocumentSnapshot document) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("items").snapshots(),
        builder: (context, snapshot) {
          return GestureDetector(
            child: Column(
              children: [
                SizedBox(height: 20.0,),
                addElement(context, document)
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ShowDetails(document.data()["url"],
                      document.data()["price"], document.data()["producer"], document.data()["size"],
                      document.data()["length"], document.data()["width"], document.data()["material"],
                      document.data()["description"]
                  ))
              );},
          );
        }
    );
  }

  Widget addElement (BuildContext context, DocumentSnapshot document) {
    return Stack(
      children: [
        Container(
            width: MediaQuery.of(context).size.width-20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Color.fromRGBO(60, 60, 60, 1)
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(document.data()["url"],
                          fit: BoxFit.fitHeight,),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      width: 120.0,
                      height: 120.0,
                    ),
                    Positioned(
                      left: -10,
                      top: -10,
                      child: CupertinoButton(
                        child: Icon(Icons.favorite, color: document.data()["favourite"] ? Colors.red : Colors.white,
                            size: 35.0),
                        onPressed: () {
                          FirebaseFirestore.instance.runTransaction((transaction) async {
                            DocumentSnapshot freshSnap = await transaction.get(document.reference);
                            transaction.update(freshSnap.reference, {
                              "favourite": !freshSnap.data()["favourite"]
                            });
                          });
                          document.data()["favourite"] = !document.data()["favourite"];
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(document.data()["producer"],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Text("Розміри стопи:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0
                        )),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(document.data()["size"],
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
                            Text(document.data()["length"],
                                style: textStyle),
                            Text("Довжина / см",
                                style: textStyle)
                          ],
                        ),
                        SizedBox(width: 5),
                        Column(
                          children: [
                            Text(document.data()["width"],
                                style: textStyle),
                            Text("Ширина / см",
                                style: textStyle)
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text("Матеріал: Шкіра",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0
                        ))
                  ],
                ),
                SizedBox(width: 56.0,),
                Column(
                  children: [
                    SizedBox(height: 30.0,),
                  ],
                )
              ],
            )
        ),
        Positioned(
          top: 10.0,
          right: 0.0,
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.amber
              ),
              child: Text(document.data()["price"].toString()+" \$",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                ),
              )
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(40, 40, 40, 1),
        body: Stack(
          children: [
            Positioned(
              child: Image.asset("assets/bg-rp.png",
              ),
              right: 0,
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance.collection("items").snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData) return Center(child: Text("Loading..."));
                  return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemExtent: 150.0,
                      itemBuilder: (context, index) =>
                          _listItemBuilder(context, snapshot.data.documents[index])
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}