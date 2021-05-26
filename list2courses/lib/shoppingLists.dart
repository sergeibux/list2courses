import 'package:flutter/material.dart';

class ShoppingLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listes de courses"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.arrow_forward_ios_rounded),
            title: Text('Liste 1'),
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios_rounded),
            title: Text('Liste 2'),
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios_rounded),
            title: Text('Liste 3'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _newShoppingList(context),
        tooltip: 'Nouvelle liste de courses',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> _newShoppingList(BuildContext context) async {
    String _shoppingListName;
    int _productsCount = 0;
    List<String> _products = new List<String>();
    List<TextField> _productsWidgets = new List<TextField>();

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
  _addProductsWidget createState() => new _addProductsWidget();
}

class _addProductsWidget extends State<MyDialog> {
  List<TextField> _productsWidgets = new List<TextField>();
  int _productsCount = 0;
  String _productName;
  String _productUnit;
  int _productQuantity;

  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nouvelle liste de courses'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Nom'),
            TextField(onChanged: (value) {
              _productName = value;
            }),
            Text('Quantité'),
            TextField(onChanged: (value) {
              _productQuantity = value as int;
            }, keyboardType: TextInputType.number,),
            Text('Unité'),
            TextField(onChanged: (value) {
              _productUnit = value;
            }),
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
}