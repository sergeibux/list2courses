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
        // onPressed: _incrementCounter,
        tooltip: 'Nouvelle liste de courses',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}