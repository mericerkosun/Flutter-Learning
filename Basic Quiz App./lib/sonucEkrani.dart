import 'package:flutter/material.dart';
import 'package:quiz_uygulamasi/main.dart';

class SonucEkrani extends StatefulWidget {
  int dogruSayisi;

  SonucEkrani(this.dogruSayisi);

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("${widget.dogruSayisi} Doğru - ${5-widget.dogruSayisi} Yanlış", style: TextStyle(fontSize: 30),),
            Text("%${(widget.dogruSayisi * 100 / 5).toInt()} Başarı", style: TextStyle(fontSize: 30, color: Colors.pinkAccent),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Tekrar Dene", style: TextStyle(fontSize: 20),),
                onPressed: (){
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
