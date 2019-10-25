import 'package:flutter/material.dart';
import 'package:myshopping/providers/cart.dart';

import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String productId;
  final String id;
  final String title;
  final int quantity;
  final double price;
  CartItem(
    this.productId,
    this.id,
    this.title,
    this.quantity,
    this.price,
  );
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        padding: EdgeInsets.only(
          right: 20,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (dismissed) {
        cart.removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                child: FittedBox(
                  child: Text('\$$price'),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title),
                  Text(
                      'Total: \$${(price * quantity).toStringAsFixed(2)}'), // lay 2 so sau dau phay
                ],
              ),
              Spacer(),
              Text(
                '$quantity x',
                style: TextStyle(fontSize: 20),
              ),
              FlatButton(
                shape: CircleBorder(),
                child: Center(child: Icon(Icons.add)),
                onPressed: () {
                  cart.addItems(
                    productId: productId,
                    title: title,
                    price: price,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
