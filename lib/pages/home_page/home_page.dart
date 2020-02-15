import 'package:Cardapio/pages/all_item/all_item.dart';
import 'package:Cardapio/pages/drink_item/drink_item.dart';
import 'package:Cardapio/pages/food_item/food_item.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    AllItem(),
    FoodItem(),
    DrinkItem(),
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
            icon: Icon(Icons.fastfood),
            title: Text('Todos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CommunityMaterialIcons.hamburger),
            title: Text('Hambúrgues'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CommunityMaterialIcons.cup),
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
