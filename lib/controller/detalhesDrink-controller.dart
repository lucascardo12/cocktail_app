import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cocktail_app/model/detalhes-drink-model.dart';

Future<DetalhesDrink> fetchDetalhesDrink({String drink}) async {
  final response = await http
      .get('https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$drink');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    var records = await jsonDecode(response.body)['drinks'][0];
    return DetalhesDrink.fromJson(records);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
