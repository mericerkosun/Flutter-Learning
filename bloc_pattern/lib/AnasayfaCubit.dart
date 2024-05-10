import 'package:bloc_pattern/MathRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<int> { // Yönetilecek ve arayüzde kullanılacak verinin türü. <int>

  AnasayfaCubit():super(0); // Yönetilecek ve arayüzde kullanılacak verinin varsayılan değeri.

  var mrepo = MathRepo();

  void toplamaYap(int alinanSayi1, int alinanSayi2){

    emit(mrepo.topla(alinanSayi1, alinanSayi2));
  }

  void carpmaYap(int alinanSayi1, int alinanSayi2){

    emit(mrepo.carp(alinanSayi1, alinanSayi2));
  }
}