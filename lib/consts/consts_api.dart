import 'package:flutter/material.dart';

class ConstsApi {
  static String cardaApiURL = 'http://10.0.0.105/api_comida.php';

 static Color getColorCategoria({String categoria}){
  switch (categoria) {
    case 'Hambúrguer':
      return Colors.red;
      break;
    case 'Bebidas':
      return Colors.lightGreen;
      break;
    case 'Adicionais':
      return Colors.blue;
      break;
    default:
      return Colors.black;
  }
}



}