import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store/models/product.dart';

class ProductData {
  static Future<List<Item>> loadAllProduct() async {
    final res = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    final resData = res.body;
    final productData = jsonDecode(resData);
    List<Item> item =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    return item;
  }
}
