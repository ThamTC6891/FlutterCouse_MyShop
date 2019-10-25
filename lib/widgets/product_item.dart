import 'package:flutter/material.dart';
import 'package:myshopping/providers/cart.dart';
import 'package:myshopping/providers/product.dart';
import 'package:provider/provider.dart';
import '../constants/navigation_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
            context, NavigationConstant.PRODUCT_DETAIL_SCREEN,
            arguments: product.id),
        child: GridTile(
          child: CachedNetworkImage(
            imageUrl: product.imageUrl,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.fill,
          ),
          footer: GridTileBar(
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            leading: Consumer<Product>(
              builder: (ctx, product, _) => IconButton(
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  product.toggleIsFavorite();
                },
                color: Theme.of(context).accentColor,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItems(
                  productId: product.id,
                  price: product.price,
                  title: product.title,
                );
              },
              color: Theme.of(context).accentColor,
            ),
            backgroundColor: Colors.black87,
          ),
        ),
      ),
    );
  }
}
