import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  NetworkService._();
  static final instance = NetworkService._();
  static const apiURL = "https://dog.ceo/api/";
  static const listAll = "breeds/list/all";
  static getRandomImage(dogName) => "breed/$dogName/images/random";

  Future getRequest(path) async {
    final response = await http.get(Uri.parse(apiURL + path));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      return false;
    }
  }
}
