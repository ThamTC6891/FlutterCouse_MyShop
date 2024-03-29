import 'package:flutter/material.dart';
import 'package:myshopping/providers/orders.dart' show Orders;
import 'package:myshopping/widgets/main_drawer.dart';

import 'package:provider/provider.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
      ),
      drawer: MainDrawer(),
    );
  }
}
