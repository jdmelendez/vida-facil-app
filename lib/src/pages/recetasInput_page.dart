import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vida_facil/src/widgets/buttons/custom_icon_button.dart';
import 'package:vida_facil/src/widgets/headers/custom_labels.dart';
import 'package:vida_facil/src/widgets/inputs/custom_inputs.dart';

class RecetasInputPage extends StatefulWidget {
  @override
  _RecetasInputPageState createState() => _RecetasInputPageState();
}

class _RecetasInputPageState extends State<RecetasInputPage> {
  bool origenRecetaPropia = false;
  bool origenRecetaExterna = true;
  String? imagen;

  List<String?> descripcionPasos = ['', ''];

  // REQUIRED: USED TO CONTROL THE STEPPER.
  int activeStep = 0; // Initial step set to 0.

  // OPTIONAL: can be set directly.

  int dotCount = 2;

  final formKey = GlobalKey<FormState>();

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
            'Nueva Receta',
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
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomIconButton(
                            onPressed: () {
                              setState(() {
                                origenRecetaPropia = !origenRecetaPropia;
                                origenRecetaExterna = !origenRecetaExterna;
                              });
                            },
                            text: 'Externa',
                            icon: Icons.public_rounded,
                            color: origenRecetaExterna
                                ? Colors.amber.shade50
                                : Colors.white)),
                    SizedBox(
                      width: 18,
                    ),
                    Expanded(
                      child: CustomIconButton(
                          onPressed: () {
                            setState(() {
                              origenRecetaPropia = !origenRecetaPropia;
                              origenRecetaExterna = !origenRecetaExterna;
                            });
                          },
                          text: 'Propia',
                          icon: Icons.how_to_reg_rounded,
                          color: origenRecetaPropia
                              ? Colors.amber.shade50
                              : Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                // ORIGEN EXTERNO
                if (origenRecetaExterna)
                  Form(
                      // key: formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(children: [
                        CustomLabels.h1(texto: "Nombre de la receta"),
                        TextFormField(
                            decoration: CustomInput.formInputDecoration(
                                hint: 'Nombre',
                                label: "Nombre",
                                icon: Icons.new_label_rounded)),
                        SizedBox(
                          height: 10,
                        ),
                        CustomLabels.h1(texto: "Dirección Web"),
                        TextFormField(
                            decoration: CustomInput.formInputDecoration(
                                hint: 'URL',
                                label: "URL",
                                icon: Icons.language_rounded)),
                        SizedBox(
                          height: 10,
                        ),
                        CustomLabels.h1(texto: "Ingredientes"),
                        TextFormField(
                            decoration: CustomInput.formInputDecoration(
                                hint: 'Ingredientes',
                                label: "Ingredientes",
                                icon: Icons.local_grocery_store_rounded)),
                        SizedBox(
                          height: 10,
                        )
                      ])),

                //ORIGEN PROPIO
                if (origenRecetaPropia)
                  Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(children: [
                        CustomLabels.h1(texto: "Nombre de la receta"),
                        TextFormField(
                            decoration: CustomInput.formInputDecoration(
                                hint: 'Nombre',
                                label: "Nombre",
                                icon: Icons.new_label_rounded)),
                        SizedBox(
                          height: 10,
                        ),
                        CustomLabels.h1(texto: "Pasos a seguir"),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 18, right: 18, bottom: 20, top: 18),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blueGrey.shade100, width: 1),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  previousButton(),
                                  DotStepper(
                                    // direction: Axis.vertical,
                                    dotCount: dotCount,
                                    dotRadius: 10,
                                    tappingEnabled: false,

                                    /// THIS MUST BE SET. SEE HOW IT IS CHANGED IN NEXT/PREVIOUS BUTTONS AND JUMP BUTTONS.
                                    activeStep: activeStep,
                                    shape: Shape.circle,
                                    spacing: 15,
                                    indicator: Indicator.slide,

                                    /// TAPPING WILL NOT FUNCTION PROPERLY WITHOUT THIS PIECE OF CODE.
                                    // onDotTapped: (tappedDotIndex) {
                                    //   setState(() {
                                    //     activeStep = tappedDotIndex;
                                    //   });
                                    // },

                                    // DOT-STEPPER DECORATIONS
                                    fixedDotDecoration: FixedDotDecoration(
                                      strokeColor: Colors.blueGrey,
                                      strokeWidth: 10,
                                      color: Colors.blueGrey,
                                    ),

                                    indicatorDecoration: IndicatorDecoration(
                                      // style: PaintingStyle.stroke,
                                      strokeWidth: 10,
                                      strokeColor: Colors.amber.shade50,
                                      color: Colors.amber.shade50,
                                    ),

                                    lineConnectorDecoration:
                                        LineConnectorDecoration(
                                      color: Colors.blueGrey,
                                      strokeWidth: 10,
                                    ),
                                  ),
                                  nextButton()
                                ],
                              ),

                              pasoReceta(),
                              // PasoReceta(
                              //     activeStep: activeStep,
                              //     imagen: imagen,
                              //     descripcionPasos: descripcionPasos),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomLabels.h1(texto: "Ingredientes"),
                        TextFormField(
                            decoration: CustomInput.formInputDecoration(
                                hint: 'Ingredientes',
                                label: "Ingredientes",
                                icon: Icons.local_grocery_store_rounded)),
                        SizedBox(
                          height: 10,
                        )
                      ])),

                Row(
                  children: [
                    Expanded(
                      child: CustomIconButton(
                        onPressed: () {},
                        text: '',
                        icon: Icons.check_rounded,
                      ),
                    ),
                    // SizedBox(
                    //   width: 18,
                    // ),
                    // Expanded(
                    //   child: CustomIconButton(
                    //     onPressed: () {},
                    //     text: 'Nuevo',
                    //     icon: Icons.add,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        )));
  }

  /// Jump buttons.

  /// Generates jump steps for dotCount number of steps, and returns them in a row.
  Row steps() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(dotCount, (index) {
        return ElevatedButton(
          child: Text('${index + 1}'),
          onPressed: () {
            setState(() {
              activeStep = index;
            });
          },
        );
      }),
    );
  }

  /// Returns the next button widget.
  Widget nextButton() {
    return CustomIconButton(
        sizeFont: 14,
        onPressed: () {
          if (activeStep < dotCount) {
            setState(() {
              activeStep++;
              // dotCount++;
            });
          }
        },
        text: 'Siguiente');

    /// ACTIVE STEP MUST BE CHECKED FOR (dotCount - 1) AND NOT FOR dotCount To PREVENT Overflow ERROR.
  }

  Widget addStep() {
    return CustomIconButton(
        sizeFont: 14,
        onPressed: () {
          // activeStep MUST BE GREATER THAN 0 TO PREVENT OVERFLOW.

          setState(() {
            dotCount++;
          });
        },
        text: 'Añadir Paso');
  }

  /// Returns the previous button widget.
  Widget previousButton() {
    return CustomIconButton(
        sizeFont: 14,
        onPressed: () {
          // activeStep MUST BE GREATER THAN 0 TO PREVENT OVERFLOW.
          if (activeStep > 0) {
            setState(() {
              activeStep--;
              // dotCount--;
            });
          }
        },
        text: 'Anterior');
  }

  Widget pasoReceta() {
    return Column(
      children: [
        CustomLabels.h2(texto: "Paso Nº ${(activeStep + 1).toString()}"),
        Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                (imagen == null)
                    ? Image(
                        image: AssetImage(
                          'no-image.jpg',
                        ),
                        fit: BoxFit.fitHeight,
                        height: 135,
                      )
                    : FadeInImage.assetNetwork(
                        height: 135,
                        fit: BoxFit.fitHeight,
                        placeholder: 'loading.gif',
                        image: imagen!),
                SizedBox(
                  height: 5,
                ),
                CustomIconButton(
                  onPressed: () {},
                  text: '',
                  icon: Icons.camera_rounded,
                  sizeIcon: 20,
                )
              ],
            ),
            SizedBox(
              width: 18,
            ),
            Flexible(
              child: TextFormField(
                  key:
                      Key(descripcionPasos[activeStep].toString()), // <- Magic!
                  initialValue: descripcionPasos[activeStep],
                  keyboardType: TextInputType.multiline,
                  minLines: 7,
                  maxLines: null,
                  onSaved: (value) {
                    descripcionPasos.removeAt(activeStep);
                    descripcionPasos.insert(activeStep, value!);
                  },
                  decoration: CustomInput.formInputDecoration(
                      hint: descripcionPasos[activeStep],
                      label: "Descripción",
                      icon: Icons.new_label_rounded)),
            ),
          ],
        ),
        SizedBox(
          height: 18,
        ),
        CustomIconButton(
            sizeFont: 14,
            onPressed: () {
              formKey.currentState!.save();
              formKey.currentState!.reset();
              setState(() {
                dotCount++;
                activeStep++;
                descripcionPasos.insert(activeStep, '');
              });
            },
            text: 'Confirmar paso')
      ],
    );
  }
}
