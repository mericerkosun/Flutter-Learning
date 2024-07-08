// In this example below, there is a class named Student with three private properties _firstName, _lastName and _age.
// There are two getters fullName and age to get the value of the properties.
// There are also three setters firstName, lastName and age to update the value of the properties.
// If age is less than 0, it will throw an error.

class Student {
  String? _firstName;
  String? _lastName;
  int? _age;

  set firstNameSetter(String first_name) => this._firstName = first_name;
  set lastNameSetter(String last_name) => this._lastName = last_name;
  set ageSetter(int age) {
    if (age < 10) {
      throw new Exception("Age cannot be less than 10.");
    } else {
      this._age = age;
    }
  }

  String? get fullName => "$_firstName $_lastName";
  int? get age => this._age;
}

void main() {
  Student std1 = Student();

  std1.firstNameSetter = "Meriç";
  std1.lastNameSetter = "Erkoşun";
  std1.ageSetter = 22;

  print(std1.fullName);
  print(std1.age);
}
