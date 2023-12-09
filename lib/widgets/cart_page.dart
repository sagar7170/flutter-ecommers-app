import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/global_store/global_store.dart';
import 'package:store/widgets/cart_product.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalStore>(builder: (context, provider, child) {
      return MaterialApp(
          home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 230, 216, 220),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Cart Items",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
            itemCount: provider.cart.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                child: CartItem(
                  cart: provider.cart[index],
                  index: index,
                ),
              );
            }),
        bottomNavigationBar: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${provider.cartTotal().toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Buy"))
              ],
            )),
      ));
    });
  }
}
