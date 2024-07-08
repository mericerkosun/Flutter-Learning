class Person {
  String? name;
  String? planet;

  Person() {
    this.planet = "Earth";
  }
}

void main() {
  Person p1 = Person();

  print(p1.planet);
}
