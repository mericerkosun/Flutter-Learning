class Student {
  String? name;
  int? age;
  String? rollNumber;

  // Eğer obje oluşturulurken parametlerin kesinlikle girilmesini istiyorsak "required" keyword kullanılmalı.
  Student({required this.name, this.age = 23, this.rollNumber});

  void display() {
    print("Name : $name");
    print("Age : $age");
    print("Roll Number : $rollNumber");
  }
}

void main() {
  Student std1 = Student(name: "Meriç");

  // name required olduğu için mecburen yazdık. Yazılmazsa hata olur.
  // age default değere sahip olduğu için yazılmazsa o değeri alır.
  // rollNumber required olmadığı ve default değere de sahip olmadığı için yazılmazsa error olmaz ancak null olur.

  std1.display();
}
