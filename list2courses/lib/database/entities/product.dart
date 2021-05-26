import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'db.dart';

class Product {
  int id;
  String name;
  int quantity = 1;
  String unit;

  Map<String, dynamic> toMap() {
    return {'name': name, 'quantity': quantity, 'unit': unit};
  }

  Future<int> insertProduct() async {
    print("-- insert product --");
    Db db = new Db();
    final tables = await db.updateTables();
    this.id = await tables.insert(
      'products',
      this.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print (this.id);
    return this.id;
  }
}
