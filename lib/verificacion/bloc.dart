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

class MostrarPersonajesEstudiantes extends Evento {}

class MostrarPersonajesStaff extends Evento {}

class MostrandoMainPage extends Estado {}

class Creandose extends Estado {}

class MostrandoPersonajes extends Estado {
  final List<Character> personajes;

  MostrandoPersonajes(this.personajes);
}

class MostrandoPersonajesStaff extends Estado {
  final List<Character> personajes;

  MostrandoPersonajesStaff(this.personajes);
}

class MostrandoPersonajesEstudiantes extends Estado {
  final List<Character> personajes;

  MostrandoPersonajesEstudiantes(this.personajes);
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

    on<MostrarPersonajesStaff>((event, emit) async {
      RepositorioCharactersOnline repoOnline = RepositorioCharactersOnline();
      var resultado = await repoOnline.obtenerPersonajesPorFiltro(
          'https://hp-api.onrender.com/api/characters', 'staff');
      resultado.match((l) {
        emit(MostrandoPantallaSinInternet());
      }, (r) {
        emit(MostrandoPersonajesStaff(r));
      });
    });

    on<MostrarPersonajesEstudiantes>((event, emit) async {
      RepositorioCharactersOnline repoOnline = RepositorioCharactersOnline();
      var resultado = await repoOnline.obtenerPersonajesPorFiltro(
          'https://hp-api.onrender.com/api/characters', 'students');
      resultado.match((l) {
        emit(MostrandoPantallaSinInternet());
      }, (r) {
        emit(MostrandoPersonajesEstudiantes(r));
      });
    });
  }
}
