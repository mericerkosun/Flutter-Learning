class Notebook {
  String? _name;
  double? _price;

  Notebook(this._name, this._price);

  String? get nameGet => _name;
  double? get priceGet => _price;
}

void main() {
  Notebook v1 = Notebook("Monster", 37000.0);
  print(v1.nameGet);
  print("${v1.priceGet} TL");
}
