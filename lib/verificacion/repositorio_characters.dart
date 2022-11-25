import 'dart:convert';

import 'package:harry_popotes/dominio/character.dart';
import "package:http/http.dart" as http;

abstract class RepositorioCharacters {
  Future<List<Character>> juntarPersonajes() async {
    List<Character> list = List<Character>();
    http.Response response =
        await http.get(Uri.parse("http://hp-api.herokuapp.com/api/characters"));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      list = json.map<Character>((item) => Character.obtenerInfoDeJson(item)).toList();
      list.sort((a, b) => a.name.compareTo(b.name));
      return list;
    } else {
      return null;
    }
  }
}
