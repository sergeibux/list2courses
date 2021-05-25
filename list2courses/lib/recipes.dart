import 'package:flutter/material.dart';

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
  List<TextField> _ingredientsWidgets = new List<TextField>();
  int _ingredientsCount = 0;
  String _recipeName;

  Widget build(BuildContext context) {
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
            ListBody(
              children: _ingredientsWidgets,
            ),
            Text('Ajouter un ingrédient', style : TextStyle(color: Colors.blueAccent)),
            ElevatedButton(
              child: Icon(Icons.add_box_rounded),
              onPressed: () => setState(
                () {
                  ++_ingredientsCount;
                  _ingredientsWidgets = _addIngr(context, _ingredientsWidgets);
                  for (int i = 0; i < _ingredientsCount; ++i){
                    child : _ingredientsWidgets[i];
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
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  List<TextField> _addIngr(BuildContext context, List<TextField> _ingredientsWidgets) {
    _ingredientsWidgets.add(new TextField());
    return _ingredientsWidgets;
  }
}
