import 'package:flutter/material.dart';

class ConstsApi {
  static String cardaApiURL = 'https://raw.githubusercontent.com/EvertonFi/ApiCardapio/master/json_api.js';

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