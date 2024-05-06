import 'package:flutter/material.dart';

class SayacModel extends ChangeNotifier{

  int sayac = 0;

  int sayacOku(){
    return sayac;
  }

  void sayacArttir(){
    sayac = sayac + 1;
    notifyListeners();
  }

  void sayacAzalt(int miktar){
    sayac = sayac - miktar;
    notifyListeners();
  }
}