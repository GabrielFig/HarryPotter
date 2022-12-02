import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_popotes/verificacion/bloc.dart';
import 'package:harry_popotes/verificacion/vistas/vista_casas.dart';
import 'package:harry_popotes/verificacion/vistas/vista_creandose.dart';
import 'package:flutter/material.dart';
import 'package:harry_popotes/verificacion/vistas/vista_lista_personajes.dart';
import 'package:harry_popotes/verificacion/vistas/vista_lista_por_casas.dart';
import 'package:harry_popotes/verificacion/vistas/vista_main.dart';

void main() {
  runApp(const AplicacionInyectada());
}

class AplicacionInyectada extends StatelessWidget {
  const AplicacionInyectada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        BlocVerificacion blocVerificacion = BlocVerificacion();
        Future.delayed(const Duration(seconds: 2), () {
          blocVerificacion.add(Creado());
        });

        return blocVerificacion;
      },
      child: const Aplicacion(),
    );
  }
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(
          builder: (context) {
            var estado = context.watch<BlocVerificacion>().state;
            if (estado is Creandose) {
              return const Center(child: VistaCreandose());
            }
            if (estado is MostrandoMainPage) {
              return const VistaMainPage();
            }
            if (estado is MostrandoPersonajes) {
              return VistaListaPersonajes(personajes: estado.personajes);
            }
            if (estado is MostrandoPersonajesStaff) {
              return VistaListaPersonajes(personajes: estado.personajes);
            }
            if (estado is MostrandoPersonajesEstudiantes) {
              return VistaListaPersonajes(personajes: estado.personajes);
            }
            if (estado is MostrandoPersonajesPorCasa) {
              return VistaCasas();
            }
            if (estado is MostrandoPersonajesPorUnaCasa) {
              return VistaPersonajesPorCasa(personajes: estado.personajes);
            }
            return const Center(child: Text('huye'));
          },
        ),
      ),
    );
  }
}
