class Book {
  String? name;
  String? author;
  int? price;

  void display() {
    print("Book name : $name.");
    print("Book author : $author.");
    print("Book price : $price TL.");
  }
}

void main() {
  Book book1 = Book();
  book1.name = "Algoritmalar";
  book1.author = "Evren Şeker";
  book1.price = 400;
  book1.display();
}
