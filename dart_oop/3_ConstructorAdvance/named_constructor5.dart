class Car {
  String? name;
  String? color;
  int? price;

  void display() {
    print("Name  : $name");
    print("Color : $color");
    print("Price : $price");
  }

  Car(this.name, this.color, this.price);
  Car.namedConstructor(this.name, this.color);
}

void main() {
  Car audi = Car("A3", "White", 30000);
  Car bmw = Car.namedConstructor("i5", "Black");

  audi.display();
  bmw.display();
}
