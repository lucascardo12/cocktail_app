import 'package:cocktail_app/controller/home-controller.dart';
import 'package:cocktail_app/model/drink-model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
          elevation: 12,
          child: Container(
              color: Colors.blue,
              child: ListView(
                children: [
                  FlatButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Categories",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                  FlatButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Glasses",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                  FlatButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Ingredients",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                  FlatButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Categorias",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                  FlatButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Categorias",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ))),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: FutureBuilder<List<Drink>>(
        future: getDrink(filtro: 'a=Alcoholic'),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? DrikList(drinks: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class DrikList extends StatelessWidget {
  final List<Drink> drinks;

  DrikList({Key key, this.drinks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: drinks.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            FadeInImage.assetNetwork(
              width: 150,
              image: drinks[index].strDrinkThumb,
              placeholder: 'assets/load.gif',
            ),
            Text(drinks[index].strDrink)
          ],
        );
      },
    );
  }
}
