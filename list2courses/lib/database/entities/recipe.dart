import 'package:list2courses/database/entities/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'db.dart';

class Recipe {
  int id;
  String name;
  Product ingredient = new Product();

  Future<Map<String, dynamic>> toMap() async {
    int ingrId = await ingredient.insertProduct();
    print(ingredient.id);
    return {'name': name, 'fk_product': ingredient.id};
  }

  Future<void> insertRecipe() async {
    Db db = new Db();
    final tables = await db.updateTables();

    Map<String, dynamic> map = await this.toMap();
    this.id = await tables.insert(
      'recipes',
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
