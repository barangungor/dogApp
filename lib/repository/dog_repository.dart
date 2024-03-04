import 'package:dogapp/models/dog.dart';
import 'package:dogapp/services/network_service.dart';
import 'package:http/http.dart' as http;

class DogRepository {
  DogRepository._();
  static final instance = DogRepository._();
  List<Dog> dogBreeds = [];

  Future<List<Dog>?> getBreeds() async {
    final response = await NetworkService.instance.getRequest(NetworkService.listAll);
    if (response is Map) {
      await Future.forEach((response['message'] as Map ?? {}).entries.toList(), (breed) async {
        final Dog dog = Dog(name: breed.key, subDogs: []);
        String? image = await getBreedImage(dog);
        if (image != null || (image?.length ?? 0) > 0) {
          final imageHasLoaded = await http.get(Uri.parse("$image"));
          if (imageHasLoaded.statusCode == 200) {
            dog.image = image;
          }
        }
        if (!breed.value.isEmpty) {
          breed.value.forEach((subBreed) {
            dog.subDogs?.add(Dog(name: subBreed, subDogs: []));
          });
        }
        dogBreeds.add(dog);
      });
      return dogBreeds;
    } else {
      return null;
    }
  }

  Future<String?> getBreedImage(Dog dog) async {
    final response = await NetworkService.instance.getRequest(NetworkService.getRandomImage(dog.name));
    if (response is Map) {
      return response['message'] ?? "";
    } else {
      return "";
    }
  }

  List<Dog>? searchDogs(searchText) {
    return dogBreeds
        .where((element) => element.name?.toLowerCase().contains(searchText.toString().toLowerCase()) ?? false)
        .toList();
  }
}
