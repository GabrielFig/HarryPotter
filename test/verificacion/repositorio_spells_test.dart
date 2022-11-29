import 'package:flutter_test/flutter_test.dart';
import 'package:harry_popotes/dominio/problemas.dart';
import 'package:harry_popotes/dominio/spells.dart';
import 'package:harry_popotes/verificacion/repositorio_spells.dart';

void main() {
  test('se espera recibir 5 hechizos', () async {
    RepositorioSpellsOffline repoOffline = RepositorioSpellsOffline();
    var resultado = await repoOffline.obtenerHechizos(
        './test/verificacion/lista_hechizos/lista_hechizos.json');
    resultado.match((l) {
      assert(false);
    }, (r) {
      expect(r.length, 5);
      expect(r, isA<List<Spells>>());
    });
  });

  test('se espera que de error en un json mal hecho', () async {
    RepositorioSpellsOffline repoOffline = RepositorioSpellsOffline();
    var resultado = await repoOffline.obtenerHechizos(
        './test/verificacion/lista_hechizos/lista_hechizos2.json');
    resultado.match((l) {
      expect(l, isA<FormatoJsonPersonajeErroneo>());
    }, (r) {
      assert(true);
    });
  });
}
