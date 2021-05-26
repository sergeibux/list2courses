import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Product {
  int id;
  String name;
  int quantity = 1;
  String unit;

  Map<String, dynamic> toMap() {
    return {'name': name, 'quantity': quantity, 'unit': unit};
  }

  Future<Database> createProductTable() async {
    print("-- create product table --");
    final String path = await getDatabasesPath();
    print("-- create product table 1 --");
    return openDatabase(
      join(path, 'list2courses.db'),
      onCreate: (db, version) {
        print("-- create product table 2 --");
        return db.execute(
          'CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, quantity INTEGER, unit TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertProduct() async {
    print("-- insert product --");
    final table = await createProductTable();

    this.id = await table.insert(
      'products',
      this.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
