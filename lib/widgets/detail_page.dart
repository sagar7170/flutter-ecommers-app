import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/global_store/global_store.dart';
import 'package:store/models/product.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Item itemDetail = Provider.of<GlobalStore>(context).productDetail;
    return Scaffold(
        appBar: AppBar(title: const Text("Product detail")),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: Key(itemDetail.id.toString()),
                child: Image.network(
                  itemDetail.image,
                  width: 450,
                  height: 350,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                itemDetail.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(itemDetail.description,
                  style: const TextStyle(
                    fontSize: 15,
                  ))
            ],
          ),
        ));
  }
}
