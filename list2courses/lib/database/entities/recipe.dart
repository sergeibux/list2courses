import 'package:list2courses/database/entities/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Recipe {
  int id;
  String name;
  Product ingredient = new Product();

  Map<String, dynamic> toMap() {
    ingredient.insertProduct();
    return {'name': name, 'fk_product': ingredient.id};
  }

  Future<Database> createRecipeTable() async {
    final String path = await getDatabasesPath();
    print("path :" + path);
    return openDatabase(
      join(path, 'list2courses.db'),
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, quantity INTEGER, unit TEXT)',
        );
        return db.execute(
          'CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, quantity INTEGER, unit TEXT); CREATE TABLE recipes(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, fk_product INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertRecipe() async {
    final table = await createRecipeTable();

    this.id = await table.insert(
      'recipes',
      this.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
