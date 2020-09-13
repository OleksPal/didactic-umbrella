import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'view/menu_list.dart';
import 'view/my_advertisements.dart';
import 'view/favourite_advertisement.dart';
import 'view/my_account.dart';
import 'view/add_advertisement.dart';

class MainMenu extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: NavigationBar(),
    );
  }
}

class NavigationBar extends StatefulWidget {
  NavigationBar({Key key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    MenuList(),
    MyAdvertisements(),
    FavouriteAdvertisement(),
    MyAccount(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30.0,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image(
                  image: AssetImage('assets/menu.png')
              ),
              activeIcon: Image(
                image: AssetImage('assets/menu.png'),
                color: Colors.lightBlueAccent,
              ),
              title: Text("1"),
            ),
            BottomNavigationBarItem(
                icon: Image(
                    image: AssetImage('assets/shoes.png')
                ),
                activeIcon: Image(
                  image: AssetImage('assets/shoes.png'),
                  color: Colors.lightBlueAccent,
                ),
                title: Text("2")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text("3")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text("4")
            )
          ],
          selectedItemColor: Colors.lightBlue,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Color.fromRGBO(80, 80, 80, 1),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {Navigator.push(context,MaterialPageRoute(
              builder:(context) => AddAdvertisement()));},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}