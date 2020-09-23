import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart' show Cart;
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/widgets/cart_item.dart';

class CartOverviewScreen extends StatelessWidget {
  static const routeName = '/cart-overview';

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text('\$${cartData.totalAmount}'),
                  ),
                  FlatButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cartData.items.values.toList(), cartData.totalAmount);
                      cartData.clear();
                    },
                    child: Text('Order now!'),
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, idx) => CartItem(
                  cartData.items.values.toList()[idx].id,
                  cartData.items.keys.toList()[idx],
                  cartData.items.values.toList()[idx].title,
                  cartData.items.values.toList()[idx].quantity,
                  cartData.items.values.toList()[idx].price),
              itemCount: cartData.itemCount,
            ),
          )
        ],
      ),
    );
  }
}
