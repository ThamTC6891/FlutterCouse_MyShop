import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myshopping/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final String id;
  ProductDetailScreen(this.id);
  @override
  Widget build(BuildContext context) {
    final loaderProducts =
        Provider.of<Products>(context, listen: false).findByID(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(loaderProducts.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            height: 200,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: loaderProducts.imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, err) => Icon(Icons.error),
              //fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '\$${loaderProducts.price}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '${loaderProducts.description}',
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
