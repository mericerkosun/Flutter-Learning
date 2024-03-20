import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:quiz_app/Bayraklar.dart';
import 'package:quiz_app/BayraklarDAO.dart';
import 'package:quiz_app/SonucEkrani.dart';

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({super.key});

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {

  var sorular = <Bayraklar>[];
  var yanlisSecenekler = <Bayraklar>[];
  late Bayraklar dogruCevap;
  var tumSecenekler = HashSet<Bayraklar>();

  int soruSayac = 0;
  int dogruSayac = 0;
  int yanlisSayac = 0;

  String bayrakResimAdi = "placeholder.png";
  String butonYaziA = "";
  String butonYaziB = "";
  String butonYaziC = "";
  String butonYaziD = "";

  Future<void> soruAl() async {
    sorular = await BayraklarDAO().rastgele5SoruGetir();
    soruYukle();
  }

  Future<void> soruYukle() async {
    dogruCevap = sorular[soruSayac];
    bayrakResimAdi = dogruCevap.bayrak_resim;
    yanlisSecenekler = await BayraklarDAO().rastgele3YanlisGetir(dogruCevap.bayrak_id);

    tumSecenekler.clear();
    tumSecenekler.add(dogruCevap);
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
    if(dogruCevap.bayrak_ad == butonYazi){
      dogruSayac = dogruSayac + 1;
    }else{
      yanlisSayac = yanlisSayac + 1;
    }
  }

  @override
  void initState() {
    super.initState();
    soruAl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Quiz Ekrani"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Doğru : $dogruSayac", style: TextStyle(fontSize: 20),),
                Text("Yanlış : $yanlisSayac", style: TextStyle(fontSize: 20),),
              ],
            ),
            Text("${soruSayac+1}. Soru", style: TextStyle(fontSize: 20),),
            Container(
              height: 250,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('resimler/$bayrakResimAdi'),
                      fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.black45, width: 3 ),
                  borderRadius: BorderRadius.circular(20)
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                child: Text("$butonYaziA", style: TextStyle(fontSize: 20),),
                onPressed: (){
                  dogruKontrol(butonYaziA);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                child: Text("$butonYaziB", style: TextStyle(fontSize: 20),),
                onPressed: (){
                  dogruKontrol(butonYaziB);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                child: Text("$butonYaziC", style: TextStyle(fontSize: 20),),
                onPressed: (){
                  dogruKontrol(butonYaziC);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                child: Text("$butonYaziD", style: TextStyle(fontSize: 20),),
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
