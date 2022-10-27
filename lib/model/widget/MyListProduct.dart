import 'package:provider/provider.dart';
import 'package:appdemo/model/provider/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyListProduct extends StatelessWidget {
  const MyListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.list.isEmpty) {
      pp.getList();
    }
    return ListView(
      children: [
        ...pp.list.map((e) {
          return Text(e.title ?? "");
        }).toList()
      ],
    );
  }
}
