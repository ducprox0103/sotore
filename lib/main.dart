import 'package:appdemo/model/provider/product_provider.dart';
import 'package:appdemo/model/page/hom_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ProductProvider())],
    child: const MaterialApp(
      home: HomePage(),
    ),
  ));
}
