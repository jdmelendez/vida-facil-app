import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vida_facil/src/widgets/buttons/custom_icon_button.dart';
import 'package:vida_facil/src/widgets/inputs/custom_inputs.dart';

class RecetasShowPage extends StatefulWidget {
  @override
  _RecetasShowPageState createState() => _RecetasShowPageState();
}

class _RecetasShowPageState extends State<RecetasShowPage> {
  bool origenRecetaPropia = false;
  bool origenRecetaExterna = true;

  @override
  Widget build(BuildContext context) {
    String? imagen;
    final arg = ModalRoute.of(context)!.settings.arguments;

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
            'Receta',
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
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),

              // ####### BOTONES ################################################

              Row(
                children: [
                  Expanded(
                      child: CustomIconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'recetasInput');
                          },
                          text: 'Editar',
                          icon: Icons.edit_rounded,
                          color: Colors.blueGrey)),
                  SizedBox(
                    width: 18,
                  ),
                  Expanded(
                      child: CustomIconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'calendarioPlan');
                          },
                          text: 'Planificar',
                          icon: Icons.perm_contact_calendar_rounded,
                          color: Colors.blueGrey)),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              // ########### RECETA ########################################

              //Titulo
              Text(
                'Macarrones a la Carbonara',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueGrey[700]),
              ),

              SizedBox(
                height: 10,
              ),

              //URL
              RichText(
                  text: new TextSpan(
                children: [
                  // new TextSpan(

                  //   text: 'Direccion Web: ',
                  //   style: new TextStyle(color: Colors.black),
                  // ),

                  new TextSpan(
                    text: 'Enlace a la receta original en la Web',
                    style: new TextStyle(color: Colors.blue),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        launch(
                            'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                      },
                  ),
                ],
              )),

              SizedBox(
                height: 10,
              ),

              //Imagen
              (imagen == null)
                  ? Image(image: AssetImage('no-image.jpg'))
                  : FadeInImage.assetNetwork(
                      placeholder: 'loading.gif', image: imagen),

              //Pasos

              //Ingredientes
            ],
          ),
        )));
  }
}
