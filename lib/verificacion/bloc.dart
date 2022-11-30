import 'package:bloc/bloc.dart';
import 'dart:io';

class Evento {}

class Estado {}

class Creado extends Evento {}

class MostrarPersonajes extends Evento {
  final String direccion;

  MostrarPersonajes(this.direccion);
}

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

class BlocVerificacion extends Bloc<Evento, Estado> {
  BlocVerificacion() : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(MostrandoMainPage());
    });
  }
}
