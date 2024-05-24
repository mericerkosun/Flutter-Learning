import 'package:flutter/material.dart';

// Görsel nesnesin x ve y koordinatlarında hareket etmesi işlemidir.

class TranslateAnimation extends StatefulWidget {
  const TranslateAnimation({super.key});

  @override
  State<TranslateAnimation> createState() => _TranslateAnimationState();
}

class _TranslateAnimationState extends State<TranslateAnimation> with TickerProviderStateMixin {

  late AnimationController animasyonKontrol;

  late Animation<double> translateAnimasyonDegerleri;

  @override
  void initState() {
    super.initState();
    animasyonKontrol = AnimationController(duration: Duration(milliseconds: 1000),vsync: this); // Duration özelliği animasyonun ne kadar süreceğini belirtir.

    translateAnimasyonDegerleri = Tween(begin: 0.0, end: 50.0)
        .animate(CurvedAnimation(parent: animasyonKontrol, curve: Curves.elasticInOut)) // Animasyona ivme ekler. Curves. sınıfı içerisinde birçok çeşit mevcut.
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
            Transform.translate(
                offset: Offset(0.0, translateAnimasyonDegerleri.value), // Text sayfada ilk göründüğü andaki konumunu 0.0 , 0.0 olarak kabul eder ve belirtilen değerler kadar hareket eder. Hangi tarafa yerleştirildiği x ve y koordinatlarını belirtir.
                child: Text("Hava Durumu", style: TextStyle(fontSize: 36,color: Colors.white),)),
            SizedBox(height: 50,width: 250,
              child: ElevatedButton(
                child: Text("Başla",style: TextStyle(color : Colors.white, fontSize: 18),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
                onPressed: (){
                  // animasyonKontrol.forward(); // Animasyonu başlatır.
                  animasyonKontrol.repeat(reverse: true); // Animasyon tekrar eder. reverse = true => ping pong efekt.
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
