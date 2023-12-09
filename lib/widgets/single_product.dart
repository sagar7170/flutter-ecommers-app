import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/global_store/global_store.dart';
import 'package:store/models/product.dart';
import 'package:store/widgets/detail_page.dart';

class ProductItem extends StatefulWidget {
  final Item product;
  final int index;
  const ProductItem({super.key, required this.product, required this.index});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<GlobalStore>(context, listen: false).detail(widget.index);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailPage()));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Hero(
              tag: Key(widget.product.id.toString()),
              child: Image.network(
                widget.product.image,
                width: 150,
                height: 150,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title,
                    softWrap: false,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${widget.product.price}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  isAdded ? Colors.green : Colors.white,
                              elevation: 0),
                          onPressed: () {
                            Provider.of<GlobalStore>(context, listen: false)
                                .addToCart(widget.index);
                            setState(() {
                              isAdded = true;
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Added to cart"),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.green,
                            ));
                          },
                          child: isAdded
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  CupertinoIcons.cart_fill_badge_plus,
                                  size: 35,
                                ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
