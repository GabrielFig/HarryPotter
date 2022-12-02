import 'package:flutter/material.dart';
import 'package:harry_popotes/dominio/character.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../bloc.dart';

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
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: personajes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          print(personajes[index].imagen);
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
                bloc.add(Creado());
              },
              child: const Text('Volver'),
            )
          ],
        ));
  }
}
