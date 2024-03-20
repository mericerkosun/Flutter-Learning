import 'package:quiz_app/Bayraklar.dart';
import 'package:quiz_app/VeritabaniYardimcisi.dart';

class BayraklarDAO {

  Future<List<Bayraklar>> rastgele5SoruGetir() async {

    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 5");

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Bayraklar(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
    });

  }

  Future<List<Bayraklar>> rastgele3YanlisGetir(int dogruID) async {

    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar WHERE bayrak_id != $dogruID ORDER BY RANDOM() LIMIT 3");

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Bayraklar(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
    });
  }

}