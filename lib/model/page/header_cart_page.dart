import 'package:appdemo/model/page/hom_page.dart';
import 'package:appdemo/model/provider/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class HeaderCartPage extends StatefulWidget {
  const HeaderCartPage({super.key});

  @override
  State<HeaderCartPage> createState() => _HeaderCartPageState();
}

class _HeaderCartPageState extends State<HeaderCartPage> {
  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 50, right: 50),
      child: Row(
        children: [
          Icon(
            Icons.shopping_bag,
            size: 50,
            color: Color(0xffff7337),
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1, color: Color(0xffff7337)))),
            child: Text(
              "Shoppee",
              style: TextStyle(
                  color: Color(0xffff7337),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text("Giỏ hàng",
                style: TextStyle(color: Color(0xffff7337), fontSize: 20)),
          ),
          SizedBox(
            width: 500,
            child: TextField(
              onChanged: (text) => setState(() {
                pp.SearchTitle(text);
              }),
              decoration: InputDecoration(
                hintText: "Bạn tìm gì?",
              ),
            ),
          )
        ],
      ),
    );
  }
}
