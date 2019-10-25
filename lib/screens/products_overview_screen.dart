import 'package:flutter/material.dart';
import 'package:myshopping/constants/navigation_constant.dart';
import 'package:myshopping/providers/cart.dart';
import 'package:myshopping/widgets/badge.dart';

import 'package:myshopping/widgets/main_drawer.dart';

import 'package:myshopping/widgets/products_grid.dart';
import 'package:provider/provider.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

enum FilerOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<Products>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilerOptions selectedValue) {
              setState(() {
                if (selectedValue == FilerOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Text("Only Favorites"),
                value: FilerOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text("Show All"),
                value: FilerOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, NavigationConstant.CARD_SCREEN);
              },
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: DoubleBackToCloseApp(
        child: ProductsGrid(_showOnlyFavorites),
        snackBar: SnackBar(
          duration: Duration(seconds: 2),
          content: Text(
            'Tap back again to leave',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
