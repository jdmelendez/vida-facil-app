import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vida_facil/src/widgets/buttons/custom_icon_button.dart';
import 'package:intl/intl.dart';
import 'package:vida_facil/src/widgets/cards/receta_card.dart';
import 'package:vida_facil/src/widgets/headers/custom_labels.dart';

class CalendarioPlanPage extends StatefulWidget {
  @override
  _CalendarioPlanPageState createState() => _CalendarioPlanPageState();
}

class _CalendarioPlanPageState extends State<CalendarioPlanPage> {
  bool semana1 = false;
  bool semana2 = false;
  bool semana3 = false;
  bool semana4 = true;

  bool L1 = false;
  bool L2 = false;
  bool L3 = false;
  bool L4 = false;

  bool M1 = false;
  bool M2 = false;
  bool M3 = false;
  bool M4 = false;

  bool X1 = false;
  bool X2 = false;
  bool X3 = false;
  bool X4 = false;

  bool J1 = false;
  bool J2 = false;
  bool J3 = false;
  bool J4 = false;

  bool V1 = false;
  bool V2 = false;
  bool V3 = false;
  bool V4 = false;

  bool S1 = false;
  bool S2 = false;
  bool S3 = false;
  bool S4 = false;

  bool D1 = false;
  bool D2 = false;
  bool D3 = false;
  bool D4 = false;

  bool desayuno = false;
  bool comida = false;
  bool merienda = false;
  bool cena = false;

  bool desdeReceta = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
            'Calendario Planning',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
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
          child: Column(children: [
            SizedBox(
              height: 8,
            ),
            // #################### SI ACCEDEMOS DESDE LA RECETA ################################
            // ##################################################################################

            if (desdeReceta)
              Column(children: [
                Text('Selecciona la receta',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.blueGrey[700])),

                //Card de la receta
                RecetaCard(),

                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 10,
                ),
                Text('Selecciona el momento del día',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.blueGrey[700])),

                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 10,
                ),

