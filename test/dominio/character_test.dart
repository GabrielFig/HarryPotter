import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:harry_popotes/dominio/character.dart';
import 'package:harry_popotes/dominio/problemas.dart';

void main() {
  test('se obtienen datos del primer personaje y se validan', () {
    List<dynamic> file = jsonDecode(
        File('./test/dominio/personajes/personaje1.json').readAsStringSync());
    var data = Character.constructor(json: file[0]);
    expect(data.name, 'Harry Potter');
    expect(data.specie, 'human');
    expect(data.genero, 'male');
    expect(data.dateOfBirth, '31-07-1980');
  });
  test('Se mal forma un json para obtener error', () {
    List<dynamic> file = jsonDecode(
        File('./test/dominio/personajes/personaje2.json').readAsStringSync());
    expect(() => Character.constructor(json: file[0]),
        throwsA(isA<FormatoJsonPersonajeErroneo>()));
  });
}
