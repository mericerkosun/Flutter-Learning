class Doctor {
  String? _name;
  int? _age;
  bool? _gender;

  Doctor(this._name, this._age, this._gender);

  String? get nameGet => _name;
  int? get ageGet => _age;
  bool? get genderGet => _gender;

  Map<String, dynamic> get map {
    return {"name": _name, "age": _age, "gender": _gender};
  }
}

void main() {
  Doctor d1 = Doctor("Bülent", 63, true);
  print(d1.map);

  print("*" * 10);

  print(d1.map["name"]);
  print(d1.map["age"]);
  print(d1.map["gender"]);
}