                //Opciones de periodo
                Row(
                  children: [
                    // _buscador(context),
                    Expanded(
                      child: CustomIconButton(
                          sizeFont: 18,
                          sizeIcon: 20,
                          onPressed: () {
                            setState(() {
                              desayuno = true;
                              comida = false;
                              merienda = false;
                              cena = false;
                            });
                          },
                          text: (size.width > 700.0) ? 'Desayuno' : 'Des.',
                          // icon: Icons.search_rounded,
                          color: desayuno ? Colors.amber.shade50 : Colors.white,
                          padding: 0.0),
                    ),

                    SizedBox(
                      width: 18,
                    ),
                    Expanded(
                      child: CustomIconButton(
                          sizeFont: 18,
                          sizeIcon: 20,
                          onPressed: () {
                            setState(() {
                              desayuno = false;
                              comida = true;
                              merienda = false;
                              cena = false;
                            });
                          },
                          text: (size.width > 700.0) ? 'Comida' : 'Com.',
                          // icon: Icons.format_list_numbered_rtl_rounded,
                          color: comida ? Colors.amber.shade50 : Colors.white,
                          padding: 0.0),
                    ),

                    SizedBox(
                      width: 18,
                    ),
                    Expanded(
                      child: CustomIconButton(
                          sizeFont: 18,
                          sizeIcon: 20,
                          onPressed: () {
                            setState(() {
                              desayuno = false;
                              comida = false;
                              merienda = true;
                              cena = false;
                            });
                          },
                          text: (size.width > 700.0) ? 'Merienda' : 'Mer.',
                          // icon: Icons.five_k_plus,
                          color: merienda ? Colors.amber.shade50 : Colors.white,
                          padding: 0.0),
                    ),

                    SizedBox(
                      width: 18,
                    ),
                    Expanded(
                      child: CustomIconButton(
                          sizeFont: 18,
                          sizeIcon: 20,
                          onPressed: () {
                            setState(() {
                              desayuno = false;
                              comida = false;
                              merienda = false;
                              cena = true;
                            });
                          },
                          text: (size.width > 700.0) ? 'Cena' : 'Cena',
                          // icon: Icons.search_rounded,
                          color: cena ? Colors.amber.shade50 : Colors.white,
                          padding: 0.0),
                    ),
                  ],
                ),
              ]),

            // SizedBox(
            //   height: 10,
            // ),
            // Divider(),
            SizedBox(
              height: 30,
            ),

            // ######################################### SEMANAS ###############################
            // ##################################################################################

            Text('Selecciona semanas y días a planificar',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueGrey[700])),

            SizedBox(
              height: 10,
            ),

            Row(
              children: [
                // _buscador(context),
                Expanded(
                  child: CustomIconButton(
                      sizeFont: 18,
                      sizeIcon: 20,
                      onPressed: () {
                        setState(() {
                          semana1 = true;
                          semana2 = false;
                          semana3 = false;
                          semana4 = false;
                        });
                      },
                      text: (size.width > 700.0) ? '1 Semana' : '1 Sem.',
                      // icon: Icons.search_rounded,
                      color: semana1 ? Colors.amber.shade50 : Colors.white,
                      padding: 0.0),
                ),

                SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: CustomIconButton(
                      sizeFont: 18,
                      sizeIcon: 20,
                      onPressed: () {
                        setState(() {
                          semana1 = false;
                          semana2 = true;
                          semana3 = false;
                          semana4 = false;
                        });
                      },
                      text: (size.width > 700.0) ? '2 Semanas' : '2 Sem',
                      // icon: Icons.format_list_numbered_rtl_rounded,
                      color: semana2 ? Colors.amber.shade50 : Colors.white,
                      padding: 0.0),
                ),

                SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: CustomIconButton(
                      sizeFont: 18,
                      sizeIcon: 20,
                      onPressed: () {
                        setState(() {
                          semana1 = false;
                          semana2 = false;
                          semana3 = true;
                          semana4 = false;
                        });
                      },
                      text: (size.width > 700.0) ? '3 Semanas' : '3 Sem.',
                      // icon: Icons.five_k_plus,
                      color: semana3 ? Colors.amber.shade50 : Colors.white,
                      padding: 0.0),
                ),

                SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: CustomIconButton(
                      sizeFont: 18,
                      sizeIcon: 20,
                      onPressed: () {
                        setState(() {
                          semana1 = false;
                          semana2 = false;
                          semana3 = false;
                          semana4 = true;
                        });
                      },
                      text: (size.width > 700.0) ? '4 Semanas' : '4 Sem.',
                      // icon: Icons.search_rounded,
                      color: semana4 ? Colors.amber.shade50 : Colors.white,
                      padding: 0.0),
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),

            // ######################################### DIAS ###################################
            // ##################################################################################
            if (semana1) RowSemana1(),

            if (semana2)
              Column(children: [
                RowSemana1(),
                SizedBox(
                  height: 10,
                ),
                RowSemana2(),
              ]),

            if (semana3)
              Column(children: [
                RowSemana1(),
                SizedBox(
                  height: 10,
                ),
                RowSemana2(),
                SizedBox(
                  height: 10,
                ),
                RowSemana3(),
              ]),

            if (semana4)
              Column(
                children: [
                  RowSemana1(),
                  SizedBox(
                    height: 10,
                  ),
                  RowSemana2(),
                  SizedBox(
                    height: 10,
                  ),
                  RowSemana3(),
                  SizedBox(
                    height: 10,
                  ),
                  RowSemana4(),

                  // Expanded(child: SizedBox()),
                ],
              ),

            SizedBox(
              height: 30,
            ),

            // ######################################### BOTONES ###############################
            // ##################################################################################
            // Spacer(),

            if (desdeReceta)
              // Column(
              //   children: [
              Text('Adjudica la receta a la seleción',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.blueGrey[700])),

            if (desdeReceta)
              SizedBox(
                height: 10,
              ),

            if (desdeReceta)
              CustomIconButton(
                  sizeFont: 18,
                  sizeIcon: 20,
                  onPressed: () {},
                  text: 'Adjudicar receta',
                  icon: Icons.done_rounded),

            if (desdeReceta)
              SizedBox(
                height: 30,
              ),

            Text('Actualiza tu planificación',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueGrey[700])),
            SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Expanded(
                  child: CustomIconButton(
                    sizeFont: 18,
                    sizeIcon: 20,
                    onPressed: () {},
                    text: 'Actualizar Menu',
                    icon: Icons.refresh,
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: CustomIconButton(
                      sizeFont: 18,
                      sizeIcon: 20,
                      onPressed: () {
                        _seleccionarFecha(context);
                      },
                      text: 'Fecha de Inicio',
                      icon: Icons.date_range_rounded),
                ),
              ],
            ),
          ]),
        ))));
  }

  Row RowSemana1() {
    return Row(
      children: [
        CustomLabels.h3(texto: "Sem. 1"),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onLongPressed: () {
                detalleMenuDia();
              },
              onPressed: () {
                setState(() {
                  L1 = !L1;
                });
              },
              text: 'L',
              // icon: Icons.search_rounded,
              color: L1 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  M1 = !M1;
                });
              },
              text: 'M',
              // icon: Icons.search_rounded,
              color: M1 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  X1 = !X1;
                });
              },
              text: 'X',
              // icon: Icons.search_rounded,
              color: X1 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  J1 = !J1;
                });
              },
              text: 'J',
              // icon: Icons.search_rounded,
              color: J1 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  V1 = !V1;
                });
              },
              text: 'V',
              // icon: Icons.search_rounded,
              color: V1 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  S1 = !S1;
                });
              },
              text: 'S',
              // icon: Icons.search_rounded,
              color: S1 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  D1 = !D1;
                });
              },
              text: 'D',
              // icon: Icons.search_rounded,
              color: D1 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
      ],
    );
  }

  Row RowSemana2() {
    return Row(
      children: [
        CustomLabels.h3(texto: "Sem. 2"),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  L2 = !L2;
                });
              },
              text: 'L',
              // icon: Icons.search_rounded,
              color: L2 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  M2 = !M2;
                });
              },
              text: 'M',
              // icon: Icons.search_rounded,
              color: M2 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  X2 = !X2;
                });
              },
              text: 'X',
              // icon: Icons.search_rounded,
              color: X2 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  J2 = !J2;
                });
              },
              text: 'J',
              // icon: Icons.search_rounded,
              color: J2 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  V2 = !V2;
                });
              },
              text: 'V',
              // icon: Icons.search_rounded,
              color: V2 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  S2 = !S2;
                });
              },
              text: 'S',
              // icon: Icons.search_rounded,
              color: S2 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  D2 = !D2;
                });
              },
              text: 'D',
              // icon: Icons.search_rounded,
              color: D2 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
      ],
    );
  }

  Row RowSemana3() {
    return Row(children: [
      CustomLabels.h3(texto: "Sem. 3"),
      SizedBox(
        width: 15,
      ),
      Expanded(
        child: CustomIconButton(
            sizeFont: 18,
            sizeIcon: 20,
            onPressed: () {
              setState(() {
                L3 = !L3;
              });
            },
            text: 'L',
            // icon: Icons.search_rounded,
            color: L3 ? Colors.amber.shade50 : Colors.white,
            padding: 0.0),
      ),
      SizedBox(
        width: 18,
      ),
      Expanded(
        child: CustomIconButton(
            sizeFont: 18,
            sizeIcon: 20,
            onPressed: () {
              setState(() {
                M3 = !M3;
              });
            },
            text: 'M',
            // icon: Icons.search_rounded,
            color: M3 ? Colors.amber.shade50 : Colors.white,
            padding: 0.0),
      ),
      SizedBox(
        width: 18,
      ),
      Expanded(
        child: CustomIconButton(
            sizeFont: 18,
            sizeIcon: 20,
            onPressed: () {
              setState(() {
                X3 = !X3;
              });
            },
            text: 'X',
            // icon: Icons.search_rounded,
            color: X3 ? Colors.amber.shade50 : Colors.white,
            padding: 0.0),
      ),
      SizedBox(
        width: 18,
      ),
      Expanded(
        child: CustomIconButton(
            sizeFont: 18,
            sizeIcon: 20,
            onPressed: () {
              setState(() {
                J3 = !J3;
              });
            },
            text: 'J',
            // icon: Icons.search_rounded,
            color: J3 ? Colors.amber.shade50 : Colors.white,
            padding: 0.0),
      ),
      SizedBox(
        width: 18,
      ),
      Expanded(
        child: CustomIconButton(
            sizeFont: 18,
            sizeIcon: 20,
            onPressed: () {
              setState(() {
                V3 = !V3;
              });
            },
            text: 'V',
            // icon: Icons.search_rounded,
            color: V3 ? Colors.amber.shade50 : Colors.white,
            padding: 0.0),
      ),
      SizedBox(
        width: 18,
      ),
      Expanded(
        child: CustomIconButton(
            sizeFont: 18,
            sizeIcon: 20,
            onPressed: () {
              setState(() {
                S3 = !S3;
              });
            },
            text: 'S',
            // icon: Icons.search_rounded,
            color: S3 ? Colors.amber.shade50 : Colors.white,
            padding: 0.0),
      ),
      SizedBox(
        width: 18,
      ),
      Expanded(
        child: CustomIconButton(
            sizeFont: 18,
            sizeIcon: 20,
            onPressed: () {
              setState(() {
                D3 = !D3;
              });
            },
            text: 'D',
            // icon: Icons.search_rounded,
            color: D3 ? Colors.amber.shade50 : Colors.white,
            padding: 0.0),
      ),
    ]);
  }

  Row RowSemana4() {
    return Row(
      children: [
        CustomLabels.h3(texto: "Sem. 4"),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  L4 = !L4;
                });
              },
              text: 'L',
              // icon: Icons.search_rounded,
              color: L4 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  M4 = !M4;
                });
              },
              text: 'M',
              // icon: Icons.search_rounded,
              color: M4 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  X4 = !X4;
                });
              },
              text: 'X',
              // icon: Icons.search_rounded,
              color: X4 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  J4 = !J4;
                });
              },
              text: 'J',
              // icon: Icons.search_rounded,
              color: J4 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  V4 = !V4;
                });
              },
              text: 'V',
              // icon: Icons.search_rounded,
              color: V4 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  S4 = !S4;
                });
              },
              text: 'S',
              // icon: Icons.search_rounded,
              color: S4 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: CustomIconButton(
              sizeFont: 18,
              sizeIcon: 20,
              onPressed: () {
                setState(() {
                  D4 = !D4;
                });
              },
              text: 'D',
              // icon: Icons.search_rounded,
              color: D4 ? Colors.amber.shade50 : Colors.white,
              padding: 0.0),
        ),
      ],
    );
  }

  Future<dynamic> detalleMenuDia() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Center(child: new Text("Menú del Dia")),
          content: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // DESAYUNO
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text('Desayuno:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('-'),
                  ),
                  CustomIconButton(
                    sizeFont: 18,
                    sizeIcon: 20,
                    onPressed: () {},
                    text: '',
                    icon: Icons.mode_edit_outline_rounded,
                  ),
                ],
              ),
              Divider(),

              // COMIDA
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text('Comida:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Macarrones a la carbonara'),
                  ),
                  CustomIconButton(
                    sizeFont: 18,
                    sizeIcon: 20,
                    onPressed: () {},
                    text: '',
                    icon: Icons.mode_edit_outline_rounded,
                  ),
                ],
              ),
              Divider(),

              // MERIENDA
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text('Merienda:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('-'),
                  ),
                  CustomIconButton(
                    sizeFont: 18,
                    sizeIcon: 2,
                    onPressed: () {},
                    text: '',
                    icon: Icons.mode_edit_outline_rounded,
                  ),
                ],
              ),
              Divider(),

              // CENA
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text('Cena:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('-'),
                  ),
                  CustomIconButton(
                    sizeFont: 18,
                    sizeIcon: 20,
                    onPressed: () {
                      // TODO: ACTIVAR MODO SELECCION CON PROVIDER PARA CARD RECETAS

                      Navigator.pushNamed(context, 'recetas');
                    },
                    text: '',
                    icon: Icons.mode_edit_outline_rounded,
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Modificar"),
              onPressed: () {
                //Apuntar al objeto del planning
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //////########################## DATE PICKER ####
  _seleccionarFecha(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      // initialDatePickerMode: DatePickerMode.day,
      // locale: Locale('ES-es'),
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      helpText:
          'Selecciona el dia que quiere que tu plan comience.', // Can be used as title
      cancelText: 'Cancelar',
      confirmText: 'OK',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
