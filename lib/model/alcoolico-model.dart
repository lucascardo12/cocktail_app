// model das categorias, caso seja necessario acrecentar mais campo ela ira facilitar a escalabilidade
class Alcoolico {
  final String strAlcoholic;

  Alcoolico({this.strAlcoholic});

  factory Alcoolico.fromJson(Map<String, dynamic> json) {
    return Alcoolico(
      strAlcoholic: json['strAlcoholic'],
    );
  }
}
//// exemplo {"strAlcoholic":"Alcoholic"} json
