/* Types Of Inheritance In Dart

Single Inheritance - In this type of inheritance, a class can inherit from only one class. In Dart, we can only extend one class at a time.

Multilevel Inheritance - In this type of inheritance, a class can inherit from another class and that class can also inherit from another class. In Dart, we can extend a class from another class which is already extended from another class.

Hierarchical Inheritance - In this type of inheritance, parent class is inherited by multiple subclasses. For example, the Car class can be inherited by the Toyota class and Honda class.

Multiple Inheritance - In this type of inheritance, a class can inherit from multiple classes. Dart does not support multiple inheritance. For e.g. Class Toyota extends Car, Vehicle {} is not allowed in Dart. */

class Car {
  String? name;
  int? price;
}

class Tesla extends Car {
  void display() {
    print("Name : $name");
    print("Price : $price");
  }
}

class Model3 extends Tesla {
  String? color;

  void display() {
    super
        .display(); // Here super keyword is used to call the method of the parent class.
    print("Color : $color");
  }
}

void main() {
  Model3 model3 = Model3();
  model3.name = "Tesla Model 3";
  model3.price = 37000;
  model3.color = "White";
  model3.display();
}
