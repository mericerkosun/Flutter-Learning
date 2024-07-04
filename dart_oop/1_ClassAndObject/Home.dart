class Home {
  String? name;
  String? address;
  int? numberOfRooms;

  void display() {
    print("Home name is $name");
    print("Home address is $address");
    print("Number of rooms are $numberOfRooms");
  }
}

void main() {
  Home home1 = Home();
  home1.name = "Erkoşun Apartmanı";
  home1.address = "Gebze";
  home1.numberOfRooms = 4;

  home1.display();
}
