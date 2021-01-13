// model das categorias, caso seja necessario acrecentar mais campo ela ira facilitar a escalabilidade
class Categoria {
  final String strCategory;

  Categoria({this.strCategory});

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      strCategory: json['strCategory'],
    );
  }
}
//// exemplo {"strCategory":"Ordinary Drink"} json
