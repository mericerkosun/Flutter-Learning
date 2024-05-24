import 'dart:math';

import 'package:flutter/material.dart';

// Rotate Animation : Görsel nesnelerin döndürülme işlemidir.
// Radyan cinsinden dönme işlemi sağlanır.
// Belirlenen açı değerleri arasında dönme animasyonu gerçekleşir.

class RotateAnimation extends StatefulWidget {
  const RotateAnimation({super.key});

  @override
  State<RotateAnimation> createState() => _RotateAnimationState();
}

class _RotateAnimationState extends State<RotateAnimation> with TickerProviderStateMixin {

  late AnimationController animasyonKontrol;

  late Animation<double> rotateAnimasyonDegerleri;

  @override
  void initState() {
    super.initState();
    animasyonKontrol = AnimationController(duration: Duration(milliseconds: 3000),vsync: this); // Duration özelliği animasyonun ne kadar süreceğini belirtir.

    rotateAnimasyonDegerleri = Tween(begin: 0.0, end: pi/2).animate(animasyonKontrol)
      ..addListener(() {
        setState(() {

        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    animasyonKontrol.dispose(); // Uygulama arka plana gittiğinde animasyon durur.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.cloud, size: 128, color: Colors.white,),
            Transform.rotate(
                angle: rotateAnimasyonDegerleri.value,
                child: Text("Hava Durumu", style: TextStyle(fontSize: 36,color: Colors.white),)),
            SizedBox(height: 50,width: 250,
              child: ElevatedButton(
                child: Text("Başla",style: TextStyle(color : Colors.white, fontSize: 18),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
                onPressed: (){
                  animasyonKontrol.forward(); // Animasyonu başlatır.
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
