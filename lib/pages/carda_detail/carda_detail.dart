import 'package:cached_network_image/cached_network_image.dart';
import 'package:cardapio/consts/consts_api.dart';
import 'package:cardapio/models/cardaapi.dart';
import 'package:cardapio/stores/comiapi_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class CardaDateilPage extends StatelessWidget {
  final int index;

  Color _corCategoria;

  CardaDateilPage({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cardapioStore = Provider.of<ComiApiStore>(context);
    Cardapio _cardapio = _cardapioStore.cardapioAtual;
    _corCategoria =
        ConstsApi.getColorCategoria(categoria: _cardapio.nomeCategoria);
    return Observer(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Observer(builder: (BuildContext context) {
              _corCategoria = ConstsApi.getColorCategoria(
                    categoria: _cardapioStore.cardapioAtual.nomeCategoria);
              return AppBar(
                title: Opacity(
                  child: Text(
                    _cardapioStore.cardapioAtual.nomePrato,
                    style: TextStyle(
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                  opacity: 1,
                ),
                elevation: 0,
                backgroundColor: _corCategoria,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                ],
              );
            }),
          ),
          body: Stack(
            children: <Widget>[
              Observer(builder: (context) {
                _corCategoria = ConstsApi.getColorCategoria(
                    categoria: _cardapioStore.cardapioAtual.nomeCategoria);
                return Container(
                  color: _corCategoria,
                );
              }),
              Container(
                height: MediaQuery.of(context).size.height / 3,
              ),
              SlidingSheet(
                elevation: 0,
                cornerRadius: 16,
                snapSpec: const SnapSpec(
                  snap: true,
                  snappings: [0.7, 1.0],
                  positioning: SnapPositioning.relativeToAvailableSpace,
                ),
                builder: (context, state) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                  );
                },
              ),
              Padding(
                child: SizedBox(
                  height: 150,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      _cardapioStore.setCardapioAtual(index: index);
                    },
                    itemCount: _cardapioStore.cardaAPI.cardapio.length,
                    itemBuilder: (BuildContext context, int count) {
                      Cardapio _cardapioitem =
                          _cardapioStore.getCardapio(index: count);
                      return CachedNetworkImage(
                        height: 100,
                        width: 100,
                        placeholder: (context, url) => new Container(
                          color: Colors.transparent,
                        ),
                        imageUrl:
                            'http://10.0.0.105/imagens/${_cardapioitem.idPrato}.png',
                      );
                    },
                  ),
                ),
                padding: EdgeInsets.only(top: 50),
              )
            ],
          ),
        );
      },
    );
  }
}
