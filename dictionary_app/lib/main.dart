import 'package:dictionary_app/DetaySayfa.dart';
import 'package:dictionary_app/Kelimeler.dart';
import 'package:dictionary_app/KelimelerDAO.dart';
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

  Future<List<Kelimeler>> tumKelimeleriGoster() async {
    var kelimelerListesi = await KelimelerDAO().tumKelimeler();
    return kelimelerListesi;
  }

  Future<List<Kelimeler>> aramaYap(String arananKelime) async {
    var kelimelerListesi = await KelimelerDAO().kelimeAra(arananKelime);
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
        future: aktifArama ? aramaYap(arananKelime) : tumKelimeleriGoster(),
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
