import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_popotes/verificacion/bloc.dart';

class VistaMainPage extends StatelessWidget {
  const VistaMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Principal'),
        backgroundColor: const Color.fromARGB(91, 10, 6, 220),
      ),
      backgroundColor: const Color.fromARGB(80, 150, 153, 225),
      body: Container(
          padding: const EdgeInsets.all(150),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 199,
                    height: 143,
                    child: Card(
                        child: InkWell(
                      onTap: () {
                        var bloc = context.read<BlocVerificacion>();
                        bloc.add(MostrarPersonajes());
                      },
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.api_rounded,
                            size: 20.0,
                          ),
                          Text(
                            "Ver todos los personajes",
                            style: TextStyle(fontSize: 17.0),
                          )
                        ],
                      )),
                    )),
                  ),
                  SizedBox(
                    width: 199,
                    height: 143,
                    child: Card(
                        child: InkWell(
                      onTap: () {
                        var bloc = context.read<BlocVerificacion>();
                        bloc.add(MostrarPersonajesStaff());
                      },
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.api_rounded,
                            size: 20.0,
                          ),
                          Text(
                            "Ver todos los maestros",
                            style: TextStyle(fontSize: 17.0),
                          )
                        ],
                      )),
                    )),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 199,
                    height: 143,
                    child: Card(
                        child: InkWell(
                      onTap: () {
                        var bloc = context.read<BlocVerificacion>();
                        bloc.add(MostrarPersonajesEstudiantes());
                      },
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.api_rounded,
                            size: 20.0,
                          ),
                          Text(
                            "Ver todos los alumnos",
                            style: TextStyle(fontSize: 17.0),
                          )
                        ],
                      )),
                    )),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 199,
                    height: 143,
                    child: Card(
                        child: InkWell(
                      onTap: () {
                        var bloc = context.read<BlocVerificacion>();
                        bloc.add(MostrarPersonajesCasa());
                      },
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.api_rounded,
                            size: 20.0,
                          ),
                          Text(
                            "Mostrar personajes por casa",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 17.0),
                          )
                        ],
                      )),
                    )),
                  ),
                  SizedBox(
                    width: 199,
                    height: 143,
                    child: Card(
                        child: InkWell(
                      onTap: () {
                        var bloc = context.read<BlocVerificacion>();
                        bloc.add(MostrarHechizos());
                      },
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.api_rounded,
                            size: 20.0,
                          ),
                          Text(
                            "Mostrar Hechizos",
                            style: TextStyle(fontSize: 17.0),
                          )
                        ],
                      )),
                    )),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
