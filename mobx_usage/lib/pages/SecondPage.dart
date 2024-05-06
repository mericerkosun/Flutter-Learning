import 'package:flutter/material.dart';
import 'package:mobx_usage/SayacModel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SecondPage extends StatelessWidget {

  var sayacModelNesne = SayacModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MobX - Second Page"),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Observer(
                builder: (_){
                  return Text("${sayacModelNesne.sayac}",style: TextStyle(fontSize: 35),);
                }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    sayacModelNesne.sayacAzalt(1);
                  },
                  child: Text("-",style: TextStyle(fontSize: 25),),
                ),
                ElevatedButton(
                  onPressed: (){
                    sayacModelNesne.sayacArttir();
                  },
                  child: Text("+",style: TextStyle(fontSize: 25),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
