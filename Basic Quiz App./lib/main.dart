import 'package:flutter/material.dart';
import 'package:quiz_uygulamasi/quizEkrani.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Quize Hoşgeldiniz", style: TextStyle(fontSize: 30)),
            Container(
              height: 150,
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text("BAŞLA", style: TextStyle(fontSize: 20)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuizEkrani()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
