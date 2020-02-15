import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:Cardapio/models/cardaapi.dart';
import 'package:flutter/material.dart';
import 'package:Cardapio/consts/consts_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'comiapi_store.g.dart';

class ComiApiStore = _ComiApiStoreBase with _$ComiApiStore;

abstract class _ComiApiStoreBase with Store {
  @observable
  CardaAPI _cardaAPI;

  @observable
  Cardapio _cardapioAtual;

  @computed
  CardaAPI get cardaAPI => _cardaAPI;

  @computed
  Cardapio get cardapioAtual => _cardapioAtual;

  @action
  fetchCardapioList({int categoria}) {
    _cardaAPI = null;
    loadCardaAPI(categoria: categoria).then((carList) {
      _cardaAPI = carList;
    });
  }

  @action
  getCardapio({int index}) {
    return _cardaAPI.cardapio[index];
  }

  @action
  setCardapioAtual({int index}) {
    _cardapioAtual = _cardaAPI.cardapio[index];
  }


  @action
  Widget getImage({String numero}) {
    return CachedNetworkImage(
      placeholder: (context, url) => new Container(
        color: Colors.transparent,
      ),
      imageUrl: 'https://raw.githubusercontent.com/EvertonFi/ApiCardapio/master/imagens/$numero.png',
    );
  }

  Future<CardaAPI> loadCardaAPI({int categoria}) async {
    try {
      String url = '';
      switch (categoria) {
        case 0:
          url = ConstsApi.cardaApiURLAll;
          break;
        case 1:
        url = ConstsApi.cardaApiURLFood;
        break;
        case 2:
          url = ConstsApi.cardaApiURLDrink;
          break;
        default:
          url = ConstsApi.cardaApiURLAll;
      }
      final response = await http.get(url);
      var decodeJson = jsonDecode(response.body);
      return CardaAPI.fromJson(decodeJson);
    } catch (error) {
      print("Error ao carregar a lista");
      return null;
    }
  }
}
