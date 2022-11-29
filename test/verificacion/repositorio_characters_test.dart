import 'package:flutter_test/flutter_test.dart';
import 'package:harry_popotes/dominio/character.dart';
import 'package:harry_popotes/dominio/problemas.dart';
import 'package:harry_popotes/verificacion/repositorio_characters.dart';

void main() {
  group('Pruebas Offline', () {
    test('se espera 4 personajes y es una lista de personajes :D', () async {
      RepositorioCharactersOffline repoOffline = RepositorioCharactersOffline();
      var resultado = await repoOffline.obtenerPersonajes(
          './test/verificacion/lista_personajes/lista1.json');
      resultado.match((l) {
        assert(false);
      }, (r) {
        expect(r.length, 4);
        expect(r, isA<List<Character>>());
      });
    });

    test('da error con un json mal formado', () async {
      RepositorioCharactersOffline repoOffline = RepositorioCharactersOffline();
      var resultado = await repoOffline.obtenerPersonajes(
          './test/verificacion/lista_personajes/lista2.json');
      resultado.match((l) {
        expect(l, isA<FormatoJsonPersonajeErroneo>());
      }, (r) {
        assert(true);
      });
    });
  });

  group('Pruebas Online', () {
    test('Se espera una lista de personajes', () async {
      RepositorioCharactersOnline repoOnline = RepositorioCharactersOnline();
      var resultado = await repoOnline
          .obtenerPersonajes('https://hp-api.herokuapp.com/api/characters');
      resultado.match((l) {
        assert(false);
      }, (r) {
        expect(r, isA<List<Character>>());
      });
    });

    test('Se esperan 403 personajes', () async {
      RepositorioCharactersOnline repoOnline = RepositorioCharactersOnline();
      var resultado = await repoOnline
          .obtenerPersonajes('https://hp-api.herokuapp.com/api/characters');
      resultado.match((l) {
        assert(false);
      }, (r) {
        expect(r.length, 403);
      });
    });

    test('Se espera un error por ruta erronea', () async {
      RepositorioCharactersOnline repoOnline = RepositorioCharactersOnline();
      var resultado = await repoOnline
          .obtenerPersonajes('https://hp-api.herokuapp.com/api/charact');
      resultado.match((l) {
        expect(l, isA<DireccionErronea>());
      }, (r) {
        assert(true);
      });
    });
  });
}
