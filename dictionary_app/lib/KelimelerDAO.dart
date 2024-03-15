import 'package:dictionary_app/Kelimeler.dart';
import 'package:dictionary_app/VeritabaniYardimcisi.dart';

class KelimelerDAO {

  Future<List<Kelimeler>> tumKelimeler() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM kelimeler");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kelimeler(satir["kelime_id"], satir["ingilizce"], satir["turkce"]);
    });
  }

  Future<List<Kelimeler>> kelimeAra(String arananKelime) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM kelimeler WHERE ingilizce like '%$arananKelime%'");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kelimeler(satir["kelime_id"], satir["ingilizce"], satir["turkce"]);
    });
  }
}