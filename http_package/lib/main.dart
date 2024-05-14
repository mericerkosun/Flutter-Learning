import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http_package/Kisiler.dart';
import 'package:http_package/KisilerCevap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Kisiler> parseKisilerCevap(String cevap) {
    return KisilerCevap.fromJson(json.decode(cevap)).kisilerListesi;
  }

  Future<List<Kisiler>> tumKisiler() async {
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php");
    var cevap = await http.get(url);
    return parseKisilerCevap(cevap.body);
  }

  Future<List<Kisiler>> kisilerAra(String aramaKelimesi) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php");

    // Gönderilecek veriler : Parametre değerleri String olmalı.
    var veri = {"kisi_ad" : aramaKelimesi};

    // Webservisin post yöntemi ile çalıştırılıp gönderilmesi.
    var cevap = await http.post(url, body: veri);
    
    return parseKisilerCevap(cevap.body);
  }

  Future<void> kisiSil(int kisi_id) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php");
    
    var veri = {"kisi_id" : kisi_id.toString()};
    
    var cevap = await http.post(url, body: veri);

    print("Kişi sil cevap : ${cevap.body}");
  }

  Future<void> kisiEkle(String kisi_ad, String kisi_tel) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php");
    
    var veri = {"kisi_ad" : kisi_ad, "kisi_tel" : kisi_tel};
    
    var cevap = await http.post(url, body: veri);

    print("Kişi ekle cevap : ${cevap.body}");
  }
  
  Future<void> kisiGuncelle(int kisi_id, String kisi_ad, String kisi_tel) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/update_kisiler.php");
    
    var veri = {"kisi_id" : kisi_id.toString(), "kisi_ad" : kisi_ad, "kisi_tel" : kisi_tel};
    
    var cevap = await http.post(url, body: veri);

    print("Kişi güncelle cevap : ${cevap.body}");
  }

  Future<void> kisileriGoster() async {
    var liste = await kisilerAra("rambo");

    for(var k in liste){
      print("********");
      print("Kişi id : ${k.kisi_id}");
      print("Kişi ad : ${k.kisi_ad}");
      print("Kişi tel : ${k.kisi_tel}");
    }
  }

  @override
  void initState() {
    super.initState();
    //kisileriGoster();
    //kisiSil(17244);
    //kisiEkle("Behzat Ç.", "0606");
    kisiGuncelle(17247, "Behzat C.", "0606");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("HTTP Package"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
