// model das categorias, caso seja necessario acrecentar mais campo ela ira facilitar a escalabilidade
class Drink {
  final String idDrink;
  final String strDrink;
  final String strDrinkThumb;

  Drink({this.idDrink, this.strDrink, this.strDrinkThumb});

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(
        idDrink: json['idDrink'],
        strDrink: json['strDrink'],
        strDrinkThumb: json['strDrinkThumb']);
  }
}
//  exemplo
//  {
//     "strDrink": "155 Belmont",
//     "strDrinkThumb": "https:\/\/www.thecocktaildb.com\/images\/media\/drink\/yqvvqs1475667388.jpg",
//     "idDrink": "15346"
//  }
//  json
