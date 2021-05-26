import 'package:list2courses/database/entities/recipe.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Db {
  Future<Database> updateTables() async {
    final String path = await getDatabasesPath();
    print("path :" + path);

    return openDatabase(
      join(path, 'list2courses-v1.db'),
      readOnly: false,
      onUpgrade: (db, oldversion, version) async {
        return await db.execute(
          'DROP TABLE recipes;'
          ' CREATE TABLE recipes(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, fk_product INTEGER); '
          'DROP TABLE products; '
          'CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, quantity INTEGER, unit TEXT)',
        );
      },
      version: 3,
    );
  }

  List<Recipe> getRecipes(){

  }
}
