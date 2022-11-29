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

  group('Personajes por casa offline', () {
    test('se esperan solo estudiantes de Slytherin', () async {
      RepositorioCharactersOffline repoOffline = RepositorioCharactersOffline();
      var resultado = await repoOffline.obtenerPersonajesPorCasa(
          './test/verificacion/lista_personajes', 'slytherin');
      resultado.match((l) {
        assert(false);
      }, (r) {
        for (var i = 0; i < r.length; i++) {
          expect(r[i].house, 'Slytherin');
        }
      });
    });

    test('se espera un problema de direccion incorrecta', () async {
      RepositorioCharactersOffline repoOffline = RepositorioCharactersOffline();
      var resultado = await repoOffline.obtenerPersonajesPorCasa(
          './test/verificacion/lista_personajes', 'slyther');
      resultado.match((l) {
        expect(l, isA<FormatoJsonPersonajeErroneo>());
      }, (r) {
        assert(true);
      });
    });
  });

  group('Personajes por casa online', () {
    test('se esperan estudiantes de Slytherin', () async {
      RepositorioCharactersOnline repoOnline = RepositorioCharactersOnline();
      var resultado = await repoOnline.obtenerPersonajesPorCasa(
          'https://hp-api.herokuapp.com/api/characters/house', 'slytherin');
      resultado.match((l) {
        assert(false);
      }, (r) {
        for (var i = 0; i < r.length; i++) {
          expect(r[i].house, 'Slytherin');
        }
      });
    });

    test('se esperan estudiantes de Ravenclaw', () async {
      RepositorioCharactersOnline repoOnline = RepositorioCharactersOnline();
      var resultado = await repoOnline.obtenerPersonajesPorCasa(
          'https://hp-api.herokuapp.com/api/characters/house', 'ravenclaw');
      resultado.match((l) {
        assert(false);
      }, (r) {
        for (var i = 0; i < r.length; i++) {
          expect(r[i].house, 'Ravenclaw');
        }
      });
    });

    test('se espera un error en la ruta', () async {
      RepositorioCharactersOnline repoOnline = RepositorioCharactersOnline();
      var resultado = await repoOnline.obtenerPersonajesPorCasa(
          'https://hp-api.herokuapp.com/api/characters/house', 'ravencl');
      resultado.match((l) {
        expect(l, isA<DireccionErronea>());
      }, (r) {
        assert(true);
      });
    });
  });
}
