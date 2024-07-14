class Person {
  String? _name;
  int? _age;

  set nameSet(String name) => this._name = name;
  set ageSet(int age) => this._age = age;

  String? get nameGet => this._name;
  int? get ageGet => this._age;
}

class Doctor extends Person {
  String? _school;
  String? _hospital;

  set schoolSet(String school) => this._school = school;
  set hospitalSet(String hospital) => this._hospital = hospital;

  String? get schoolGet => this._school;
  String? get hospitalGet => this._hospital;
}

class Specialist extends Doctor {
  String? _specialization;

  set specializationSet(String specialization) =>
      this._specialization = specialization;

  String? get specializationGet => this._specialization;

  void display() {
    print("Name : $nameGet");
    print("Age : $ageGet");
    print("School: $schoolGet");
    print("Hospital : $hospitalGet");
    print("SpecializationGet : $specializationGet");
  }
}

void main() {
  var d1 = Specialist();
  d1.nameSet = "Bülent";
  d1.ageSet = 52;
  d1.schoolSet = "Hacettepe";
  d1.hospitalSet = "Şehir Hastanesi";
  d1._specialization = "Çocuk Doktoru";
  d1.display();
}
