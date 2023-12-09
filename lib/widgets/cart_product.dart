import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/global_store/global_store.dart';
import 'package:store/models/product.dart';

class CartItem extends StatefulWidget {
  final Item cart;
  final int index;
  const CartItem({super.key, required this.cart, required this.index});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.network(
            widget.cart.image,
            width: 100,
            height: 100,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cart.title,
                  softWrap: false,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 40,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.cart.price}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Provider.of<GlobalStore>(context, listen: false)
                              .removeProduct(widget.index);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Removed from the Cart"),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.red,
                          ));
                          setState(() {});
                        },
                        child: const Icon(CupertinoIcons.delete_solid))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
