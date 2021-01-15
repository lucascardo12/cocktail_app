import 'package:cocktail_app/model/detalhes-drink-model.dart';
import 'package:cocktail_app/model/drink-model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Drink> drinks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: FutureBuilder<Drink>(
        future: drinks,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.strDrink);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      )),
    );
  }
}
