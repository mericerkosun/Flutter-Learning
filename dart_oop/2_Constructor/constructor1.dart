class Student {
  String? name;
  int? age;
  int? number;

  Student(String name, int age, int number) {
    this.name = name;
    this.age = age;
    this.number = number;
  }

  void display() {
    print("Student name is $name");
    print("Student age is $age");
    print("Student number is $number");
  }
}

void main() {
  Student std1 = Student("Meriç", 22, 67);
  std1.display();
}
