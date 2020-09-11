import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
    // we don't really need to listen for changes here. We just want to tap into the data once
    final productsData = Provider.of<Products>(context, listen: false);
    final productId = ModalRoute.of(context).settings.arguments as String;
    final product = productsData.findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
