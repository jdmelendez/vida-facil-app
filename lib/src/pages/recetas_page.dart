import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vida_facil/src/search/search_productos.dart';
import 'package:vida_facil/src/widgets/buttons/custom_icon_button.dart';
import 'package:vida_facil/src/widgets/cards/receta_card.dart';

class RecetasPage extends StatefulWidget {
  @override
  _RecetasPageState createState() => _RecetasPageState();
}

class _RecetasPageState extends State<RecetasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[Colors.red, Colors.indigo.shade300],
              ),
            ),
          ),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.blueGrey[800],
          centerTitle: true,
          title: Text(
            'Recetas',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context, false),
            // onPressed:() => exit(0),)
          ),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      // _buscador(context),
                      _buscarReceta(context),
                      SizedBox(
                        width: 18,
                      ),
                      _nuevaReceta(context),
                    ],
                  ),

                  // Listado de productos
                  _listadoRecetas(),
                  // )
                ]))));
  }

  Flexible _listadoRecetas() {
    return Flexible(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          // child: Center(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              // Text('Comercios', style: CustomLabels.h1),
              SizedBox(
                height: 10,
              ),
              Container(
                //TODO: FUTUREBUILDER
                // child: FutureBuilder(
                //   future: _negociosProvider.getNegocios(),
                //   builder: (BuildContext context,
                //       AsyncSnapshot<List<Negocio>> snapshot) {
                //     if (snapshot.hasData) {
                //       List<Negocio>? _negocios = snapshot.data;

                //       return Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return RecetaCard();
                    }),
              )
              //     } else {
              //       return Container(
              //           height: 400.0,
              //           child: Center(child: CircularProgressIndicator()));
              //     }
              //   },
              // ),
            ],
          )),
    );
  }

  Expanded _nuevaReceta(BuildContext context) {
    return Expanded(
      child: CustomIconButton(
        onPressed: () {
          Navigator.pushNamed(context, 'recetasInput');
        },
        text: 'Nuevo',
        icon: Icons.add,
      ),
    );
  }

  Expanded _buscarReceta(BuildContext context) {
    return Expanded(
      child: CustomIconButton(
        onPressed: () {
          showSearch(context: context, delegate: DataSearch());
        },
        text: 'Buscar',
        icon: Icons.search_rounded,
      ),
    );
  }
}
