// Getter is used to get the value of a property.
// It is mostly used to access a private property’s value.
// Getter provide explicit read access to an object properties.

/*
return_type getterName(){
  Getter body
}
*/
class Person {
  String? _firstName;
  String? _lastName;

  Person(this._firstName, this._lastName);

  String get fullName => "$_firstName $_lastName";
}

void main() {
  Person p = Person("Meriç", "Erkoşun");
  print(p.fullName);
}
