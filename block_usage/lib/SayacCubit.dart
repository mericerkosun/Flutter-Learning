import 'package:flutter_bloc/flutter_bloc.dart';

class SayacCubit extends Cubit<int> { // int, yönetilecek verinin tipini ifade eder.

  SayacCubit():super(0); // 0, yönetilecek verinin başlangıç değerini ifade eder.

  void sayacArttir(){
    int sayac = state + 1; // state ifadesi verimizi temsil eder.
    emit(sayac);
  }

  void sayacAazalt(int miktar){
    int sayac = state - miktar; // state ifadesi verimizi temsil eder.
    emit(sayac);
  }
}