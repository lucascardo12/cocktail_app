import 'package:cocktail_app/controller/home-controller.dart';
import 'package:cocktail_app/model/alcoolico-model.dart';
import 'package:cocktail_app/model/categoria-model.dart';
import 'package:cocktail_app/model/drink-model.dart';
import 'package:cocktail_app/model/ingrediente-model.dart';
import 'package:cocktail_app/model/vidro-model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String filtro = 'a=Alcoholic';
  List<Alcoolico> listAlcoolico = new List<Alcoolico>();
  List<Categoria> listCategoria = new List<Categoria>();
  List<Ingredientes> listIngredientes = new List<Ingredientes>();
  List<Vidro> listVidro = new List<Vidro>();
  @override
  void initState() {
    getFilterAlcoolico().then((value) => listAlcoolico = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
          elevation: 12,
          child: Container(
              child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
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
              Container(height: 200, child: alcoholicList()),
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

  alcoholicList() {
    return ColumnBuilder(
        itemCount: listAlcoolico.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: OutlineButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.black,
                onPressed: () {},
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "${listAlcoolico[index].strAlcoholic}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ))),
          );
        });
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

class ColumnBuilder extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final int itemCount;

  const ColumnBuilder({
    Key key,
    @required this.itemBuilder,
    @required this.itemCount,
    this.mainAxisAlignment: MainAxisAlignment.start,
    this.mainAxisSize: MainAxisSize.max,
    this.crossAxisAlignment: CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection: VerticalDirection.down,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: new List.generate(
          this.itemCount, (index) => this.itemBuilder(context, index)).toList(),
    );
  }
}
