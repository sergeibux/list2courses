import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liste2Courses',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application.

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // // Validate returns true if the form is valid, or false otherwise.
                // if (valueToCheck == valueToCheck.split('').reversed.join()) {
                //   // If the form is valid, display a snackbar. In the real world,
                //   // you'd often call a server or save the information in a database.
                //   ScaffoldMessenger.of(context)
                //       .showSnackBar(SnackBar(content: Text("C'est oui")));
                // }else{
                //   ScaffoldMessenger.of(context)
                //       .showSnackBar(SnackBar(content: Text("C'est non")));
                // }
              },
              child: Text('Listes de courses'),
            ),
            ElevatedButton(
              onPressed: () {
                // // Validate returns true if the form is valid, or false otherwise.
                // if (valueToCheck == valueToCheck.split('').reversed.join()) {
                //   // If the form is valid, display a snackbar. In the real world,
                //   // you'd often call a server or save the information in a database.
                //   ScaffoldMessenger.of(context)
                //       .showSnackBar(SnackBar(content: Text("C'est oui")));
                // }else{
                //   ScaffoldMessenger.of(context)
                //       .showSnackBar(SnackBar(content: Text("C'est non")));
                // }
              },
              child: Text('Recettes'),
            ),
            ElevatedButton(
              onPressed: () {
                // // Validate returns true if the form is valid, or false otherwise.
                // if (valueToCheck == valueToCheck.split('').reversed.join()) {
                //   // If the form is valid, display a snackbar. In the real world,
                //   // you'd often call a server or save the information in a database.
                //   ScaffoldMessenger.of(context)
                //       .showSnackBar(SnackBar(content: Text("C'est oui")));
                // }else{
                //   ScaffoldMessenger.of(context)
                //       .showSnackBar(SnackBar(content: Text("C'est non")));
                // }
              },
              child: Text('Cartes de fidélité'),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
