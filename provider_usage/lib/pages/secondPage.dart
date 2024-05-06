import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_usage/providers/SayacModel.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("",style: TextStyle(fontSize: 36),),
            Consumer<SayacModel>(
              builder: (context, sayacModelNesne, child){
                return Text("${sayacModelNesne.sayacOku()}",style: TextStyle(fontSize: 36),);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer<SayacModel>(
                  builder: (context, sayacModelNesne, child){
                    return ElevatedButton(
                      onPressed: (){
                        sayacModelNesne.sayacAzalt(1);
                      },
                      child: Text("-",style: TextStyle(fontSize: 25),),
                    );
                  },
                ),
                Consumer<SayacModel>(
                  builder: (context, sayacModelNesne, child){
                    return ElevatedButton(
                      onPressed: (){
                        sayacModelNesne.sayacArttir();
                      },
                      child: Text("+",style: TextStyle(fontSize: 25),),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
