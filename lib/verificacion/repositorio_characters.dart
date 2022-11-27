import 'dart:convert';
import 'dart:io';
import 'package:fpdart/fpdart.dart';

import 'package:harry_popotes/dominio/character.dart';
import 'package:harry_popotes/dominio/problemas.dart';
import "package:http/http.dart" as http;

abstract class RepositorioCharacters {
  Future<Either<Problema, List<Character>>> obtenerPersonajes(String direccion);
}

class RepositorioCharactersOnline extends RepositorioCharacters {
  @override
  Future<Either<Problema, List<Character>>> obtenerPersonajes(
      String direccion) async {
    final response = await http.get(Uri.parse(direccion));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final resultado = _obtenerListaPersonajes(json);
      resultado.match((l) {
        return Left(l);
      }, (r) {
        return Right(r);
      });
    }
    return Left(DireccionErronea());

    //list.sort((a, b) => a.name.compareTo(b.name));
  }
}

class RepositorioCharactersOffline extends RepositorioCharacters {
  @override
  Future<Either<Problema, List<Character>>> obtenerPersonajes(
      String direccion) async {
    List<dynamic> file = jsonDecode(File(direccion).readAsStringSync());

    final resultado = _obtenerListaPersonajes(file);
    resultado.match((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
    throw UnimplementedError();
  }
}

Either<Problema, List<Character>> _obtenerListaPersonajes(List<dynamic> lista) {
  try {
    List<Character> personajes = lista
        .map<Character>((item) => Character.constructor(json: item))
        .toList();
    return Right(personajes);
  } catch (e) {
    return Left(FormatoJsonPersonajeErroneo());
  }
}
