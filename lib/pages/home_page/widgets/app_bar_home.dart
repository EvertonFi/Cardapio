import 'package:Cardapio/consts/consts_app.dart';
import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(right: 10, top: 60),
          child: FloatingActionButton(
            child: Icon(Icons.menu),
            backgroundColor: Color.fromRGBO(243, 193, 58, 1),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: Stack(
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Cardápio Online',
                        style: TextStyle(
                          fontFamily: 'Google',
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -(240 / 3.5),
                left: screenWidth - (240 / 1.57),
                child: Column(
                  children: <Widget>[
                    Opacity(
                      child: Image.asset(ConstsApp.darkFire,
                          height: 200, width: 200),
                      opacity: 0.2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
