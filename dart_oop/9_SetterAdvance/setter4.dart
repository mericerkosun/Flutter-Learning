class University {
  String? _name;
  int? _year;

  University.myConstructor(this._name, this._year);

  set nameSetter(String name) => this._name = name;
  set yearSetter(int year) {
    if (year < 1900 || year > 2023) {
      print("$year is not acceptable !");
    } else {
      this._year = year;
    }
  }

  String? get nameGetter => this._name;
  int? get yearGetter => this._year;
}

void main() {
  University uni1 = University.myConstructor("Aydin", 2003);
  uni1.nameSetter = "İstanbul Aydin";
  uni1.yearSetter = 1850;
  uni1.yearSetter = 2021;

  print(uni1.nameGetter);
  print(uni1.yearGetter);
}
