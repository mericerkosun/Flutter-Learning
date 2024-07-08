import 'dart:collection';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Kisiler.dart';
import 'package:flutter_firebase/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Veri yazılacak tablonun seçilmesi.
  // var refTest = FirebaseDatabase.instance.ref().child("test");

  var refKisiler = FirebaseDatabase.instance.ref().child("kisiler_tablo");

  Future<void> kisiEkle() async {
    var bilgi = HashMap<String, dynamic>();
    bilgi["kisi_ad"] = "Alp";
    bilgi["kisi_yas"] = 5;

    refKisiler.push().set(bilgi);
  }
  
  Future<void> kisiSil() async {
    refKisiler.child("-Ny1ezidlfQuLTuul9-H").remove(); // Kayda ait key yazılarak o kayıt silinir.
  }

  Future<void> kisiGuncelle() async {
    var guncelBilgi = HashMap<String, dynamic>();
    guncelBilgi["kisi_ad"] = "Batuhan";
    guncelBilgi["kisi_yas"] = 23;

    refKisiler.child("-Ny1fF-lPYRoejOyyB8B").update(guncelBilgi);
  }

  // !!! Veritabanındaki her değişikliği anlık olarak uygulamaya iletir.
  Future<void> tumKisiler() async {

    refKisiler.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;

      if(gelenDegerler != null){

        gelenDegerler.forEach((key,nesne){
          var gelenKisi = Kisiler.fromJson(nesne);
          print("****************");
          print("Kişi key : $key");
          print("Kişi adı : ${gelenKisi.kisi_ad}");
          print("Kişi yaş : ${gelenKisi.kisi_yas}");
        });
      }
    });
  }

  // Verileri anlık olarak değil, method ne zaman çağırılırsa o zaman okur.
  Future<void> tumKisilerOnce() async {

    refKisiler.once().then((value){
      var gelenDegerler = value.snapshot.value as dynamic;

      if(gelenDegerler != null){

        gelenDegerler.forEach((key,nesne){
          var gelenKisi = Kisiler.fromJson(nesne);
          print("****************");
          print("Kişi key : $key");
          print("Kişi adı : ${gelenKisi.kisi_ad}");
          print("Kişi yaş : ${gelenKisi.kisi_yas}");
        });
      }
    });
  }

  Future<void> esitlikArama() async {

    var sorgu = refKisiler.orderByChild("kisi_ad").equalTo("Alp");

    sorgu.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;

      if(gelenDegerler != null){

        gelenDegerler.forEach((key,nesne){
          var gelenKisi = Kisiler.fromJson(nesne);
          print("****************");
          print("Kişi key : $key");
          print("Kişi adı : ${gelenKisi.kisi_ad}");
          print("Kişi yaş : ${gelenKisi.kisi_yas}");
        });
      }
    });
  }

  // "First" veya "Last" belirtecine göre baştan veya sonran belirtilen sayı kadar kayıt getirir.
  Future<void> limitliVeri() async {

    var sorgu = refKisiler.limitToFirst(2);
    // var sorgu = refKisiler.limitToLast(2);

    sorgu.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;

      if(gelenDegerler != null){

        gelenDegerler.forEach((key,nesne){
          var gelenKisi = Kisiler.fromJson(nesne);
          print("****************");
          print("Kişi key : $key");
          print("Kişi adı : ${gelenKisi.kisi_ad}");
          print("Kişi yaş : ${gelenKisi.kisi_yas}");
        });
      }
    });
  }

  // startAt ve endAt ile değer aralığında veri alma.
  Future<void> degerAraligi() async {

    var sorgu = refKisiler.orderByChild("kisi_yas").startAt(10).endAt(30);

    sorgu.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;

      if(gelenDegerler != null){

        gelenDegerler.forEach((key,nesne){
          var gelenKisi = Kisiler.fromJson(nesne);
          print("****************");
          print("Kişi key : $key");
          print("Kişi adı : ${gelenKisi.kisi_ad}");
          print("Kişi yaş : ${gelenKisi.kisi_yas}");
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // kisiEkle();
    // kisiSil();
    // kisiGuncelle();
    // tumKisiler();
    // tumKisilerOnce();
    // esitlikArama();
    // limitliVeri();
    degerAraligi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
