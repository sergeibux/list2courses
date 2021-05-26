import 'package:flutter/material.dart';

import 'database/entities/recipe.dart';

class Recipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recettes"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.ac_unit_rounded),
            title: Text('Recette 1'),
          ),
          ListTile(
            leading: Icon(Icons.ac_unit_rounded),
            title: Text('Recette 2'),
          ),
          ListTile(
            leading: Icon(Icons.ac_unit_rounded),
            title: Text('Recette 3'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _newRecipe(context),
        tooltip: 'Nouvelle recette',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _newRecipe(BuildContext context) async {
    String _recipeName;
    int _ingredientsCount = 0;
    List<String> _ingredients = new List<String>();
    List<TextField> _ingredientsWidgets = new List<TextField>();

    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (_) {
          return MyDialog();
        });
  }
}

class MyDialog extends StatefulWidget {
  @override
  _addIngrWidget createState() => new _addIngrWidget();
}

class _addIngrWidget extends State<MyDialog> {
  TextField _ingredientsWidgets = new TextField();
  TextField _qttsWidgets = new TextField();
  TextField _unitsWidgets = new TextField();
  List<String> _ingredients = new List<String>();
  List<int> _qtts = new List<int>();
  List<String> _units = new List<String>();
  List<Row> _ingrRows = new List<Row>();
  int _ingredientsCount = 0;
  Recipe recipe = new Recipe();
  String _recipeName;

  Widget build(BuildContext context) {
    SizedBox sbQtt =
        new SizedBox.fromSize(child: new Text("Quantité"), size: Size(70, 40));
    SizedBox sbUnit =
        new SizedBox.fromSize(child: new Text("Unité"), size: Size(45, 40));
    SizedBox sbIngr = new SizedBox.fromSize(
        child: new Text("Ingrédients"), size: Size(90, 40));
    return AlertDialog(
      title: const Text('Nouvelle recette'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Nom'),
            TextField(onChanged: (value) {
              _recipeName = value;
            }),
            Text('Liste des ingrédients'),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 1)),
                child: Column(
                  children: [
                    Row(
                      children: [sbQtt, sbUnit, sbIngr],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly
                    ),
                    ListBody(
                      children: _ingrRows,
                    ),
                  ],
                )),
            Text('Ajouter un ingrédient',
                style: TextStyle(color: Colors.blueAccent)),
            ElevatedButton(
              child: Icon(Icons.add_box_rounded),
              onPressed: () => setState(
                () {
                  ++_ingredientsCount;
                  _addIngr(context);
                  for (int i = 0; i < _ingredientsCount; ++i) {
                    child:
                    _ingrRows[i];
                  }
                },
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Ajouter'),
          onPressed: () {
            print(_recipeName);
            recipe.name = _recipeName;
            recipe.ingredient.name = _ingredients[0];
            recipe.ingredient.quantity = _qtts[0];
            recipe.ingredient.unit = _units[0];
            recipe.insertRecipe();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  void _addIngr(BuildContext context) {
    _qttsWidgets = new TextField(keyboardType: TextInputType.number, onChanged: (value){_qtts.add(int.parse(value));});
    _unitsWidgets = new TextField(onChanged: (value){_units.add(value);});
    _ingredientsWidgets = new TextField(onChanged: (value){_ingredients.add(value);});
    List<SizedBox> l = new List<SizedBox>();
    SizedBox sbQtt =
        new SizedBox.fromSize(child: _qttsWidgets, size: Size(70, 40));
    SizedBox sbUnit =
        new SizedBox.fromSize(child: _unitsWidgets, size: Size(45, 40));
    SizedBox sbIngr =
        new SizedBox.fromSize(child: _ingredientsWidgets, size: Size(90, 40));
    l.add(sbQtt);
    l.add(sbUnit);
    l.add(sbIngr);
    Row r =
        new Row(children: l, mainAxisAlignment: MainAxisAlignment.spaceEvenly);
    _ingrRows.add(r);
  }
}
