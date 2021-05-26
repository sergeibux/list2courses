import 'package:list2courses/database/entities/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Recipe {
  String name;
  Product ingredient;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'product': ingredient
    };
  }

  final database = openDatabase(
      join(await getDatabasesPath(), 'list2courses.db'),
      onCreate : (db, version) {
        return db.execute(
          'CREATE TABLE recipes(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, fk_prooduct INTEGER)',
        );
      },
      version : 1,
  );

  Future<void> insertRecipe(Recipe recipe) async {
    final db = await database;

    await db.insert(
      'recipes',
      recipe.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}