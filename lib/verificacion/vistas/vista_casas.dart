import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc.dart';

class VistaCasas extends StatelessWidget {
  const VistaCasas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> lista = ['Gryffindor', 'Hufflepuff', 'Ravenclaw', 'Slytherin'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de casas'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index) {
              return Card(
                  child: InkWell(
                onTap: () {
                  var bloc = context.read<BlocVerificacion>();
                  bloc.add(MostrarPersonajesDeUnaCasa(lista[index]));
                },
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.home,
                      size: 40.0,
                    ),
                    Text(
                      lista[index].toString(),
                      style: const TextStyle(fontSize: 17.0),
                    )
                  ],
                )),
              ));
            },
          )),
          FloatingActionButton(
            onPressed: () {
              var bloc = context.read<BlocVerificacion>();
              bloc.add(Creado());
            },
            child: const Text('Volver'),
          )
        ],
      ),
    );
  }
}
