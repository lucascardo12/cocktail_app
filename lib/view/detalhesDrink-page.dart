import 'package:cocktail_app/controller/detalhesDrink-controller.dart';
import 'package:cocktail_app/model/detalhes-drink-model.dart';
import 'package:flutter/material.dart';

class DetalhesDrinkPage extends StatefulWidget {
  DetalhesDrinkPage({Key key, this.drink}) : super(key: key);
  final String drink;
  @override
  _DetalhesDrinkPageState createState() => _DetalhesDrinkPageState();
}

class _DetalhesDrinkPageState extends State<DetalhesDrinkPage> {
  Future<DetalhesDrink> futureDetalhesDrink;

  @override
  void initState() {
    super.initState();
    futureDetalhesDrink = fetchDetalhesDrink(drink: widget.drink);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drink),
      ),
      body: Center(
        child: FutureBuilder<DetalhesDrink>(
          future: futureDetalhesDrink,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var drink = snapshot.data;
              return ListView(children: [
                FadeInImage.assetNetwork(
                  image: drink.strDrinkThumb,
                  placeholder: 'assets/load.gif',
                ),
                Text(drink.strDrink),
                Text('Category: ' + drink.strCategory),
                Text('Alcoholic: ' + drink.strAlcoholic),
                Text('Glass: ' + drink.strGlass),
                Text('IBA: ' + drink.strIBA),
                Text('Instruções de preparo: \n' + drink.strInstructions),
                Text("Ingredientes: " +
                    drink.strIngredient1 +
                    ", " +
                    drink.strIngredient2 +
                    ", " +
                    drink.strIngredient3 +
                    ", " +
                    drink.strIngredient4 +
                    ", " +
                    drink.strIngredient5 +
                    ", " +
                    drink.strIngredient6 +
                    ", " +
                    drink.strIngredient7 +
                    ", " +
                    drink.strIngredient8 +
                    ", " +
                    drink.strIngredient9 +
                    ", " +
                    drink.strIngredient10 +
                    ", " +
                    drink.strIngredient11 +
                    drink.strIngredient12 +
                    ", " +
                    drink.strIngredient13 +
                    ", " +
                    drink.strIngredient14 +
                    ", " +
                    drink.strIngredient15),
              ]);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
