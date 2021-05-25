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
        // onPressed: _incrementCounter,
        tooltip: 'Nouvelle recette',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}