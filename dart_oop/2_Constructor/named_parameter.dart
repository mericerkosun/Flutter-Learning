class Chair {
  String? name;
  String? color;

  Chair({this.name, this.color});

  void display() {
    print("Chair name : $name");
    print("Chair color : $color");
  }
}

void main() {
  Chair c1 = Chair(name: "Chair1", color: "Red");
  c1.display();
}
