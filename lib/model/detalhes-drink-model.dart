// model das categorias, caso seja necessario acrecentar mais campo ela ira facilitar a escalabilidade
class DetalhesDrink {
  String idDrink;
  String strDrink;
  var strDrinkAlternate;
  var strDrinkES;
  var strDrinkDE;
  var strDrinkFR;
  var strDrinkZHHANS;
  var strDrinkZHHANT;
  String strTags;
  var strVideo;
  String strCategory;
  String strIBA;
  String strAlcoholic;
  String strGlass;
  String strInstructions;
  var strInstructionsES;
  String strInstructionsDE;
  var strInstructionsFR;
  var strInstructionsZHHANS;
  var strInstructionsZHHANT;
  String strDrinkThumb;
  String strIngredient1;
  String strIngredient2;
  String strIngredient3;
  String strIngredient4;
  var strIngredient5;
  var strIngredient6;
  var strIngredient7;
  var strIngredient8;
  var strIngredient9;
  var strIngredient10;
  var strIngredient11;
  var strIngredient12;
  var strIngredient13;
  var strIngredient14;
  var strIngredient15;
  String strMeasure1;
  String strMeasure2;
  String strMeasure3;
  var strMeasure4;
  var strMeasure5;
  var strMeasure6;
  var strMeasure7;
  var strMeasure8;
  var strMeasure9;
  var strMeasure10;
  var strMeasure11;
  var strMeasure12;
  var strMeasure13;
  var strMeasure14;
  var strMeasure15;
  String strImageSource;
  String strImageAttribution;
  String strCreativeCommonsConfirmed;
  String dateModified;

  DetalhesDrink(
      {this.idDrink,
      this.strDrink,
      this.strDrinkAlternate,
      this.strDrinkES,
      this.strDrinkDE,
      this.strDrinkFR,
      this.strDrinkZHHANS,
      this.strDrinkZHHANT,
      this.strTags,
      this.strVideo,
      this.strCategory,
      this.strIBA,
      this.strAlcoholic,
      this.strGlass,
      this.strInstructions,
      this.strInstructionsES,
      this.strInstructionsDE,
      this.strInstructionsFR,
      this.strInstructionsZHHANS,
      this.strInstructionsZHHANT,
      this.strDrinkThumb,
      this.strIngredient1,
      this.strIngredient2,
      this.strIngredient3,
      this.strIngredient4,
      this.strIngredient5,
      this.strIngredient6,
      this.strIngredient7,
      this.strIngredient8,
      this.strIngredient9,
      this.strIngredient10,
      this.strIngredient11,
      this.strIngredient12,
      this.strIngredient13,
      this.strIngredient14,
      this.strIngredient15,
      this.strMeasure1,
      this.strMeasure2,
      this.strMeasure3,
      this.strMeasure4,
      this.strMeasure5,
      this.strMeasure6,
      this.strMeasure7,
      this.strMeasure8,
      this.strMeasure9,
      this.strMeasure10,
      this.strMeasure11,
      this.strMeasure12,
      this.strMeasure13,
      this.strMeasure14,
      this.strMeasure15,
      this.strImageSource,
      this.strImageAttribution,
      this.strCreativeCommonsConfirmed,
      this.dateModified});

