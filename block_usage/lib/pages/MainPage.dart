import 'package:block_usage/SayacCubit.dart';
import 'package:block_usage/pages/SecondPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Block - Main Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<SayacCubit,int>(
              builder: (context, sayacDegeri){
                return Text("$sayacDegeri",style: TextStyle(fontSize: 35),);
              },
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
              },
              child: Text("Second Page", style: TextStyle(fontSize: 25),),
            ),
          ],
        ),
      ),
    );
  }
}
