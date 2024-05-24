import 'package:flutter/material.dart';

// Alpha animation : Görsel nesnelerin transparan hale dönüşümünü sağlar. 0 ile 1 arasında bir değişim olur.
// 0 : Tamamen görünmez, 1 : Tam görünür.

class AlphaAnimation extends StatefulWidget {
  const AlphaAnimation({super.key});

  @override
  State<AlphaAnimation> createState() => _AlphaAnimationState();
}

class _AlphaAnimationState extends State<AlphaAnimation> with TickerProviderStateMixin {
  late AnimationController animasyonKontrol;

  late Animation<double> alphaAnimasyonDegerleri; // Aynı zamanda Scale animasyon değerleri için de kullanılır. Aynı alt yapıya sahiptir.

  @override
  void initState() {
    super.initState();
    animasyonKontrol = AnimationController(duration: Duration(milliseconds: 3000),vsync: this); // Duration özelliği animasyonun ne kadar süreceğini belirtir.

    alphaAnimasyonDegerleri = Tween(begin: 1.0, end: 0.0).animate(animasyonKontrol)
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
            Opacity(opacity: alphaAnimasyonDegerleri.value, // icon saydamlık özelliği
                child: Icon(Icons.cloud, size: 128, color: Colors.white,)),
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