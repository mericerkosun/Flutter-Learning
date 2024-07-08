// Constant constructor is a constructor that creates a constant object.
// A constant object is an object whose value cannot be changed.
// A constant constructor is declared using the keyword const.

// All properties of the class must be final.
// It does not have any body.
// Only class containing const constructor is initialized using the const keyword.

// Improves the performance of the program.

// Class'tan const bir nesne tanımlamak için o sınıfın constant constructor'a  sahip olması gerekir.

class Point {
  final int x;
  final int y;

  const Point(this.x, this.y);
}

void main() {
  // p1 and p2 has the same hash code.
  Point p1 = const Point(1, 4);
  print("The p1 hash code is: ${p1.hashCode}");

  Point p2 = const Point(1, 4);
  print("The p2 hash code is: ${p2.hashCode}");

  // without using const
  // this has different hash code.
  Point p3 = Point(2, 2);
  print("The p3 hash code is: ${p3.hashCode}");

  Point p4 = Point(2, 2);
  print("The p4 hash code is: ${p4.hashCode}");
}
