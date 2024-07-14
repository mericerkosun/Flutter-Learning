class Car {
  String? brand;
  String? color;

  void displayCarInfo() {
    print("Brand : $brand");
    print("Color : $color");
  }
}

class Toyota extends Car {
  String? model;
  int? year;

  void displayToyotaInfo() {
    print("Model : $model");
    print("Year : $year");
  }
}

void main() {
  var car1 = Toyota();
  car1.brand = "Toyota";
  car1.color = "Grey";
  car1.model = "Yaris";
  car1.year = 2018;
  car1.displayCarInfo();
  car1.displayToyotaInfo();
}
