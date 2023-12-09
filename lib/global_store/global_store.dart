import 'package:flutter/material.dart';
import 'package:store/models/product.dart';
import 'package:store/product_data.dart';

class GlobalStore with ChangeNotifier {
  List<Item> product = [];
  List<Item> cart = [];
  late Item productDetail;

  Future<void> loadProduct() async {
    product = await ProductData.loadAllProduct();
    notifyListeners();
  }

  addToCart(index) {
    cart.add(product[index]);
    notifyListeners();
  }

  removeProduct(index) {
    cart.removeAt(index);
    notifyListeners();
  }

  num cartTotal() {
    return cart.fold(0, (total, element) => total + element.price);
  }

  detail(index) {
    productDetail = product[index];
    notifyListeners();
  }
}
