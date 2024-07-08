// Setter is used to set the value of a property.
// It is mostly used to update a private property’s value.
// Setter provide explicit write access to an object properties.

/*
void setterName(value) {
  Setter body
}
*/

class NoteBook {
  String? _name;
  int? _price;

  set nameSetter(String name) => this._name = name;
  set priceSetter(int price) => this._price = price;

  String? get nameGetter => _name;
  int? get priceGetter => _price;
}

void main() {
  NoteBook n1 = NoteBook();

  n1.nameSetter = "Macbook Air";
  n1.priceSetter = 1500;

  print(n1.nameGetter);
  print(n1.priceGetter);
}
