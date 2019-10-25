import 'package:flutter/material.dart';
import 'package:myshopping/config/generate_route.dart';
import 'package:myshopping/providers/cart.dart';
import 'package:myshopping/providers/orders.dart';
import 'package:myshopping/providers/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: "NotoSerif",
          accentColor: Colors.deepOrange,
          buttonColor: Colors.blue,
          textTheme: TextTheme(
            body1: TextStyle(
              fontFamily: "NotoSerif",
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        initialRoute: '/',
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
