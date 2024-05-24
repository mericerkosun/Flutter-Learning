import 'dart:math';
import 'package:flutter/cupertino.dart';
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  late AnimationController animasyonKontrol;

  late Animation<double> scaleAnimasyonDegerleri;
  late Animation<double> rotateAnimasyonDegerleri;

  bool fabState = false;

  @override
  void initState() {
    super.initState();
    animasyonKontrol = AnimationController(duration: Duration(milliseconds: 200),vsync: this);

    scaleAnimasyonDegerleri = Tween(begin: 0.0, end: 1.0).animate(animasyonKontrol)..addListener(() {
      setState(() {});
    });

    rotateAnimasyonDegerleri = Tween(begin: 0.0, end: pi/2).animate(animasyonKontrol)..addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    animasyonKontrol.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
      floatingActionButton:
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform.scale(
              scale: scaleAnimasyonDegerleri.value,
              child: FloatingActionButton(
                onPressed: (){
                },
                tooltip: 'FAB2',
                backgroundColor: Colors.yellowAccent,
                child: Icon(Icons.photo_camera),
              ),
            ),
            Transform.scale(
              scale: scaleAnimasyonDegerleri.value,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: (){
                  },
                  tooltip: 'FAB1',
                  backgroundColor: Colors.orangeAccent,
                  child: Icon(Icons.alarm),
                ),
              ),
            ),
            Transform.rotate(
              angle: rotateAnimasyonDegerleri.value,
              child: FloatingActionButton(
                onPressed: (){
                  if(fabState){
                    animasyonKontrol.reverse(); // Animasyonu terse çalıştırır.
                    fabState = false;
                  }else{
                    animasyonKontrol.forward();
                    fabState = true;
                  }
                },
                tooltip: 'FAB Main',
                backgroundColor: Colors.red,
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
    );
  }
}
