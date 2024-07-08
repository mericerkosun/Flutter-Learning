// Özelliklerin bildirimi öncesinde "final" anahtar kelimesi ekleyerek bu durumu sağlayabilirsiniz. Bu sayede, bu özelliklerin değerlerine sadece erişebilir, ancak değiştiremezsiniz.

// !!! Properties declared with the final keyword must be initialized at the time of declaration. You can also initialize them in the constructor.

class Student {
  final _schoolName = "Aydin";

  String getSchool() {
    return _schoolName;
  }

  /* This is not possible !!
  void setSchool(String school) {
    this._schoolName = school;
  }
  */
}

void main() {
  Student std1 = Student();
  print(std1.getSchool());
}
