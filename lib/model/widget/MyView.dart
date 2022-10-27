import 'package:appdemo/model/page/hom_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() => _MyViewState();
}

bool check = true;

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
