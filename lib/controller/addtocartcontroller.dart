import 'dart:developer';

import 'package:api_shoppingcartui_model/model/sshopmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class Addtocartcontroller with ChangeNotifier {
  late Database myDatabase;

  Future initDb() async {
    if (kIsWeb) {
      // Change default factory on the web
      databaseFactory = databaseFactoryFfiWeb;
    }
    myDatabase = await openDatabase("cartdb.db", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Cart (id INTEGER PRIMARY KEY, name TEXT, qty INTEGER, description TEXT, image TEXT)');
    });
  }

  Future getAllProducts() async {
    var storedProducts = await myDatabase.rawQuery('SELECT * FROM Cart');
    log(storedProducts.toString());
  }

  Future addProduct(Shopmodel selectedProduct) async {
    await myDatabase.rawInsert(
        'INSERT INTO Cart(name, qty, description,image) VALUES(?, ?, ?,?)', [
      selectedProduct.title,
      1,
      selectedProduct.description,
      selectedProduct.image
    ]);
  }

  Future incrementQty(
      String name, String discription, int qty, String image, int id) async {
    await myDatabase.rawUpdate(
        'UPDATE Cart SET name = ?, qty = ?, discription = ?, image =? WHERE id = ?',
        [name, qty, discription, image, id]);
    getAllProducts();
  }

  Future decrementQty(
      String name, String discription, int qty, String image, int id) async {
    await myDatabase.rawUpdate(
        'UPDATE Cart SET name = ?, qty = ?, discription = ?, image =? WHERE id = ?',
        [name, qty, discription, image, id]);
    getAllProducts();
  }

  Future removeProduct(int id) async {
    await myDatabase.rawDelete('DELETE FROM Cart WHERE id = ?', [id]);
    getAllProducts();
  }
}
