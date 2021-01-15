import 'dart:convert';
import 'package:cocktail_app/model/alcoolico-model.dart';
import 'package:cocktail_app/model/categoria-model.dart';
import 'package:cocktail_app/model/ingrediente-model.dart';
import 'package:cocktail_app/model/vidro-model.dart';
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

Future<List<Alcoolico>> getFilterAlcoolico({String filtro}) async {
  final response = await http
      .get('https://www.thecocktaildb.com/api/json/v1/1/list.php?a=list');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> records = await jsonDecode(response.body)['drinks'];

    return records.map((e) => Alcoolico.fromJson(e)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<List<Categoria>> getFilterCategoria({String filtro}) async {
  final response = await http
      .get('https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> records = await jsonDecode(response.body)['drinks'];

    return records.map((e) => Categoria.fromJson(e)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<List<Ingredientes>> getFilterIngredientes({String filtro}) async {
  final response = await http
      .get('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> records = await jsonDecode(response.body)['drinks'];

    return records.map((e) => Ingredientes.fromJson(e)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<List<Vidro>> getFilterVidro({String filtro}) async {
  final response = await http
      .get('https://www.thecocktaildb.com/api/json/v1/1/list.php?g=list');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> records = await jsonDecode(response.body)['drinks'];

    return records.map((e) => Vidro.fromJson(e)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
