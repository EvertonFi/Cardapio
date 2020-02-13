import 'package:Cardapio/consts/consts_app.dart';
import 'package:Cardapio/models/cardaapi.dart';
import 'package:Cardapio/pages/carda_detail/carda_detail.dart';
import 'package:Cardapio/pages/home_page/widgets/app_bar_home.dart';
import 'package:Cardapio/pages/home_page/widgets/carda_item.dart';
import 'package:Cardapio/stores/comiapi_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final _cardaApiStore = Provider.of<ComiApiStore>(context);
    if (_cardaApiStore.cardaAPI == null) {
      _cardaApiStore.fetchCardapioList();
    }
    double screenWidth = MediaQuery.of(context).size.width;
    double statusWidth = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: -(240 / 3),
            left: screenWidth - (240 / 1.3),
            child: Opacity(
              child: Image.asset(ConstsApp.darkFire, height: 240, width: 240),
              opacity: 0.2,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: statusWidth,
                  color: Colors.redAccent,
                ),
                AppBarHome(),
                Expanded(
                  child: Container(
                    child: Observer(
                      builder: (BuildContext context) {
                        CardaAPI _cardaApi = _cardaApiStore.cardaAPI;
                        return (_cardaApi != null)
                            ? AnimationLimiter(
                                child: GridView.builder(
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.all(12),
                                  addAutomaticKeepAlives: true,
                                  gridDelegate:
                                      new SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  itemCount:
                                      _cardaApiStore.cardaAPI.cardapio.length,
                                  itemBuilder: (context, index) {
                                    Cardapio cardapio = _cardaApiStore
                                        .getCardapio(index: index);
                                    return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 375),
                                      columnCount: 2,
                                      child: ScaleAnimation(
                                        child: GestureDetector(
                                          child: Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: CardaItem(
                                              index: index,
                                              nome: cardapio.nomePrato,
                                              idPrato: cardapio.idPrato,
                                              categoria: cardapio.nomeCategoria,
                                            ),
                                          ),
                                          onTap: () {
                                            _cardaApiStore.setCardapioAtual(index: index);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          CardaDateilPage(
                                                    index: index,
                                                  ),
                                                  fullscreenDialog: true,
                                                ));
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
