class Student {
  String? _name;
  int? _classNo;

  Student(this._name, this._classNo);

  set nameSetter(String name) => this._name = name;
  set classNoSetter(int classNo) {
    if (classNo > 0 && classNo <= 12) {
      this._classNo = classNo;
    } else {
      print("Class Number cannot be bigger than 12 and less than 1");
    }
  }

  String? get nameGetter => this._name;
  int? get classNoGetter => this._classNo;
}

void main() {
  Student student1 = Student("", null);
  student1.nameSetter = "Meriç";
  student1.classNoSetter = 14;

  print(student1.nameGetter);
  print(student1.classNoGetter);
}
