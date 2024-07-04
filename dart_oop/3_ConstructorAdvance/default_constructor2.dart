class Student {
  String? name;
  int? age;
  double? grade;
  String? schoolName;

  Student() {
    this.schoolName = "Aydin";
  }

  void display() {
    print(name);
    print(age);
    print(grade);
    print(schoolName);
  }
}

void main() {
  Student std1 = Student();
  std1.name = "Meriç";
  std1.age = 22;
  std1.grade = 2.64;
  std1.display();
}
