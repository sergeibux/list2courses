import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Product {
  String name;
  int quantity = 1;
  String unit;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quantity': quantity,
      'unit' : unit
    };
  }

  final database = openDatabase(
      join(await getDatabasesPath(), 'list2courses.db'),
      onCreate : (db, version) {
  return db.execute(
  'CREATE TABLE product(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, quantity INTEGER, unit TEXT)',
  );
  },
  version : 1,
  );

  Future<void> insertProduct(Product product) async {
    final db = await database;

    await db.insert(
      'products',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}