class VideoGame {
  String? _name;
  double? _price;

  set nameSetter(String name) => this._name = name;

  set priceSetter(double price) {
    if (price < 0) {
      throw Exception("Price cannot be less than 0");
    } else {
      this._price = price;
    }
  }

  String? get nameGetter => this._name;
  double? get priceGetter => this._price;
}

void main() {
  VideoGame v1 = VideoGame();
  v1.nameSetter = "AC Oddsey";
  v1.priceSetter = -10;

  print(v1.nameGetter);
  print(v1.priceGetter);
}

// Genellikle bir alanın değerini doğrudan ayarlamak yerine, değeri ayarlamadan önce doğrulama yapabilen bir setter metodunu kullanmak daha iyidir. 
// Bu özellikle büyük ve karmaşık programlar üzerinde çalışırken önemlidir.

/*
set name(String name) {
    if (name.isNotEmpty) {
      _name = name;
    } else {
      print('Name cannot be empty.');
    }
  }
*/