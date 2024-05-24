import 'package:flutter/material.dart';

// Scale Animation : Görsel nesnelerin boyutunu değiştirmek için kullanılır.

class ScaleAnimation extends StatefulWidget {
  const ScaleAnimation({super.key});

  @override
  State<ScaleAnimation> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation> with TickerProviderStateMixin{

  late AnimationController animasyonKontrol;

  late Animation<double> scaleAnimasyonDegerleri;

  @override
  void initState() {
    super.initState();
    animasyonKontrol = AnimationController(duration: Duration(milliseconds: 3000),vsync: this); // Duration özelliği animasyonun ne kadar süreceğini belirtir.

    scaleAnimasyonDegerleri = Tween(begin: 128.0, end: 250.0).animate(animasyonKontrol)
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
            Icon(Icons.cloud, size: scaleAnimasyonDegerleri.value, color: Colors.white,),
            Text("Hava Durumu", style: TextStyle(fontSize: 36,color: Colors.white),),
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
