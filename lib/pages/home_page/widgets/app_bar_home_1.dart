import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 50, right: 40),
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      
                    },
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                child: Text(
                  'Cardápio Online',
                  style: TextStyle(
                    fontFamily: 'Google',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                padding: EdgeInsets.only(
                  left: 20,
                ),
              ),
            ],
          )
        ],
      ),
      height: 120,
    );
  }
}
