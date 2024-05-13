import 'package:flutter_json_parse/Filmler.dart';

class FilmlerCevap {
  int success;
  List<Filmler> filmlerListesi;

  FilmlerCevap(this.success, this.filmlerListesi);

  factory FilmlerCevap.fromJson(Map<String,dynamic> json){

    var jsonArray = json["filmler"] as List;
    List<Filmler> filmlerListesi = jsonArray.map((jsonArrayNesnesi) => Filmler.fromJson(jsonArrayNesnesi)).toList();

    return FilmlerCevap(json["success"] as int, filmlerListesi);
  }
}