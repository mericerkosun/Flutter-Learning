class Student {
  final String? name;
  final int? age;
  final int? rollNo;

  const Student({this.name, this.age, this.rollNo});
}

void main() {
  const Student s1 = Student(name: "Meriç", age: 22, rollNo: 61);

  print("Name: ${s1.name}");
  print("Age: ${s1.age}");
  print("Roll Number: ${s1.rollNo}");
}
