import 'package:mobx/mobx.dart';

part 'SayacModel.g.dart';

class SayacModel = SayacModelBase with _$SayacModel;

abstract class SayacModelBase with Store {
  @observable // Değişimini gözlemleyeceğimiz yapının tanımlanması.
  int sayac = 0;

  @action
  void sayacArttir(){
    sayac = sayac + 1;
  }

  @action
  void sayacAzalt(int miktar){
    sayac = sayac - miktar;
  }
}