class Dog {
  String? name, image;
  List<Dog?>? subDogs;
  Dog({required this.name, this.image, this.subDogs});

  Dog.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    subDogs = json['name'];
  }
}
