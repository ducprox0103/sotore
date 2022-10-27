import 'dart:convert';

import 'package:appdemo/model/provider/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  List<ProductModel> list = [];
  List<ProductModel> listCart = [];
  List<String> listCatagory = [];
  List<ProductModel> listProductCatagory = [];
  bool showGrid = true;
  void show(bool isGrid) {
    showGrid = isGrid;
    notifyListeners();
  }

  void getList() async //batdongbo
  {
    String apiURL = "https://fakestoreapi.com/products";
    var client = http.Client();
    var rs = await client.get(Uri.parse(apiURL));
    var jsonString = rs.body;
    //dich file json
    var jsonObject = jsonDecode(jsonString) as List;
    list = jsonObject.map((e) {
      return ProductModel.fromJson(e);
    }).toList();
    //ds day thi canh bao
    notifyListeners();
    for (var product in list) {
      if (!listCatagory.contains(product.category)) {
        listCatagory.add(product.category ?? "");
      }
    }
  }

  // ignore: non_constant_identifier_names
  void SearchCategory(String category) {
    listProductCatagory.clear();
    for (var element in list) {
      if (element.category.toString().compareTo(category) == 0) {
        listProductCatagory.add(element);
      }
    }
  }

  void SearchTitle(String text) {
    listProductCatagory.clear();
    for (var element in list) {
      if (element.title.toString().contains(text)) {
        listProductCatagory.add(element);
      }
    }
  }
}
