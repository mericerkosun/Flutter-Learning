class Car {
  final String? name;
  final String? model;
  final int? price;

  const Car({this.name, this.model, this.price});
}

void main() {
  Car honda = const Car(name: "Honda", model: "Civic", price: 500000);
  print("Name: ${honda.name}");
  print("Model: ${honda.model}");
  print("Price: ${honda.price} TL");
}
