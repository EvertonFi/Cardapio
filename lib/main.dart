import 'package:cardapio/pages/home_page/home_page.dart';
import 'package:cardapio/stores/comiapi_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        title: 'Cardápio Mobile',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
      providers: <SingleChildWidget>[
        Provider<ComiApiStore>(
          create: (_) => ComiApiStore(),
        )
      ],
    );
  }
}