  factory DetalhesDrink.fromJson(Map<String, dynamic> json) {
    return DetalhesDrink(
      idDrink: json['idDrink'],
      strDrink: json['strDrink'],
      strDrinkAlternate: json['strDrinkAlternate'],
      strDrinkES: json['strDrinkES'],
      strDrinkDE: json['strDrinkDE'],
      strDrinkFR: json['strDrinkFR'],
      strDrinkZHHANS: json['strDrinkZH-HANS'],
      strDrinkZHHANT: json['strDrinkZH-HANT'],
      strTags: json['strTags'],
      strVideo: json['strVideo'],
      strCategory: json['strCategory'],
      strIBA: json['strIBA'],
      strAlcoholic: json['strAlcoholic'],
      strGlass: json['strGlass'],
      strInstructions: json['strInstructions'],
      strInstructionsES: json['strInstructionsES'],
      strInstructionsDE: json['strInstructionsDE'],
      strInstructionsFR: json['strInstructionsFR'],
      strInstructionsZHHANS: json['strInstructionsZH-HANS'],
      strInstructionsZHHANT: json['strInstructionsZH-HANT'],
      strDrinkThumb: json['strDrinkThumb'],
      strIngredient1: json['strIngredient1'],
      strIngredient2: json['strIngredient2'],
      strIngredient3: json['strIngredient3'],
      strIngredient4: json['strIngredient4'],
      strIngredient5: json['strIngredient5'],
      strIngredient6: json['strIngredient6'],
      strIngredient7: json['strIngredient7'],
      strIngredient8: json['strIngredient8'],
      strIngredient9: json['strIngredient9'],
      strIngredient10: json['strIngredient10'],
      strIngredient11: json['strIngredient11'],
      strIngredient12: json['strIngredient12'],
      strIngredient13: json['strIngredient13'],
      strIngredient14: json['strIngredient14'],
      strIngredient15: json['strIngredient15'],
      strMeasure1: json['strMeasure1'],
      strMeasure2: json['strMeasure2'],
      strMeasure3: json['strMeasure3'],
      strMeasure4: json['strMeasure4'],
      strMeasure5: json['strMeasure5'],
      strMeasure6: json['strMeasure6'],
      strMeasure7: json['strMeasure7'],
      strMeasure8: json['strMeasure8'],
      strMeasure9: json['strMeasure9'],
      strMeasure10: json['strMeasure10'],
      strMeasure11: json['strMeasure11'],
      strMeasure12: json['strMeasure12'],
      strMeasure13: json['strMeasure13'],
      strMeasure14: json['strMeasure14'],
      strMeasure15: json['strMeasure15'],
      strImageSource: json['strImageSource'],
      strImageAttribution: json['strImageAttribution'],
      strCreativeCommonsConfirmed: json['strCreativeCommonsConfirmed'],
      dateModified: json['dateModified'],
    );
  }
}
// exemplo
// {
//   "idDrink": "11007",
//   "strDrink": "Margarita",
//   "strDrinkAlternate": null,
//   "strDrinkES": null,
//   "strDrinkDE": null,
//   "strDrinkFR": null,
//   "strDrinkZH-HANS": null,
//   "strDrinkZH-HANT": null,
//   "strTags": "IBA,ContemporaryClassic",
//   "strVideo": null,
//   "strCategory": "Ordinary DetalhesDrink",
//   "strIBA": "Contemporary Classics",
//   "strAlcoholic": "Alcoholic",
//   "strGlass": "Cocktail glass",
//   "strInstructions": "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.",
//   "strInstructionsES": null,
//   "strInstructionsDE": "Reiben Sie den Rand des Glases mit der Limettenscheibe, damit das Salz daran haftet. Achten Sie darauf, dass nur der \u00e4u\u00dfere Rand angefeuchtet wird und streuen Sie das Salz darauf. Das Salz sollte sich auf den Lippen des Genie\u00dfers befinden und niemals in den Cocktail einmischen. Die anderen Zutaten mit Eis sch\u00fctteln und vorsichtig in das Glas geben.",
//   "strInstructionsFR": null,
//   "strInstructionsZH-HANS": null,
//   "strInstructionsZH-HANT": null,
//   "strDrinkThumb": "https:\/\/www.thecocktaildb.com\/images\/media\/drink\/5noda61589575158.jpg",
//   "strIngredient1": "Tequila",
//   "strIngredient2": "Triple sec",
//   "strIngredient3": "Lime juice",
//   "strIngredient4": "Salt",
//   "strIngredient5": null,
//   "strIngredient6": null,
//   "strIngredient7": null,
//   "strIngredient8": null,
//   "strIngredient9": null,
//   "strIngredient10": null,
//   "strIngredient11": null,
//   "strIngredient12": null,
//   "strIngredient13": null,
//   "strIngredient14": null,
//   "strIngredient15": null,
//   "strMeasure1": "1 1\/2 oz ",
//   "strMeasure2": "1\/2 oz ",
//   "strMeasure3": "1 oz ",
//   "strMeasure4": null,
//   "strMeasure5": null,
//   "strMeasure6": null,
//   "strMeasure7": null,
//   "strMeasure8": null,
//   "strMeasure9": null,
//   "strMeasure10": null,
//   "strMeasure11": null,
//   "strMeasure12": null,
//   "strMeasure13": null,
//   "strMeasure14": null,
//   "strMeasure15": null,
//   "strImageSource": "https:\/\/commons.wikimedia.org\/wiki\/File:Klassiche_Margarita.jpg",
//   "strImageAttribution": "Cocktailmarler",
//   "strCreativeCommonsConfirmed": "Yes",
//   "dateModified": "2015-08-18 14:42:59"
//         }
//   json
