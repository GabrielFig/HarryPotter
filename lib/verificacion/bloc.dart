import 'package:bloc/bloc.dart';
import 'package:harry_popotes/dominio/character.dart';
import 'package:harry_popotes/dominio/spells.dart';
import 'dart:io';

import 'package:harry_popotes/verificacion/repositorio_characters.dart';
import 'package:harry_popotes/verificacion/repositorio_spells.dart';

class Evento {}

class Estado {}

class Creado extends Evento {}

class MostrarPersonajes extends Evento {}

class MostrarHechizos extends Evento {}

class MostrarPersonajesCasa extends Evento {}

class MostrarDetallePersonaje extends Evento {
  final Character personaje;

  MostrarDetallePersonaje(this.personaje);
}

class MostrarPersonajesDeUnaCasa extends Evento {
  final String casa;

  MostrarPersonajesDeUnaCasa(this.casa);
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

class MostrandoPersonajesPorUnaCasa extends Estado {
  final List<Character> personajes;

  MostrandoPersonajesPorUnaCasa(this.personajes);
}

class MostrandoDetalleDePersonaje extends Estado {
  final Character personaje;

  MostrandoDetalleDePersonaje(this.personaje);
}

class MostrandoHechizos extends Estado {
  final List<Spells> hechizos;

  MostrandoHechizos(this.hechizos);
}

class MostrandoPersonajesPorCasa extends Estado {}

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

    on<MostrarPersonajesCasa>((event, emit) async {
      emit(MostrandoPersonajesPorCasa());
    });

    on<MostrarPersonajesDeUnaCasa>((event, emit) async {
      RepositorioCharactersOnline repoOnline = RepositorioCharactersOnline();
      var resultado = await repoOnline.obtenerPersonajesPorFiltro(
          'https://hp-api.onrender.com/api/characters/house', event.casa);
      resultado.match((l) {
        emit(MostrandoPantallaSinInternet());
      }, (r) {
        emit(MostrandoPersonajesPorUnaCasa(r));
      });
    });

    on<MostrarDetallePersonaje>((event, emit) async {
      emit(MostrandoDetalleDePersonaje(event.personaje));
    });

    on<MostrarHechizos>((event, emit) async {
      RepositorioSpellsOnline repoOnline = RepositorioSpellsOnline();
      var resultado = await repoOnline
          .obtenerHechizos('https://hp-api.onrender.com/api/spells');
      resultado.match((l) {
        emit(MostrandoPantallaSinInternet());
      }, (r) {
        emit(MostrandoHechizos(r));
      });
    });
  }
}
