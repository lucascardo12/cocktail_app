import 'package:cocktail_app/controller/home-controller.dart';
import 'package:cocktail_app/model/drink-model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String filtro = 'a=Alcoholic';
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
              child: ListView(
            children: [
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.white,
                onPressed: () {},
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.white,
                onPressed: () {},
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Glasses",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.white,
                onPressed: () {},
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Ingredients",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.white,
                onPressed: () {},
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Alcoholic",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: OutlineButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Colors.black,
                    onPressed: () {},
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          " Filtro:  \n\n " +
                              filtro.substring(2, filtro.length),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ))),
              )
            ],
          ))),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: FutureBuilder<List<Drink>>(
        future: getDrink(filtro: filtro),
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
      padding: EdgeInsets.all(0),
      scrollDirection: Axis.vertical,
      itemCount: drinks.length,
      itemBuilder: (context, index) {
        return OutlineButton(
            padding: EdgeInsets.all(10),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FadeInImage.assetNetwork(
                  width: 150,
                  image: drinks[index].strDrinkThumb,
                  placeholder: 'assets/load.gif',
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                    child: Text(
                  drinks[index].strDrink,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ))
              ],
            ));
      },
    );
  }
}
