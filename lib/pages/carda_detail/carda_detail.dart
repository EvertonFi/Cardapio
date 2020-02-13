import 'package:cached_network_image/cached_network_image.dart';
import 'package:cardapio/consts/consts_api.dart';
import 'package:cardapio/consts/consts_app.dart';
import 'package:cardapio/models/cardaapi.dart';
import 'package:cardapio/stores/comiapi_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class CardaDateilPage extends StatefulWidget {
  final int index;

  CardaDateilPage({Key key, this.index}) : super(key: key);

  @override
  _CardaDateilPageState createState() => _CardaDateilPageState();
}

class _CardaDateilPageState extends State<CardaDateilPage> {
  Color _corCategoria;

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
                    icon: Icon(Icons.add_shopping_cart),
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
                  return Stack(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Opacity(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 120),
                              child: Center(
                                child: Image.asset(
                                  ConstsApp.darkFire,
                                  height: 300,
                                  width: 300,
                                ),
                              ),
                            ),
                            opacity: 0.03,
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: PreferredSize(
                          child: MaterialApp(
                            debugShowCheckedModeBanner: false,
                            home: DefaultTabController(
                              length: 2,
                              child: Scaffold(
                                backgroundColor: Colors.transparent,
                                appBar: PreferredSize(
                                  child: AppBar(
                                    bottom: TabBar(
                                      tabs: [
                                        Tab(
                                          child: Text(
                                            'Descrição',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: 'Google',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Text(
                                            'Ingredientes',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: 'Google',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    backgroundColor: Colors.white,
                                  ),
                                  preferredSize: Size.fromHeight(48),
                                ),
                                body: TabBarView(
                                  children: [
                                    Observer(builder: (_) {
                                      return Padding(
                                        padding: const EdgeInsets.all(30),
                                        child: Text(
                                          _cardapioStore
                                              .cardapioAtual.descricao,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Google',
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      );
                                    }),
                                    Observer(builder: (_) {
                                      return Padding(
                                        padding: const EdgeInsets.all(30),
                                        child: Text(
                                          _cardapioStore
                                              .cardapioAtual.acompanhamento,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Google',
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          preferredSize: Size.fromHeight(150),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
