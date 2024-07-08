class Animal {
  String? name;
  int? age;

  Animal() {
    print("This is a default constructor");
  }

  Animal.named_constructor1(this.name, this.age);
  Animal.named_constructor2(this.name);

  void display() {
    print("Name : $name");
    print("Age : $age");
  }
}

void main() {
  Animal cat = Animal();
  Animal dog = Animal.named_constructor1("Merlin", 3);
  Animal bird = Animal.named_constructor2("Cici");

  cat.display();
  dog.display();
  bird.display();
}
