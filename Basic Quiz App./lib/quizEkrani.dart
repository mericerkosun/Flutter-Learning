import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:quiz_uygulamasi/Bayraklar.dart';
import 'package:quiz_uygulamasi/BayraklarDAO.dart';
import 'package:quiz_uygulamasi/sonucEkrani.dart';

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({super.key});

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {

  var sorular = <Bayraklar>[];
  var yanlisSecenekler = <Bayraklar>[];
  late Bayraklar dogruSoru;
  var tumSecenekler = HashSet<Bayraklar>();

  int soruSayac = 0;
  int dogruSayac = 0;
  int yanlisSayac = 0;

  String bayrakResimAdi = "placeholder.png";
  String butonYaziA = "";
  String butonYaziB = "";
  String butonYaziC = "";
  String butonYaziD = "";

  @override
  void initState(){
    super.initState();
    sorulariAl();
  }

  Future<void> sorulariAl() async {
    sorular = await BayraklarDAO().rastgele5Getir();
    soruYukle();
  }

  Future<void> soruYukle() async {
    dogruSoru = sorular[soruSayac];

    bayrakResimAdi = dogruSoru.bayrak_resim;

    yanlisSecenekler = await BayraklarDAO().rastgele3YanlisGetir(dogruSoru.bayrak_id);

    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(yanlisSecenekler[0]);
    tumSecenekler.add(yanlisSecenekler[1]);
    tumSecenekler.add(yanlisSecenekler[2]);

    butonYaziA = tumSecenekler.elementAt(0).bayrak_ad;
    butonYaziB = tumSecenekler.elementAt(1).bayrak_ad;
    butonYaziC = tumSecenekler.elementAt(2).bayrak_ad;
    butonYaziD = tumSecenekler.elementAt(3).bayrak_ad;

    setState(() {

    });
  }

  void soruSayacKontrol(){
    soruSayac = soruSayac + 1;

    if(soruSayac != 5){
      soruYukle();
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(dogruSayac)));
    }
  }

  void dogruKontrol(String butonYazi){
    if(dogruSoru.bayrak_ad == butonYazi){
      dogruSayac = dogruSayac + 1;
    }else{
      yanlisSayac = yanlisSayac + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Quiz Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Doğru : $dogruSayac"),
                  Text("Yanlış : $yanlisSayac"),
                ],
              ),
            ),
            Text("1. Soru", style: TextStyle(fontSize: 25),),
            Image.asset("resimler/$bayrakResimAdi"),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                child: Text(butonYaziA, style: TextStyle(fontSize: 20),),
                onPressed: (){
                  dogruKontrol(butonYaziA);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                child: Text(butonYaziB, style: TextStyle(fontSize: 20),),
                onPressed: (){
                  dogruKontrol(butonYaziB);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                child: Text(butonYaziC, style: TextStyle(fontSize: 20),),
                onPressed: (){
                  dogruKontrol(butonYaziC);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                child: Text(butonYaziD, style: TextStyle(fontSize: 20),),
                onPressed: (){
                  dogruKontrol(butonYaziD);
                  soruSayacKontrol();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
