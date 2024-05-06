import 'package:block_usage/SayacCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Block - Second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlocBuilder<SayacCubit,int>(
              builder: (context, sayacDegeri){
                return Text("$sayacDegeri",style: TextStyle(fontSize: 35),);
              },
            ),
            ElevatedButton(
              onPressed: (){
                context.read<SayacCubit>().sayacArttir();
              },
              child: Text("+", style: TextStyle(fontSize: 25),),
            ),
            ElevatedButton(
              onPressed: (){
                context.read<SayacCubit>().sayacAazalt(1);
              },
              child: Text("-", style: TextStyle(fontSize: 25),),
            ),
          ],
        ),
      ),
    );
  }
}
