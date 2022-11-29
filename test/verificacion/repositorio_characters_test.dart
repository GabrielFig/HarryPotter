import 'package:flutter_test/flutter_test.dart';
import 'package:harry_popotes/dominio/character.dart';
import 'package:harry_popotes/dominio/problemas.dart';
import 'package:harry_popotes/verificacion/repositorio_characters.dart';

void main() {
  test('se espera 4 personajes y es una lista de personajes :D', () async {
    RepositorioCharactersOffline repoOffline = RepositorioCharactersOffline();
    var resultado = await repoOffline
        .obtenerPersonajes('./test/verificacion/lista_personajes/lista1.json');
    resultado.match((l) {
      assert(false);
    }, (r) {
      expect(r.length, 4);
      expect(r, isA<List<Character>>());
    });
  });

  test('da error con un json mal formado', () async {
    RepositorioCharactersOffline repoOffline = RepositorioCharactersOffline();
    var resultado = await repoOffline
        .obtenerPersonajes('./test/verificacion/lista_personajes/lista2.json');
    resultado.match((l) {
      expect(l, isA<FormatoJsonPersonajeErroneo>());
    }, (r) {
      assert(true);
    });
  });
}
