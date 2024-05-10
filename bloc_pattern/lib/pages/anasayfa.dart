import 'package:bloc_pattern/AnasayfaCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  TextEditingController sayi1Controller = TextEditingController();
  TextEditingController sayi2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Bloc Pattern"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<AnasayfaCubit,int>(
              builder: (context,sonuc){ // Veriyi dinleme sonucunda gelen değer.
                return Text(sonuc.toString(), style: const TextStyle(fontSize: 30),);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 32.0, left: 32.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Sayı 1",
                ),
                controller: sayi1Controller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 32.0, left: 32.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Sayı 2",
                ),
                controller: sayi2Controller,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text("Toplama", style: TextStyle(fontSize: 21),),
                  onPressed: (){
                    int sayi1 = int.parse(sayi1Controller.text);
                    int sayi2 = int.parse(sayi2Controller.text);
                    context.read<AnasayfaCubit>().toplamaYap(sayi1, sayi2);
                  },
                ),
                ElevatedButton(
                  child: const Text("Çarpma", style: TextStyle(fontSize: 21),),
                  onPressed: (){
                    int sayi1 = int.parse(sayi1Controller.text);
                    int sayi2 = int.parse(sayi2Controller.text);
                    context.read<AnasayfaCubit>().carpmaYap(sayi1, sayi2);
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
