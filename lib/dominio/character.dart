import 'package:harry_popotes/dominio/problemas.dart';

class Character {
  final String house;
  final String name;
  final String genero;
  final String dateOfBirth;
  final String yearOfBirth;
  final bool esEstudiante;
  final bool esMago;
  final String patronus;
  final bool hogwartsStaff;
  final String actor;
  final bool vivo;
  final String specie;
  final String imagen;

  Character(
      {required this.genero,
      required this.esMago,
      required this.patronus,
      required this.hogwartsStaff,
      required this.vivo,
      required this.specie,
      required this.dateOfBirth,
      required this.yearOfBirth,
      required this.house,
      required this.name,
      required this.esEstudiante,
      required this.actor,
      required this.imagen});

  factory Character.constructor({required Map<String, dynamic> json}) {
    try {
      return Character(
          house: json['house'],
          name: json['name'],
          specie: json['species'],
          genero: json['gender'],
          dateOfBirth: json['dateOfBirth'],
          yearOfBirth: json['yearOfBirth'].toString(),
          esMago: json['wizard'],
          patronus: json['patronus'],
          esEstudiante: json['hogwartsStudent'],
          hogwartsStaff: json['hogwartsStaff'],
          actor: json['actor'],
          vivo: json['alive'],
          imagen: json['image'].toString().replaceAll('herokuapp', 'onrender'));
    } catch (e) {
      throw FormatoJsonPersonajeErroneo();
    }
  }
}
