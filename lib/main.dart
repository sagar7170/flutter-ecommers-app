// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/global_store/global_store.dart';
import 'package:store/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GlobalStore>(
        create: (context) => GlobalStore()..loadProduct(),
        child: const MaterialApp(
          home: HomePage(),
        ));
  }
}
