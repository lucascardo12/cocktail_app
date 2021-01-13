// model Ingredientes , caso seja necessario acrecentar mais campo ela ira facilitar a escalabilidade
class Ingredientes {
  final String strIngredient1;

  Ingredientes({this.strIngredient1});

  factory Ingredientes.fromJson(Map<String, dynamic> json) {
    return Ingredientes(
      strIngredient1: json['strIngredient1'],
    );
  }
}
// exemplo {"strIngredient1":"Light rum"} json
