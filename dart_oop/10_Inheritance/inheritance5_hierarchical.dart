class Shape {
  double? diameter1;
  double? diameter2;
}

class Rectangle extends Shape {
  double area() {
    return diameter1! * diameter2!;
  }
}

class Triangle extends Shape {
  double area() {
    return 0.5 * diameter1! * diameter2!;
  }
}

void main() {
  Rectangle r = Rectangle();
  r.diameter1 = 10.0;
  r.diameter2 = 20.0;
  print("Area of the rectangle: ${r.area()}");

  Triangle t = Triangle();
  t.diameter1 = 10.0;
  t.diameter2 = 20.0;
  print("Area of the triangle: ${t.area()}");
}
