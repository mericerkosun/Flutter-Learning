import 'package:dictionary_app/DetaySayfa.dart';
import 'package:dictionary_app/Kelimeler.dart';
import 'package:flutter/material.dart';

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
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool aktifArama = false;
  String arananKelime = "";

  Future<List<Kelimeler>> tumKelimeler() async {
    var kelimelerListesi = <Kelimeler>[];

    var k1 = Kelimeler(1, "dog", "köpek");
    var k2 = Kelimeler(2, "cat", "kedi");
    var k3 = Kelimeler(3, "car", "araba");

    kelimelerListesi.add(k1);
    kelimelerListesi.add(k2);
    kelimelerListesi.add(k3);

    return kelimelerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: aktifArama ?
          TextField(
            decoration: InputDecoration(hintText: "Aramak için bir şeyler yazın..."),
            onChanged: (aramaSonucu){
              print("Arama Sonucu : $aramaSonucu");
              setState(() {
                arananKelime = aramaSonucu;
              });
            },
          ):
            Text("Sözlük Uygulaması"),
        actions: [
          aktifArama ?
              IconButton(
                icon: Icon(Icons.cancel),
                onPressed: (){
                  setState(() {
                    aktifArama = false;
                    arananKelime = "";
                  });
                },
              )
              :
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              setState(() {
                aktifArama = true;
              });
            },
          )
        ],
      ),
      body: FutureBuilder<List<Kelimeler>>(
        future: tumKelimeler(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            var kelimelerListesi = snapshot.data;
            return ListView.builder(
              itemCount: kelimelerListesi!.length,
              itemBuilder: (context,i){
                var kelime = kelimelerListesi[i];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kelime)));
                  },
                  child: SizedBox(
                    height: 50,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(kelime.ingilizce, style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(kelime.turkce),
                          ],
                        ),
                      ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      )
    );
  }
}
