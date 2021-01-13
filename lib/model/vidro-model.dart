// model Vidro, caso seja necessario acrecentar mais campo ela ira facilitar a escalabilidade
class Vidro {
  final String strGlass;

  Vidro({this.strGlass});

  factory Vidro.fromJson(Map<String, dynamic> json) {
    return Vidro(
      strGlass: json['strGlass'],
    );
  }
}
// exemplo {"strGlass":"Highball glass"} json
