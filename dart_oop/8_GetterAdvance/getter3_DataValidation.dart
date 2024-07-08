class VideoGame {
  String? _name;
  double? _price;

  VideoGame(this._name, [this._price]);

  String? get nameGet {
    if (_name == "") {
      return "No name";
    } else {
      return this._name;
    }
  }

  double? get priceGet {
    if (_price == null) {
      return 0;
    } else {
      return this._price;
    }
  }
}

void main() {
  VideoGame game1 = VideoGame("");
  print(game1.nameGet);
  print(game1.priceGet);

  VideoGame game2 = VideoGame("Far Cry 4", 60);
  print(game2.nameGet);
  print(game2.priceGet);
}
