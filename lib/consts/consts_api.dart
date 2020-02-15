import 'package:flutter/material.dart';

class ConstsApi {
  static String cardaApiURLAll = 'https://raw.githubusercontent.com/EvertonFi/ApiCardapio/master/json_api_All.js';
  static String cardaApiURLFood = 'https://raw.githubusercontent.com/EvertonFi/ApiCardapio/master/json_api_Food.js';
  static String cardaApiURLDrink = 'https://raw.githubusercontent.com/EvertonFi/ApiCardapio/master/json_api_Drink.js';

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