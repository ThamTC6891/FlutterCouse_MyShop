import 'package:flutter/material.dart';
import 'package:myshopping/constants/navigation_constant.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello My Shop'),
            //automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  NavigationConstant.MYHOME_SCREEN,
                  (Route<dynamic> route) => false);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Your Order'),
            onTap: () {
              Navigator.popAndPushNamed(
                  context, NavigationConstant.ORDERS_SCREEN);
            },
          ),
        ],
      ),
    );
  }
}
