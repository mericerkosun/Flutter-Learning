import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_usage/pages/secondPage.dart';

import '../providers/SayacModel.dart';

class firstPage extends StatelessWidget {
  const firstPage({super.key});

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
            Consumer<SayacModel>(
              builder: (context, sayacModelNesne, child){
                return Text("${sayacModelNesne.sayacOku()}",style: TextStyle(fontSize: 36),);
              },
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
              },
              child: Text("Second Page",style: TextStyle(fontSize: 25),),
            )
          ],
        ),
      ),
    );
  }
}
