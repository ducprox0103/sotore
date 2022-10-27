import 'dart:ui';

import 'package:appdemo/model/provider/product_model.dart';
import 'package:appdemo/model/page/hom_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailPage extends StatelessWidget {
  final ProductModel e;
  const DetailPage(this.e);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyHeader(
              hint: "Bạn muốn tìm gì ?",
              icon: Icon(Icons.shopping_cart),
              tooltip: ""),
          MyCategory(),
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Image.network(e.image.toString()),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 300, right: 300, top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.title.toString(),
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("\$" + e.price.toString()),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.star),
                                      Icon(Icons.star),
                                      Icon(Icons.star),
                                      Icon(Icons.star),
                                      Icon(Icons.star)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 20, bottom: 20),
                              child: Text(e.description ?? "")),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(children: [
                                  IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.add),
                                  ),
                                  Text("1"),
                                  IconButton(
                                      onPressed: null, icon: Icon(Icons.remove))
                                ]),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                decoration: BoxDecoration(color: Colors.blue),
                                child: TextButton(
                                    onPressed: null,
                                    child: Text(
                                      "Add to cart",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
