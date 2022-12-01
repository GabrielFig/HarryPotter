import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:harry_popotes/dominio/character.dart';
import 'package:harry_popotes/verificacion/repositorio_characters.dart';

class VistaListaPersonajes extends StatelessWidget {
  const VistaListaPersonajes({super.key, required this.personajes});
  final List<Character> personajes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de todos los personajes'),
          backgroundColor: const Color.fromARGB(255, 68, 33, 243),
        ),
        body: ListView.builder(
            itemCount: personajes.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(personajes[index].name),
                leading: Text(personajes[index].imagen),
              );
            }));
  }
}
