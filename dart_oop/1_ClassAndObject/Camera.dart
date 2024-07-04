class Camera {
  String? name;
  String? color;
  int? megapixel;

  void display() {
    print("Camera name is $name");
    print("Camera color is $color");
    print("Camera megapixel is $megapixel");
  }
}

void main() {
  Camera camera1 = Camera();
  camera1.name = "Canon";
  camera1.color = "Black";
  camera1.megapixel = 48;

  Camera camera2 = Camera();
  camera2.name = "Sony";
  camera2.color = "Grey";
  camera2.megapixel = 128;

  camera1.display();
  print("\n");
  camera2.display();
}
