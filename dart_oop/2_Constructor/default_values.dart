class Table {
  String? name;
  String? color;

  Table({this.name = "Table 1", this.color = "Blue"});

  void display() {
    print("Name: ${this.name}");
    print("Color: ${this.color}");
  }
}

void main() {
  Table t1 = Table();
  Table t2 = Table(name: "Table 2");
  Table t3 = Table(name: "Table 3", color: "White");

  t1.display();
  print("\n");
  t2.display();
  print("\n");
  t3.display();
}
