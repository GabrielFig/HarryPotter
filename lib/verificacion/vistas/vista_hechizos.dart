import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_popotes/dominio/spells.dart';

import '../bloc.dart';

class VistaHechizos extends StatelessWidget {
  const VistaHechizos({Key? key, required this.hechizos}) : super(key: key);
  final List<Spells> hechizos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Lista Hechizos'),
          backgroundColor: Colors.blueAccent),
      body: Column(
        children: [
          Expanded(child:
              ListView.builder(itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(hechizos[index].nombre),
              subtitle: Text(hechizos[index].descripcion),
            );
          })),
          FloatingActionButton(
            onPressed: () {
              var bloc = context.read<BlocVerificacion>();
              bloc.add(Creado());
            },
            child: const Text('Volver'),
          )
        ],
      ),
    );
  }
}
