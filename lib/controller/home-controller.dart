import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cocktail_app/model/drink-model.dart';

Future<List<Drink>> getDrink({String filtro}) async {
  final response = await http
      .get('https://www.thecocktaildb.com/api/json/v1/1/filter.php?$filtro');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> records = await jsonDecode(response.body)['drinks'];

    return records.map((e) => Drink.fromJson(e)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
