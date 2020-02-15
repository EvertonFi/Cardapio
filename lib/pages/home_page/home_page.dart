import 'package:Cardapio/pages/all_item/all_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    AllItem(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Todos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Hambúrgues'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Bebidas'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: CircleAvatar(
                child: Text("EF"),
                backgroundColor: Colors.white,
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(243, 193, 58, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
