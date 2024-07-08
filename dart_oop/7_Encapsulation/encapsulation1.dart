// The reason is that using underscore (_) before a variable or method name makes it library private not class private.
// It means that the variable or method is only visible to the library in which it is declared.
// It is not visible to any other library.
// In simple words, library is one file.
// If you write the main method in a separate file, this will not work.

class Employee {
  int? _id;
  String? _name;

  // Getter methods to access private property _id and _name
  int getId() {
    return _id!;
  }

  String getName() {
    return _name!;
  }

  // Setter methods to update private property _id and _name
  void setId(int id) {
    this._id = id;
  }

  void setName(String name) {
    this._name = name;
  }
}

void main() {
  Employee emp1 = Employee();
  // Setting values to the object using setter
  emp1.setId(1);
  emp1.setName("Kerem");

  // Retrieve the values of the object using getter
  print("ID : ${emp1.getId()}");
  print("Name : ${emp1._name}");
}
