class Teacher {
  String? name;
  int? age;
  String? subject;
  double? salary;

  // Tek satırda constructor.
  Teacher(this.name, this.age, this.subject, this.salary);

  void display() {
    print("Teacher name : $name");
    print("Teacher age : $age");
    print("Teacher subject : $subject");
    print("Teacher salary : $salary\$");
  }
}

void main() {
  Teacher t1 = Teacher("Ali", 65, "Programming", 2000);
  Teacher t2 = Teacher("Emrah", 40, "Web", 1000);

  t1.display();
  print("\n");
  t2.display();
}
