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
                            Icons.home,
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
                      onTap: () {},
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.home,
                            size: 20.0,
                          ),
                          Text(
                            "Home",
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
                      onTap: () {},
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.home,
                            size: 20.0,
                          ),
                          Text(
                            "Home",
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
                      onTap: () {},
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.home,
                            size: 20.0,
                          ),
                          Text(
                            "Home",
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
                      onTap: () {},
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.home,
                            size: 20.0,
                          ),
                          Text(
                            "Home",
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

class BotonEspecial extends StatelessWidget {
  const BotonEspecial({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(30.0),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.white,
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.home,
              size: 20.0,
            ),
            Text(
              "Home",
              style: TextStyle(fontSize: 17.0),
            )
          ],
        )),
      ),
    );
  }
}


// class BotonEspecial extends StatelessWidget {
//   const BotonEspecial({
//     Key? key,
//     required this.icon,
//     required this.color,
//     required this.contexto,
//     required this.title,
//     required this.evento,
//     required this.direccion,
//     required this.filtro,
//   }) : super(key: key);

//   final String title;
//   final IconData icon;
//   final MaterialColor color;
//   final BuildContext contexto;
//   final Evento evento;
//   final String direccion;
//   final Either<String, void> filtro;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(8.0),
//       child: InkWell(
//         onTap: () {},
//         splashColor: Colors.white,
//         child: Center(
//             child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: const <Widget>[
//             Icon(
//               Icons.home,
//               size: 70.0,
//             ),
//             Text(
//               "Home",
//               style: TextStyle(fontSize: 17.0),
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }
