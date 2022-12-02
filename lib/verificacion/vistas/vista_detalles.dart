import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_popotes/dominio/character.dart';

import '../bloc.dart';

class VistaDetallesPersonaje extends StatelessWidget {
  const VistaDetallesPersonaje({Key? key, required this.personaje})
      : super(key: key);
  final Character personaje;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(personaje.name),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(personaje.imagen),
              height: 300,
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Card(
                child: Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  child: personaje.house == ""
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Casa: ",
                              style: infoStyle(),
                            ),
                            Text(personaje.house,
                                style: const TextStyle(fontSize: 20))
                          ],
                        ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Card(
                child: Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Estudiante de Hogwarts: ",
                        style: infoStyle(),
                      ),
                      Text(
                        personaje.esEstudiante.toString(),
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 8, right: 8),
                child: Card(
                    child: Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          "Actor que lo interpreta: ${personaje.actor}",
                          style: infoStyle(),
                        ),
                      ),
                    ],
                  ),
                ))),
            FloatingActionButton(
              onPressed: () {
                var bloc = context.read<BlocVerificacion>();
                bloc.add(Creado());
              },
              child: const Text('Volver'),
            )
          ],
        ),
      ),
    );
  }

  TextStyle infoStyle() {
    return const TextStyle(fontSize: 20);
  }
}
