import 'package:flutter/material.dart';

class RecetaCard extends StatelessWidget {
  final String? title;
  final double? width;
  final String? imagen;

  const RecetaCard({
    Key? key,
    this.title,
    this.width,
    this.imagen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = Container(
        width: width != null ? width : null,
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
        decoration: buildBoxDecoration(),
        child: Column(
          children: [
            ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),

                // IMAGEN
                leading: (imagen == null)
                    ? Image(image: AssetImage('no-image.jpg'))
                    : FadeInImage.assetNetwork(
                        placeholder: 'loading.gif', image: imagen!),

                // NOMBRE COMERCIO
                title: Text(
                  'Hola',
                  // textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                isThreeLine: true,

                // INFORMACION EXTRA COMERCIO
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hola'),
                    // Text(
                    //     '${_fecha.day}/${_fecha.month}/${_fecha.year}   ${cita.horaInicio}',
                    //     style: TextStyle(color: Theme.of(context).accentColor)),
                  ],
                ),

                // ACCIONES

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // if (modoEdicionPlan == false)
                    IconButton(
                      splashRadius: 30.0,
                      iconSize: 35,
                      hoverColor: Colors.orange,
                      focusColor: Colors.orange,
                      color: Colors.blueGrey,
                      icon: Icon(Icons.calendar_today_rounded),
                      onPressed: () {
                        Navigator.pushNamed(context, 'calendarioPlan');
                      },
                    ),
                    IconButton(
                      splashRadius: 30.0,
                      iconSize: 35,
                      focusColor: Colors.orange,
                      color: Colors.blueGrey,
                      icon: Icon(
                        Icons.mode_edit_outline_rounded,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'recetasInput');
                      },
                    ),

                    // if (modoEdicionPlan)
                    IconButton(
                      splashRadius: 30.0,
                      iconSize: 35,
                      focusColor: Colors.orange,
                      color: Colors.blueGrey,
                      icon: Icon(
                        Icons.done_rounded,
                      ),
                      onPressed: () {},
                    ),
                  ],
                )),
          ],
        ));

    return GestureDetector(
      child: card,
      onTap: () {
        Navigator.pushNamed(context, 'recetasShow');
        // Provider.of<BarProvider>(context, listen: false).barSeleccionado = bar;
        // DialogoClickBar(context, bar);
        // print(bar.nombre);
      },
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
          // backgroundBlendMode: BlendMode.clear,
          // color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.08), blurRadius: 0)
          ]);
  // );
}
