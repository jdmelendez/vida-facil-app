import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  // final baresProvider_Local = new BaresProvider_Local();
  // final datosUsuarioProvider_DB = new DatosUsuario_DB();

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Sugerencias que aparecen cuando la persona escribe

    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
        // future: datosUsuarioProvider_DB.buscarNegocio(query),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        final negocios = snapshot.data;

        return Column(
          children: [
            // Flexible(
            // child:
            // CardNegocioScroll(
            //   negocios: negocios!,
            // ),
            // )
          ],
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }
}

// class CardNegocioScroll extends StatelessWidget {
//   List<Usuario> negocios = [];
//   DatosUsuario_DB datosUsuario_DB = DatosUsuario_DB();

//   CardNegocioScroll({required this.negocios});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.only(top: 1.0),
//         child: ListView.builder(
//             shrinkWrap: true,
//             physics: BouncingScrollPhysics(),
//             itemCount: negocios.length,
//             itemBuilder: (BuildContext context, int index) {
//               return cardNegocio(context, negocios[index]);
//             }));
//   }

//   Widget cardNegocio(BuildContext context, Usuario _negocio) {
//     // Usuario _negocio =
//     //     Provider.of<DatosUsuarioProvider>(context, listen: false).negocio;

//     final card = Container(
//         margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//         decoration: BoxDecoration(boxShadow: [
//           BoxShadow(color: Colors.black26, blurRadius: 3.0),
//         ], borderRadius: BorderRadius.circular(10.0), color: Colors.white),
//         // color: (soloFuturas == true)
//         //     ? Colors.white
//         //     : (date.isAfter(_fecha))
//         //         ? Colors.red[100]
//         //         : Colors.green[100]),
//         // height: 70,
//         // child: Card(
//         // elevation: 0.0,
//         // shape: RoundedRectangleBorder(
//         //   borderRadius: BorderRadius.circular(10.0),
//         //   side: new BorderSide(
//         //       color: Theme.of(context).primaryColorDark, width: 1.0),
//         // ),
//         child: Column(
//           children: [
//             ListTile(
//               contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//               leading: (_negocio.imagen == null)
//                   ? CircleAvatar(
//                       radius: 27,
//                       backgroundImage: Image(
//                         image: AssetImage('assets/no_imagen.png'),
//                         // height: 60,
//                         // width: 60,
//                         fit: BoxFit.fill,
//                       ).image)
//                   : CircleAvatar(
//                       radius: 27,
//                       backgroundImage: FadeInImage(
//                         image: NetworkImage(_negocio.imagen!),
//                         placeholder: AssetImage('assets/no_imagen.png'),
//                         // height: 60,
//                         // width: 60,
//                         fit: BoxFit.fill,
//                       ).image),
//               title: Text(
//                 _negocio.nombre!,
//                 // textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey[800],
//                     fontSize: 18),
//               ),
//               isThreeLine: true,
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(_negocio.direccion!),
//                 ],
//               ),
//               trailing: Icon(
//                 Icons.keyboard_arrow_right,
//                 size: 40,
//                 color: Theme.of(context).accentColor,
//               ),
//             ),
//             // Divider()
//           ],
//         ));

//     return GestureDetector(
//       child: card,
//       onTap: () {
//         showDialog(
//           useSafeArea: true,
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//                 actionsPadding: EdgeInsets.all(12),
//                 title: Text(
//                     "¿Desea reservar una cita en ${_negocio.nombre!.toUpperCase()} ?"),
//                 // content: TextFormField(
//                 //   controller: _controller,
//                 // ),

//                 actions: <Widget>[
//                   SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           FlatButton(
//                             minWidth: 50,
//                             height: 50.0,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(50)),
//                             color: Colors.grey[500],
//                             child: Text(
//                               "NO",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                           ),
//                           FlatButton(
//                             minWidth: 50,
//                             height: 50.0,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(50)),
//                             color: Theme.of(context).accentColor,
//                             child: Text("SI"),
//                             onPressed: () {
//                               Provider.of<DatosUsuarioProvider>(context,
//                                       listen: false)
//                                   .negocioSeleccionadoCita = _negocio;
//                               Navigator.pushNamed(
//                                   context, 'clienteReservarCita_page');
//                             },
//                           ),
//                         ],
//                       ))
//                 ]);
//           },
//         ).then((val) {});
//         // DialogoClickBar(context, bar);
//         // print(bar.nombre);
//       },
//     );
//   }
// }
