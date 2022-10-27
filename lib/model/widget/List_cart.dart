import 'package:appdemo/model/page/hom_page.dart';
import 'package:appdemo/model/provider/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ListCart extends StatefulWidget {
  const ListCart({super.key});

  @override
  State<ListCart> createState() => _ListCartState();
}

int soluong = 1;

class _ListCartState extends State<ListCart> {
  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.list.isEmpty) {
      pp.getList();
    }

    return Container(
      margin: EdgeInsets.only(top: 50, left: 100, right: 100),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ...pp.listCart.map((e) => Card(
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Image.network(
                        e.image ?? "",
                        height: 100,
                        width: 100,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          e.title ?? "",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Text(
                          e.price.toString() + " dolar",
                          style: TextStyle(fontSize: 16, color: Colors.orange),
                        ),
                      ),
                      Container(
                        child: Row(children: [
                          IconButton(
                              onPressed: () => setState(() {
                                    e.quantity++;
                                  }),
                              icon: Icon(Icons.add)),
                          Text(e.quantity.toString()),
                          IconButton(
                              onPressed: () => setState(() {
                                    e.quantity > 1 ? e.quantity-- : e.quantity;
                                  }),
                              icon: Icon(Icons.remove))
                        ]),
                      ),
                      InkWell(
                        onTap: () => setState(() {
                          pp.listCart.remove(e);
                          e.quantity = 1;
                          if (pp.listCart.isEmpty) {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListCart()));
                          }
                        }),
                        child: Container(
                          child: Text(
                            "Xóa",
                            style: TextStyle(color: Colors.orange),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
