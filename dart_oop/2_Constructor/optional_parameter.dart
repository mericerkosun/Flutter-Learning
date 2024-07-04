class Employee {
  String? name;
  int? age;
  String? subject;
  double? salary;

  Employee(this.name, this.age, [this.subject = "N/A", this.salary = 0]);

  void display() {
    print("Employee name : $name");
    print("Employee age : $age");
    print("Employee subject : $subject");
    print("Employee salary : $salary");
  }
}

void main() {
  Employee e1 = Employee("Ahmet", 34);
  Employee e2 = Employee("Ayşe", 27, "Developer", 2500.0);
  Employee e3 = Employee("Mert", 23, "Designer");

  e1.display();
  print("\n");
  e2.display();
  print("\n");
  e3.display();
}
