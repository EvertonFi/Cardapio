import 'package:Cardapio/models/cardaapi.dart';
import 'package:Cardapio/pages/carda_detail/carda_detail.dart';
import 'package:Cardapio/pages/home_page/widgets/app_bar_home.dart';
import 'package:Cardapio/pages/home_page/widgets/carda_item.dart';
import 'package:Cardapio/stores/comiapi_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class DrinkItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cardaApiStore = Provider.of<ComiApiStore>(context);

    _cardaApiStore.fetchCardapioList(categoria: 2);

    double statusWidth = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: statusWidth,
                  color: Colors.redAccent,
                ),
                SizedBox(
                  height: 150,
                  child: AppBarHome(),
                ),
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
                                            _cardaApiStore.setCardapioAtual(
                                                index: index);
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: CircleAvatar(
                child: Text("EF"),
                backgroundColor: Colors.white,
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(243, 193, 58, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
