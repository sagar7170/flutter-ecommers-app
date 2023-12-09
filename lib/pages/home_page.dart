import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/global_store/global_store.dart';
import 'package:provider/provider.dart';
import 'package:store/widgets/cart_page.dart';
import 'package:store/widgets/single_product.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalStore>(builder: (context, provider, child) {
      return MaterialApp(
          home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 230, 216, 220),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartPage()));
          },
          child: Badge.count(
            count: provider.cart.length,
            child: const Icon(
              CupertinoIcons.cart_badge_plus,
              size: 30,
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text(
            "Shopping Store",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
            itemCount: provider.product.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                child: provider.product.isNotEmpty
                    ? ProductItem(
                        product: provider.product[index],
                        index: index,
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              );
            }),
      ));
    });
  }
}
