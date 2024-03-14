import 'package:dictionary_app/Kelimeler.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {
  Kelimeler kelime;

  DetaySayfa(this.kelime);

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Detay Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(widget.kelime.ingilizce, style: TextStyle(color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),),
            Text(widget.kelime.turkce, style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
