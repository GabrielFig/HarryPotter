import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dominio/character.dart';
import '../bloc.dart';

class VistaPersonajesPorCasa extends StatelessWidget {
  const VistaPersonajesPorCasa({Key? key, required this.personajes})
      : super(key: key);

  final List<Character> personajes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de todos los personajes'),
          backgroundColor: const Color.fromARGB(255, 68, 33, 243),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: personajes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          var bloc = context.read<BlocVerificacion>();
                          bloc.add(MostrarDetallePersonaje(personajes[index]));
                        },
                        title: Text(personajes[index].name),
                        leading: CachedNetworkImage(
                          imageUrl: personajes[index].imagen,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      );
                    })),
            FloatingActionButton(
              onPressed: () {
                var bloc = context.read<BlocVerificacion>();
                bloc.add(MostrarPersonajesCasa());
              },
              child: const Text('Volver'),
            )
          ],
        ));
  }
}
