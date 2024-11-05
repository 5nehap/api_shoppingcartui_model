import 'dart:convert';

import 'package:api_shoppingcartui_model/model/sshopmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ProductDetailController with ChangeNotifier {
  Shopmodel? product;
  bool isLoading = false;

  getProductdetail(int productId) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://fakestoreapi.com/products/${productId}");
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        product = Shopmodel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}