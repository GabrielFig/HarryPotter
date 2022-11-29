import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:harry_popotes/dominio/problemas.dart';
import 'package:harry_popotes/dominio/spells.dart';
import "package:http/http.dart" as http;

abstract class RepositorioSpells {
  Future<Either<Problema, List<Spells>>> obtenerHechizos(String direccion);
}

class RepositorioSpellsOffline extends RepositorioSpells {
  @override
  Future<Either<Problema, List<Spells>>> obtenerHechizos(
      String direccion) async {
    List<dynamic> file = [];
    try {
      file = jsonDecode(File(direccion).readAsStringSync());
    } catch (e) {
      return Left(FormatoJsonPersonajeErroneo());
    }
    final resultado = _obtenerListaHechizos(file);
    return resultado.match((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}

class RepositorioSpellsOnline extends RepositorioSpells {
  @override
  Future<Either<Problema, List<Spells>>> obtenerHechizos(
      String direccion) async {
    final response = await http.get(Uri.parse(direccion));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final resultado = _obtenerListaHechizos(json);
      return resultado.match((l) {
        return Left(l);
      }, (r) {
        return Right(r);
      });
    }
    return Left(DireccionErronea());
  }
}

Either<Problema, List<Spells>> _obtenerListaHechizos(List<dynamic> lista) {
  try {
    List<Spells> hechizos =
        lista.map<Spells>((item) => Spells.constructor(json: item)).toList();
    return Right(hechizos);
  } catch (e) {
    return Left(FormatoJsonPersonajeErroneo());
  }
}
