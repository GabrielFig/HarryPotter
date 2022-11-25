class Character {
  final String home;
  final String name;
  final bool esEstudiante;
  final String actor;
  final String imagen;

  Character(
      {required this.home,
      required this.name,
      required this.esEstudiante,
      required this.actor,
      required this.imagen});

  factory Character.obtenerInfoDeJson(Map<String, dynamic> json) {
    return Character(
        home: json['home'],
        name: json['name'],
        esEstudiante: json['hogwartsStudent'],
        actor: json['actor'],
        imagen: json['imagen']);
  }
}
