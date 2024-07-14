class Person {
  String? name;
  int? age;

  void display() {
    print("Name : $name");
    print("Age : $age");
  }
}

class Student extends Person {
  String? schoolName;
  int? schoolNo;

  void displaySchoolInfo() {
    print("School Name : $schoolName");
    print("School Number : $schoolNo");
  }
}

void main() {
  Student s1 = Student();
  s1.name = "Meriç";
  s1.age = 22;
  s1.schoolName = "Aydin";
  s1.schoolNo = 67;
  s1.display();
  s1.displaySchoolInfo();
}
