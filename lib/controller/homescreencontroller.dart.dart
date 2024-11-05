import 'dart:convert';

import 'package:api_shoppingcartui_model/model/sshopmodel.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  List<Shopmodel>? shopobj = [];
  int selectedIndexCategory = 0;
  bool isshoploading = false;

  Future<void> getShop() async {
    final producturl = Uri.parse("https://fakestoreapi.com/products");
    final productscategory = Uri.parse(
        "https://fakestoreapi.com/products/category/${categoryList[selectedIndexCategory]}");
    try {
      var response = await http
          .get(selectedIndexCategory == 0 ? producturl : productscategory);
      print(response);

      // final response = await http.get(producturl);
      if (response.statusCode == 200) {
        var responsedata = shopmodelFromJson(response.body);
        shopobj = responsedata;
        print(shopobj);
      }
    } catch (e) {}
    notifyListeners();
  }

  List categoryList = [];
  bool isloading = false;
  Future<void> getcategory() async {
    final url = Uri.parse("https://fakestoreapi.com/products/categories");

    try {
      isloading = true;
      notifyListeners();

      final Response = await http.get(url);
      if (Response.statusCode == 200) {
        var categorydata = jsonDecode(Response.body);
        categoryList = categorydata;
        categoryList.insert(0, "ALL"); //insert all
      }
    } catch (e) {
      print(e);
    }
    isloading = false;
    notifyListeners();
  }

  onCategorySelection(int clickedIndex) async {
    if (selectedIndexCategory != clickedIndex && isshoploading == false) {
      selectedIndexCategory = clickedIndex;
      print(selectedIndexCategory);
      notifyListeners();
    }
    await getShop();
  }

  getAllProducts() {}
  getProductsByCategory() {}
}
