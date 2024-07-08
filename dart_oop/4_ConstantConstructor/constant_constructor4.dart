class Customer {
  final String name;
  final int age;
  final String phone;

  const Customer(this.name, this.age, this.phone);
}

void main() {
  const Customer c1 = Customer("Meriç", 22, "123456");
  print("${c1.name}");
  print("${c1.age}");
  print("${c1.phone}");
}
