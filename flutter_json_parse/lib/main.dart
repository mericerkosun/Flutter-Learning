import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_json_parse/Filmler.dart';
import 'package:flutter_json_parse/FilmlerCevap.dart';
import 'package:flutter_json_parse/Kisiler.dart';
import 'package:flutter_json_parse/KisilerCevap.dart';
import 'package:flutter_json_parse/Mesajlar.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void mesajParse(){
    String strVeri = '{ "mesajlar" : { "mesaj_kod" : 1,"mesaj_icerik" : "başarılı"  } }';

    var jsonVeri = json.decode(strVeri);

    var jsonNesne = jsonVeri["mesajlar"];

    var mesaj = Mesajlar.fromJson(jsonNesne);

    print("Mesaj kod : ${mesaj.mesaj_kod}");
    print("Mesaj içerik : ${mesaj.mesaj_icerik}");

  }

  void kisilerParse(){
    String strVeri = '{"kisiler":[{"kisi_id":"1","kisi_ad":"Ahmet","kisi_tel":"12312312"}'
        ',{"kisi_id":"2","kisi_ad":"Mehmet","kisi_tel":"912318212"}]}';

    var jsonVeri = json.decode(strVeri);

    var jsonArray = jsonVeri["kisiler"] as List;

    List<Kisiler> kisilerListesi = jsonArray.map((jsonArrayNesnesi) => Kisiler.fromJson(jsonArrayNesnesi)).toList();

    for(var k in kisilerListesi){
      print("****************");
      print("Kişi id : ${k.kisi_id}");
      print("Kişi ad : ${k.kisi_ad}");
      print("Kişi tel : ${k.kisi_tel}");
    }
  }


  void kisilerCevapParse(){
    String strVeri = '{"success":1,"kisiler":[{"kisi_id":"1","kisi_ad":"Ahmet","kisi_tel":"12312312"},'
        '{"kisi_id":"2","kisi_ad":"Mehmet","kisi_tel":"912318212"}]}';

    var jsonVeri = json.decode(strVeri);

    var kisilerCevap = KisilerCevap.fromJson(jsonVeri);

    print("Success : ${kisilerCevap.success}");

    List<Kisiler> kisilerListesi = kisilerCevap.kisilerListesi;

    for(var k in kisilerListesi){
      print("****************");
      print("Kişi id : ${k.kisi_id}");
      print("Kişi ad : ${k.kisi_ad}");
      print("Kişi tel : ${k.kisi_tel}");
    }

  }

  void filmlerCevapParse(){
    String strVeri = '{"success":1,"filmler":[{"film_id":"1","film_ad":"Interstellar"'
        ',"film_yil":"2015","film_resim":"interstellar.png",'
        '"kategori":{"kategori_id":"4","kategori_ad":"Bilim Kurgu"},'
        '"yonetmen":{"yonetmen_id":"1","yonetmen_ad":"Christopher Nolan"}},'
        '{"film_id":"3","film_ad":"The Pianist","film_yil":"2002","film_resim":"thepianist.png",'
        '"kategori":{"kategori_id":"3","kategori_ad":"Drama"},'
        '"yonetmen":{"yonetmen_id":"4","yonetmen_ad":"Roman Polanski"}}]}';

    var jsonVeri = json.decode(strVeri);

    var filmlerCevap = FilmlerCevap.fromJson(jsonVeri);

    int success = filmlerCevap.success;

    List<Filmler> filmlerListesi = filmlerCevap.filmlerListesi;

    print("Success : $success");

    for(var f in filmlerListesi){
      print("****************");
      print("Film id : ${f.film_id}");
      print("Film ad : ${f.film_ad}");
      print("Film yıl : ${f.film_yil}");
      print("Film resim : ${f.film_resim}");
      print("Film kategori : ${f.kategori.kategori_ad}");
      print("Film yönetmen : ${f.yonetmen.yonetmen_ad}");
    }

  }

  @override
  void initState() {
    super.initState();
    //mesajParse();
    //kisilerParse();
    //kisilerCevapParse();
    filmlerCevapParse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
