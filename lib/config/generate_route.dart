import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myshopping/constants/navigation_constant.dart';
import 'package:myshopping/screens/cart_screen.dart';
import 'package:myshopping/screens/orders_screen.dart';

import 'package:myshopping/screens/product_detail_screen.dart';
import 'package:myshopping/screens/products_overview_screen.dart';

Route generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case NavigationConstant.MYHOME_SCREEN:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => ProductsOverviewScreen());
      break;
    case NavigationConstant.PRODUCT_DETAIL_SCREEN:
      final String id = routeSettings.arguments;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => ProductDetailScreen(id));
    case NavigationConstant.CARD_SCREEN:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => CartScreen(),
      );
    case NavigationConstant.ORDERS_SCREEN:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => OrdersScreen(),
      );
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => ProductsOverviewScreen());
  }
}
