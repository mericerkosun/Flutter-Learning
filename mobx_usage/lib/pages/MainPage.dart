import 'package:flutter/material.dart';
import 'package:mobx_usage/pages/SecondPage.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MobX - Main Page"),
      backgroundColor: Colors.lightGreenAccent,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("0",style: TextStyle(fontSize: 35),),
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
