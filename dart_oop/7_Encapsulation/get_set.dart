// You can create getter and setter methods by using the get and set keywords.

// !!! In dart, any identifier like (class, class properties, top-level function, or variable) that starts with an underscore _ it is private to its library.

class Vehicle {
  String? _model;
  int? _year;

  // Getter Methods
  String? get modelGetter => _model;
  int? get yearGetter => _year;

  // Setter Methods
  set modelSetter(String? model) => _model = model;
  set yearSetter(int? year) => _year = year;
}

void main() {
  var vehicle = Vehicle();
  vehicle.modelSetter = "Toyota";
  vehicle.yearSetter = 2019;

  print(vehicle.modelGetter);
  print(vehicle.yearGetter);
}
