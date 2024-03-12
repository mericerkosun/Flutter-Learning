import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi {

  static final String veritabaniAdi = "quizuygulamasi.sqlite"; // Veritabanı ismi oluşturuldu.

  static Future<Database> veritabaniErisim() async {
    String veritabaniYolu = join(await getDatabasesPath(), veritabaniAdi); // Uygulama içindeki veritabanı yoluna veritabanımızın ismini ekleyerek yolunu oluşturduk.

    if(await databaseExists(veritabaniYolu)){ // Veritabanı daha önce kopyalandı mı kontrolü
      print("Veritabanı zaten var. Kopyalamaya gerek yok.");
    }else{
      ByteData data = await rootBundle.load("veritabani/$veritabaniAdi"); // veritabanına erişecek
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes); // Byte'a dönüştürecek
      await File(veritabaniYolu).writeAsBytes(bytes, flush: true); // Kopyalayacak
      print("Veritabanı kopyalandı.");
    }

    return openDatabase(veritabaniYolu);
  }
}