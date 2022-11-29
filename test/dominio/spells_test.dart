import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:harry_popotes/dominio/problemas.dart';
import 'package:harry_popotes/dominio/spells.dart';

void main() {
  test('se espera que regrese datos correctos de : Aberto', () {
    List<dynamic> file = jsonDecode(
        File('./test/verificacion/lista_hechizos/lista_hechizos.json')
            .readAsStringSync());
    var data = Spells.constructor(json: file[0]);
    expect(data.descripcion, 'Opens locked doors');
    expect(data.nombre, 'Aberto');
  });

  test('se espera un error de nombre en los datos', () {
    List<dynamic> file = jsonDecode(
        File('./test/verificacion/lista_hechizos/lista_hechizos2.json')
            .readAsStringSync());
    expect(() => Spells.constructor(json: file[0]),
        throwsA(isA<FormatoJsonHechizoErroneo>()));
  });
}
