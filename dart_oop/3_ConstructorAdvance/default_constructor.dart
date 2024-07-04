// The constructor which is automatically created by the dart compiler if you don’t create a constructor is called a default constructor.
// A default constructor has no parameters.
// A default constructor is declared using the class name followed by parentheses ().

class Laptop {
  String? brand;
  int? price;

  Laptop() {
    print("Constructor called!");
  }
}

void main() {
  Laptop macbook = Laptop();
  macbook.brand;
}

// The default constructor is called automatically when you create an object of the class. 
// It is used to initialize the instance variables of the class.
