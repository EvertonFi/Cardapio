import 'package:Cardapio/consts/consts_api.dart';
import 'package:Cardapio/consts/consts_app.dart';
import 'package:Cardapio/models/cardaapi.dart';
import 'package:Cardapio/stores/comiapi_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class CardaDateilPage extends StatefulWidget {
  final int index;

  CardaDateilPage({Key key, this.index}) : super(key: key);

  @override
  _CardaDateilPageState createState() => _CardaDateilPageState();
}

class _CardaDateilPageState extends State<CardaDateilPage> {
  PageController _pageController;
  ComiApiStore _cardapioStore;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.index);
    _cardapioStore = GetIt.instance<ComiApiStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Observer(builder: (BuildContext context) {
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
                backgroundColor: _cardapioStore.corCategoria,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  )
                ],
              );
            }),
          ),
          body: Stack(
            children: <Widget>[
              Observer(builder: (context) {
                return Container(
                  color: _cardapioStore.corCategoria,
                );
              }),
              Container(
                height: MediaQuery.of(context).size.height / 3,
              ),
              Padding(
                child: SizedBox(
                  height: 150,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      _cardapioStore.setCardapioAtual(index: index);
                    },
                    itemCount: _cardapioStore.cardaAPI.cardapio.length,
                    itemBuilder: (BuildContext context, int count) {
                      Cardapio _cardapioItem =
                          _cardapioStore.getCardapio(index: count);
                      return Image.network(
                        'https://raw.githubusercontent.com/EvertonFi/ApiCardapio/master/imagens/${_cardapioItem.idPrato}.png',
                        height: 100,
                        width: 100,
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
                                      indicatorColor:
                                          Color.fromRGBO(243, 193, 58, 1),
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
              Observer(builder: (_) {
                _cardapioStore.corCategoria = ConstsApi.getColorCategoria(
                    categoria: _cardapioStore.cardapioAtual.nomeCategoria);
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: ButtonTheme(
                          height: 50,
                          child: RaisedButton(
                            textColor: _cardapioStore.corCategoria,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: _cardapioStore.corCategoria),
                            ),
                            onPressed: () {},
                            child: const Text('Adicionar ao pedido',
                                style: TextStyle(fontSize: 30)),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              })
            ],
          ),
        );
      },
    );
  }
}
