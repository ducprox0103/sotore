import 'package:appdemo/model/widget/List_cart.dart';
import 'package:appdemo/model/page/header_cart_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        HeaderCartPage(),
        Text(
          "Danh sách sản phẩm",
          style: TextStyle(fontSize: 20),
        ),
        Expanded(child: ListCart())
      ],
    ));
  }
}
