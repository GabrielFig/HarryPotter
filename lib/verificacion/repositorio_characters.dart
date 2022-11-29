import 'dart:convert';
import 'dart:io';
import 'package:fpdart/fpdart.dart';

import 'package:harry_popotes/dominio/character.dart';
import 'package:harry_popotes/dominio/problemas.dart';
import "package:http/http.dart" as http;

abstract class RepositorioCharacters {
  Future<Either<Problema, List<Character>>> obtenerPersonajes(String direccion);
  Future<Either<Problema, List<Character>>> obtenerPersonajesPorCasa(
      String direccion, nombreCasa);
}

class RepositorioCharactersOnline extends RepositorioCharacters {
  @override
  Future<Either<Problema, List<Character>>> obtenerPersonajes(
      String direccion) async {
    final response = await http.get(Uri.parse(direccion));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final resultado = _obtenerListaPersonajes(json);
      return resultado.match((l) {
        return Left(l);
      }, (r) {
        return Right(r);
      });
    }
    return Left(DireccionErronea());

    //list.sort((a, b) => a.name.compareTo(b.name));
  }

  @override
  Future<Either<Problema, List<Character>>> obtenerPersonajesPorCasa(
      String direccion, nombreCasa) async {
    String rutaCompleta = direccion + nombreCasa;
    final response = await http.get(Uri.parse(rutaCompleta));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final resultado = _obtenerListaPersonajes(json);
      return resultado.match((l) {
        return Left(l);
      }, (r) {
        return Right(r);
      });
    }
    return Left(DireccionErronea());
  }
}

class RepositorioCharactersOffline extends RepositorioCharacters {
  @override
  Future<Either<Problema, List<Character>>> obtenerPersonajes(
      String direccion) async {
    try {
      List<dynamic> file = jsonDecode(File(direccion).readAsStringSync());

      final resultado = _obtenerListaPersonajes(file);
      return resultado.match((l) {
        return Left(l);
      }, (r) {
        return Right(r);
      });
    } catch (e) {
      return Left(FormatoJsonPersonajeErroneo());
    }
  }

  @override
  Future<Either<Problema, List<Character>>> obtenerPersonajesPorCasa(
      String direccion, nombreCasa) async {
    String direccionCompleta = '$direccion/$nombreCasa.json';
    List<dynamic> file = [];
    try {
      file = jsonDecode(File(direccionCompleta).readAsStringSync());
    } catch (e) {
      return Left(FormatoJsonPersonajeErroneo());
    }
    final resultado = _obtenerListaPersonajes(file);
    return resultado.match((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
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
