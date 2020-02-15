import 'package:Cardapio/consts/consts_api.dart';
import 'package:Cardapio/consts/consts_app.dart';
import 'package:flutter/material.dart';

class CardaItem extends StatelessWidget {
  final String nome;
  final int index;
  final Color color;
  final String idPrato;
  final String categoria;

  const CardaItem(
      {Key key,
      this.nome,
      this.index,
      this.color,
      this.idPrato,
      this.categoria})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Stack(
          //alignment: Alignment.bottomRight,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    top: 8,
                  ),
                  child: Text(
                    nome,
                    style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(80, 255, 255, 255)),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            categoria,
                            style: TextStyle(
                                fontFamily: 'Google',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Opacity(
                child: Image.asset(
                  ConstsApp.whiteFire,
                  height: 130,
                  width: 130,
                ),
                opacity: 0.2,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.network(
                'https://raw.githubusercontent.com/EvertonFi/ApiCardapio/master/imagens/$idPrato.png',
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: ConstsApi.getColorCategoria(categoria: categoria),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }
}
