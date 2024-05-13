import 'package:flutter_json_parse/Kategoriler.dart';
import 'package:flutter_json_parse/Yonetmenler.dart';

class Filmler {
  String film_id;
  String film_ad;
  String film_yil;
  String film_resim;
  Kategoriler kategori;
  Yonetmenler yonetmen;

  Filmler(this.film_id, this.film_ad, this.film_yil, this.film_resim,
      this.kategori, this.yonetmen);

  factory Filmler.fromJson(Map<String,dynamic> json){
     return Filmler(json["film_id"] as String, 
         json["film_ad"] as String, 
         json["film_yil"] as String,
         json["film_resim"] as String, 
         Kategoriler.fromJson(json["kategori"]), 
         Yonetmenler.fromJson(json["yonetmen"]));
  }
}