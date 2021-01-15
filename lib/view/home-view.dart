import 'package:cocktail_app/controller/home-controller.dart';
import 'package:cocktail_app/model/alcoolico-model.dart';
import 'package:cocktail_app/model/categoria-model.dart';
import 'package:cocktail_app/model/drink-model.dart';
import 'package:cocktail_app/model/ingrediente-model.dart';
import 'package:cocktail_app/model/vidro-model.dart';
import 'package:cocktail_app/view/detalhesDrink-page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String filtro = 'a=Alcoholic';
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey();

  List<Alcoolico> listAlcoolico = new List<Alcoolico>();
  List<Categoria> listCategoria = new List<Categoria>();
  List<Ingredientes> listIngredientes = new List<Ingredientes>();
  List<Vidro> listVidro = new List<Vidro>();
  bool isAlco = false;
  bool isGlas = false;
  bool isCate = false;
  bool isIngr = false;
  @override
  void initState() {
    getFilterAlcoolico().then((value) => listAlcoolico = value);
    getFilterCategoria().then((value) => listCategoria = value);
    getFilterIngredientes().then((value) => listIngredientes = value);
    getFilterVidro().then((value) => listVidro = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
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
                onPressed: () {
                  setState(() {
                    isCate = !isCate;
                  });
                },
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),
              ),
              Visibility(visible: isCate, child: categoriaList()),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    isGlas = !isGlas;
                  });
                },
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Glasses",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),
              ),
              Visibility(visible: isGlas, child: glasseList()),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    isIngr = !isIngr;
                  });
                },
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Ingredients",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),
              ),
              Visibility(visible: isIngr, child: ingredientList()),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    isAlco = !isAlco;
                  });
                },
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Alcoholic",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),
              ),
              Visibility(visible: isAlco, child: alcoholicList()),
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
        actions: [
          StatefulBuilder(
            builder: (BuildContext context, setState) {
              return IconButton(
                icon: Icon(Icons.filter_alt),
                onPressed: () {
                  _scaffoldkey.currentState.openEndDrawer();
                },
              );
            },
          )
        ],
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
                onPressed: () {
                  setState(() {
                    filtro = 'a=' + listAlcoolico[index].strAlcoholic;
                    Navigator.pop(context);
                  });
                },
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

  categoriaList() {
    return ColumnBuilder(
        itemCount: listCategoria.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: OutlineButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    filtro = 'c=' + listCategoria[index].strCategory;
                    Navigator.pop(context);
                  });
                },
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "${listCategoria[index].strCategory}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ))),
          );
        });
  }

  glasseList() {
    return ColumnBuilder(
        itemCount: listVidro.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: OutlineButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    filtro = 'g=' + listVidro[index].strGlass;
                    Navigator.pop(context);
                  });
                },
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "${listVidro[index].strGlass}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ))),
          );
        });
  }

  ingredientList() {
    return ColumnBuilder(
        itemCount: listIngredientes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: OutlineButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    filtro = 'i=' + listIngredientes[index].strIngredient1;
                    Navigator.pop(context);
                  });
                },
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "${listIngredientes[index].strIngredient1}",
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                )),
                FlatButton(
                  child: Text('Detalhes'),
                  onPressed: () => Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => DetalhesDrinkPage(
                                drink: drinks[index].strDrink,
                              ))),
                )
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
