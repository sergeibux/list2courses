import 'package:flutter/material.dart';

class FidCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cartes de fidélité"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.east_rounded),
            title: Text('Carrefour'),
          ),
          ListTile(
            leading: Icon(Icons.east_rounded),
            title: Text('Auchan'),
          ),
          ListTile(
            leading: Icon(Icons.east_rounded),
            title: Text('Leclerc'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        tooltip: 'Nouvelle carte de fidélité',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}