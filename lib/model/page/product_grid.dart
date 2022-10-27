import 'dart:ui';

import 'package:appdemo/Trangtinchi.dart';
import 'package:appdemo/model/provider/product_model.dart';
import 'package:appdemo/model/widget/List_cart.dart';
import 'package:appdemo/model/page/detail_page.dart';
import 'package:appdemo/model/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class MyGridView extends StatefulWidget {
  const MyGridView({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  bool ls = false;

  _MyGridViewState();

  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    List<ProductModel> pp1 = [];
    if (pp.list.isEmpty) {
      pp.getList();
    }
    if (pp.listProductCatagory.isNotEmpty)
      pp1 = pp.listProductCatagory;
    else
      pp1 = pp.list;
    return GridView.count(
      crossAxisCount: 4,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(20),
      children: [
        ...pp1.map((e) {
          return Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(children: [
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(e),
                    )),
                child: Image.network(
                  e.image ?? "",
                  width: 150,
                  height: 150,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  e.title ?? "",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Text("price :" + e.price.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  )),
              Container(
                decoration: BoxDecoration(color: Colors.blue),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 20),
                child: TextButton.icon(
                    onPressed: () => pp.listCart.contains(e)
                        ? e.quantity++
                        : pp.listCart.add(e),
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    label: Text(
                      "BUY",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ]),
          );
        }),
      ],
    );

    // if (ls)
  }
}
