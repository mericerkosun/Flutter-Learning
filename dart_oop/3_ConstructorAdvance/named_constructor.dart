// In most programming languages we can create multiple constructors with the same name.
// But in Dart, this is not possible. Well, there is a way.
// We can create multiple constructors with the same name using named constructors.

class Student {
  String? name;
  int? age;
  int? rollNumber;

  // Default constructor
  Student() {
    print("This is default consturctor.");
  }

  // Named constructor
  Student.namedConstructor(this.name, this.age, this.rollNumber);

  // Another named constructor
  Student.another_named_constructor(
      {required this.name, this.age = 45, this.rollNumber});

  void display() {
    print("Name : $name");
    print("Age : $age");
    print("Roll Number : $rollNumber");
  }
}

void main() {
  Student std1 = Student();
  Student std2 = Student.namedConstructor("Meriç", 12, 3);
  Student std3 = Student.another_named_constructor(name: "Beyza");

  std1.display();
  std2.display();
  std3.display();
}
