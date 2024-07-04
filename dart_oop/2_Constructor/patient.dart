class Patient {
  String? name;
  int? age;
  String? disease;

  Patient({this.name, this.age = 34, this.disease});

  void display() {
    print("Patient name : $name");
    print("Patient age : $age");
    print("Patient disease : $disease");
  }
}

void main() {
  Patient p1 = Patient(name: "Tony", disease: "Flu");
  p1.display();
}
