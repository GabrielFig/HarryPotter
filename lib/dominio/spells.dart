import 'package:harry_popotes/dominio/problemas.dart';

class Spells {
  final String nombre;
  final String descripcion;

  Spells({required this.nombre, required this.descripcion});

  factory Spells.constructor({required Map<String, dynamic> json}) {
    try {
      return Spells(nombre: json['name'], descripcion: json['description']);
    } catch (e) {
      throw FormatoJsonHechizoErroneo();
    }
  }
}
