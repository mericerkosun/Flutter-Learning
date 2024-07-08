class Mobile {
  String? name;
  String? color;
  int? price;

  Mobile(this.name, this.color, this.price);

  Mobile.namedConstructor(this.name, this.color, [this.price = 0]);

  void display() {
    print("Name : $name");
    print("Color : $color");
    print("Price : $price \$");
  }
}

void main() {
  Mobile p1 = Mobile.namedConstructor("Sony", "White");
  Mobile p2 = Mobile.namedConstructor("iPhone", "Black", 2000);
  Mobile p3 = Mobile("Samsung", "Red", 1500);
  p1.display();
  p2.display();
  p3.display();
}
