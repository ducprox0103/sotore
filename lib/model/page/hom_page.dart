import 'dart:js';

import 'package:appdemo/Trangtinchi.dart';
import 'package:appdemo/model/page/cart_page.dart';
import 'package:appdemo/model/provider/product_model.dart';
import 'package:appdemo/model/provider/product_provider.dart';
import 'package:appdemo/model/widget/MyListProduct.dart';
import 'package:appdemo/model/widget/MyView.dart';
import 'package:appdemo/model/page/product_grid.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

//stl
class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});
  String msg = 'Flutter RaisedButton Example';
  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.list.isEmpty) {
      pp.getList();
    }
    return Scaffold(
        body: GridView.count(
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      crossAxisSpacing: 20,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(20),
      children: [
        ...pp.list.map((e) {
          return Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(children: [
              Image.network(
                e.image ?? "",
                width: 80,
              ),
              Text(
                e.title ?? "",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ]),
          );
        })
      ],
    ));
  }
}

class DanhSach extends StatelessWidget {
  const DanhSach({super.key});

  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.list.isEmpty) {
      pp.getList();
    }
    return Container(
      child: Column(
        children: [
          ...pp.list.map((e) {
            return Container(
              child: Column(children: [
                Image.network(
                  e.image ?? "",
                  width: 200,
                ),
                Text(
                  e.title ?? "",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ]),
            );
          })
        ],
      ),
    );
  }
}

class MyHeader extends StatelessWidget {
  const MyHeader(
      {required this.hint,
      required this.icon,
      required this.tooltip,
      super.key});

  // Fields in a Widget subclass are always marked "final".

  final String hint;
  final Widget icon;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 100),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row is a horizontal, linear layout.
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                )),
            child: Text(
              "Shoppee Fake",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Colors.white),
            ),
          ),
          // Expanded expands its child
          // to fill the available space.
          SizedBox(
            width: 500,
            child: TextField(
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: hint,
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage())),
            child: IconButton(
              icon: icon,
              tooltip: tooltip,
              onPressed: null, // null disables the button
            ),
          ),
        ],
      ),
    );
  }
}

class MyCategory extends StatefulWidget {
  const MyCategory({super.key});

  @override
  State<MyCategory> createState() => _MyCategoryState();
}

List<ProductModel> pc = [];

class _MyCategoryState extends State<MyCategory> {
  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.list.isEmpty) {
      pp.getList();
    }
    return Container(
      height: 40.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 100),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          ...pp.listCatagory
              .map((e) => TextButton(
                  onPressed: () {
                    setState(() {
                      pp.SearchCategory(e);
                    });
                  },
                  child: Text(
                    e,
                    style: TextStyle(color: Colors.white),
                  )))
              .toList()
        ],
      ),
    );
  }
}

class func extends StatefulWidget {
  const func({super.key});

  @override
  State<func> createState() => _funcState();
}

class _funcState extends State<func> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  void click() {
    setState(() {
      check ? check = false : check = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 40),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (check)
            IconButton(onPressed: click, icon: const Icon(Icons.list))
          else
            IconButton(onPressed: click, icon: const Icon(Icons.grid_view))
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool check = true;
  void click() {
    setState(() {
      check ? check = false : check = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.list.isEmpty) {
      pp.getList();
    }
    return Scaffold(
      // Column is a vertical, linear layout.
      body: Column(
        children: [
          const MyHeader(
              hint: "Search...",
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              tooltip: "Searchbtn"),
          Container(
            height: 40.0, // in logical pixels
            padding: const EdgeInsets.symmetric(horizontal: 100),
            decoration: BoxDecoration(color: Colors.blue[500]),
            child: Row(
              children: [
                ...pp.listCatagory
                    .map((e) => TextButton(
                        onPressed: () {
                          setState(() {
                            pp.SearchCategory(e);
                          });
                        },
                        child: Text(
                          e,
                          style: TextStyle(color: Colors.white),
                        )))
                    .toList()
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.only(right: 40),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (check)
                  IconButton(onPressed: click, icon: const Icon(Icons.list))
                else
                  IconButton(
                      onPressed: click, icon: const Icon(Icons.grid_view))
              ],
            ),
          ),
          if (check == true) Expanded(child: MyGridView()),

          // MyListProduct()
        ],
      ),
    );
  }
}
