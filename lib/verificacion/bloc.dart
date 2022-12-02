import 'package:bloc/bloc.dart';
import 'package:harry_popotes/dominio/character.dart';
import 'dart:io';

import 'package:harry_popotes/verificacion/repositorio_characters.dart';

class Evento {}

class Estado {}

class Creado extends Evento {}

class MostrarPersonajes extends Evento {}

class MostrarHechizos extends Evento {
  final String direccion;

  MostrarHechizos(this.direccion);
}

class MostrarPersonajesCasa extends Evento {
  final String direccion;
  final String casa;

  MostrarPersonajesCasa(this.direccion, this.casa);
}

class MostrarPersonajesEstudiantes extends Evento {
  final String direccion;
  final String estudiante;

  MostrarPersonajesEstudiantes(this.direccion, this.estudiante);
}

class MostrarPersonajesStaff extends Evento {
  final String direccion;
  final String staff;

  MostrarPersonajesStaff(this.direccion, this.staff);
}

class MostrandoMainPage extends Estado {}

class Creandose extends Estado {}

class MostrandoPersonajes extends Estado {
  final List<Character> personajes;

  MostrandoPersonajes(this.personajes);
}

class MostrandoPantallaSinInternet extends Estado {}

class BlocVerificacion extends Bloc<Evento, Estado> {
  BlocVerificacion() : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(MostrandoMainPage());
    });

    on<MostrarPersonajes>((event, emit) async {
      RepositorioCharactersOnline repoOnline = RepositorioCharactersOnline();
      var resultado = await repoOnline
          .obtenerPersonajes('https://hp-api.onrender.com/api/characters');
      resultado.match((l) {
        emit(MostrandoPantallaSinInternet());
      }, (r) {
        emit(MostrandoPersonajes(r));
      });
    });
  }
}
