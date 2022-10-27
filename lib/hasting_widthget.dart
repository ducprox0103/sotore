import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HashTagDestination extends StatelessWidget {
  HashTagDestination({super.key});
  List<String> HashList = [
    "All",
    "Âm nhạc",
    "Giải trí",
    "Hoạt hinh",
    "Huế",
    "Việt Nam",
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          children: [
            ...HashList.map((e) {
              return Container(
                child: Text(
                  e,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30)),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
