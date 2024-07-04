class Rectangle {
  double? height;
  double? weight;

  double area() {
    return height! * weight!;
  }
}

void main() {
  Rectangle rec1 = Rectangle();
  rec1.height = 10.0;
  rec1.weight = 8.5;
  print("Area of rectangle is ${rec1.area()}.");
}
