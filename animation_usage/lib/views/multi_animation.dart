import 'package:flutter/material.dart';

// Nesneye farklı animasyonlar eklenebilir. Bu örnekte hem translate hem scale animasyonları ivmeli bir şekilde mevcut.

class MultiAnimation extends StatefulWidget {
  const MultiAnimation({super.key});

  @override
  State<MultiAnimation> createState() => _MultiAnimationState();
}

class _MultiAnimationState extends State<MultiAnimation> with TickerProviderStateMixin {

  late AnimationController animasyonKontrol;

  late Animation<double> scaleAnimasyonDegerleri;
  late Animation<double> translateAnimasyonDegerleri;

  @override
  void initState() {
    super.initState();
    animasyonKontrol = AnimationController(duration: Duration(milliseconds: 1000),vsync: this); // Duration özelliği animasyonun ne kadar süreceğini belirtir.

    scaleAnimasyonDegerleri = Tween(begin: 36.0, end: 50.0).animate(animasyonKontrol)
      ..addListener(() {
        setState(() {

        });
      });

    translateAnimasyonDegerleri = Tween(begin: 0.0, end: 25.0)
        .animate(CurvedAnimation(parent: animasyonKontrol, curve: Curves.fastEaseInToSlowEaseOut))
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
              offset: Offset(0.0, translateAnimasyonDegerleri.value),
                child: Text("Hava Durumu", style: TextStyle(fontSize: scaleAnimasyonDegerleri.value,color: Colors.white),)),
            SizedBox(height: 50,width: 250,
              child: ElevatedButton(
                child: Text("Başla",style: TextStyle(color : Colors.white, fontSize: 18),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
                onPressed: (){
                  animasyonKontrol.repeat(reverse: true);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
