import 'dart:io';
import 'dart:ui';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vida_facil/src/models/producto_model.dart';
import 'package:vida_facil/src/providers/productos_provider.dart';
import 'package:vida_facil/src/search/search_productos.dart';
import 'package:vida_facil/src/widgets/buttons/custom_icon_button.dart';
import 'package:vida_facil/src/widgets/cards/producto_card..dart';
import 'package:vida_facil/src/widgets/headers/custom_labels.dart';
import 'package:vida_facil/src/widgets/inputs/custom_inputs.dart';

class ProductosInputPage extends StatefulWidget {
  @override
  _ProductosInputPageState createState() => _ProductosInputPageState();
}

class _ProductosInputPageState extends State<ProductosInputPage> {
  final formKey = GlobalKey<FormState>();

  Producto _producto = new Producto();

  // bool _value = false;
  int val = -1;
  File? imagenMostrada;
  PickedFile? imagenSubida;

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
            'Nuevo Producto',
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
                Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(children: [
                      _Nombre(),
                      SizedBox(
                        height: 10,
                      ),
                      _Cantidad(),
                      SizedBox(
                        height: 10,
                      ),
                      _UnidadMedida(),
                      SizedBox(
                        height: 10,
                      ),
                      _Supermercado(),
                      SizedBox(
                        height: 10,
                      ),
                      _Precio(),
                      SizedBox(
                        height: 10,
                      ),
                      _Categoria(),
                      SizedBox(
                        height: 10,
                      ),
                      CustomLabels.h1(texto: "Imagen"),
                      _Imagen(),
                      SizedBox(
                        height: 10,
                      ),
                    ])),
                SizedBox(height: 25),
                _btnOkey(),
              ],
            ),
          ),
        )));
  }

  Column _Categoria() {
    return Column(
      children: [
        CustomLabels.h1(texto: "Categoria"),
        TextFormField(
            onSaved: (value) {
              _producto.categoria = value;
            },
            decoration: CustomInput.formInputDecoration(
                hint: 'Categoria',
                label: "Categoria",
                icon: Icons.list_alt_rounded)),
      ],
    );
  }

  Column _Precio() {
    return Column(
      children: [
        CustomLabels.h1(texto: "Precio"),
        TextFormField(
            onSaved: (value) {
              _producto.precio = value.toString();
            },
            decoration: CustomInput.formInputDecoration(
                hint: 'Precio', label: "Precio", icon: Icons.euro_rounded)),
      ],
    );
  }

  Column _Supermercado() {
    return Column(
      children: [
        CustomLabels.h1(texto: "Supermercado"),
        TextFormField(
            onSaved: (value) {
              _producto.supermercado = value;
            },
            decoration: CustomInput.formInputDecoration(
                hint: 'Supermercado',
                label: "Supermercado",
                icon: Icons.store_rounded)),
      ],
    );
  }

  Column _UnidadMedida() {
    return Column(
      children: [
        CustomLabels.h1(texto: "Unidad de medida"),
        Container(
          padding:
              const EdgeInsets.only(left: 18, right: 18, bottom: 20, top: 18),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey.shade100, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: [
                  new Radio(
                    value: 0,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = int.parse(value.toString());
                        _producto.unidadMedida = "Unidades";
                      });
                    },
                  ),
                  new Text(
                    'Unidades',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              Row(
                children: [
                  new Radio(
                    value: 1,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = int.parse(value.toString());
                        _producto.unidadMedida = "Gramos";
                      });
                    },
                  ),
                  new Text(
                    'Gramos',
                    style: new TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  new Radio(
                    value: 2,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = int.parse(value.toString());
                        _producto.unidadMedida = "Mililitros";
                      });
                    },
                  ),
                  new Text(
                    'Mililitros',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column _Cantidad() {
    return Column(
      children: [
        CustomLabels.h1(texto: "Cantidad"),
        TextFormField(
            onSaved: (value) {
              _producto.cantidad = value.toString();
            },
            decoration: CustomInput.formInputDecoration(
                hint: 'Cantidad',
                label: "Cantidad",
                icon: Icons.fastfood_rounded)),
      ],
    );
  }

  Column _Nombre() {
    return Column(
      children: [
        CustomLabels.h1(texto: "Nombre"),
        TextFormField(
            onSaved: (value) {
              _producto.nombre = value;
            },
            decoration: CustomInput.formInputDecoration(
                hint: 'Nombre producto',
                label: "Producto",
                icon: Icons.fastfood_rounded)),
      ],
    );
  }

  Row _btnOkey() {
    return Row(
      children: [
        Expanded(
          child: CustomIconButton(
            onPressed: () {
              formKey.currentState!.save();

              Provider.of<ProductosProvider>(context, listen: false)
                  .creaProducto(_producto);
            },
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
    );
  }

  Widget _Imagen() {
    return Container(
      child: Column(
        children: [
          // CustomLabels.h1(texto: "Imagen"),
          Stack(
            children: [
              ClipOval(
                child: (_producto.imagen == null)
                    ? Image(image: AssetImage('no-image.jpg'))
                    : FadeInImage.assetNetwork(
                        placeholder: 'loading.gif', image: _producto.imagen!),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: FloatingActionButton(
                    backgroundColor: Colors.indigo,
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(

                              // allowedExtensions: ['jpg', 'jpeg', 'png'],
                              allowMultiple: false);

                      if (result != null) {
                        PlatformFile file = result.files.first;
                      } else {}
                    },
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      width: 150,
      height: 160,
    );
  }
}

// class _btnOkey extends StatelessWidget {
//   const _btnOkey({
//     Key? key,
//     required this.formKey,
//     required Producto producto,
//   })  : _producto = producto,
//         super(key: key);

//   final GlobalKey<FormState> formKey;
//   final Producto _producto;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: CustomIconButton(
//             onPressed: () {
//               formKey.currentState!.save();

//               Provider.of<ProductosProvider>(context, listen: false)
//                   .creaProducto(_producto);
//             },
//             text: '',
//             icon: Icons.check_rounded,
//           ),
//         ),
//         // SizedBox(
//         //   width: 18,
//         // ),
//         // Expanded(
//         //   child: CustomIconButton(
//         //     onPressed: () {},
//         //     text: 'Nuevo',
//         //     icon: Icons.add,
//         //   ),
//         // ),
//       ],
//     );
//   }

  // ###########################################################################
  // ##########################   IMAGEN   #####################################
  // ###########################################################################

  // Widget _botonCamara(BuildContext context) {
  //   return GestureDetector(
  //       onTap: () {
  //         _tomarFoto();
  //       },
  //       child: Padding(
  //         padding:
  //             EdgeInsets.only(top: 8.0, bottom: 8.0, right: 6.0, left: 6.0),
  //         child: Container(
  //           padding: EdgeInsets.all(5.0),
  //           child: Icon(Icons.camera_alt, size: 35, color: Colors.grey[700]),
  //           decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //             color: Colors.white,
  //             boxShadow: [
  //               BoxShadow(color: Colors.black26, blurRadius: 10.0),
  //             ],
  //           ),
  //         ),
  //       ));
  // }

  // Widget _botonGaleria(BuildContext context) {
  //   return GestureDetector(
  //       onTap: () {
  //         _seleccionarFoto();
  //       },
  //       child: Padding(
  //         padding:
  //             EdgeInsets.only(top: 8.0, bottom: 8.0, right: 6.0, left: 6.0),
  //         child: Container(
  //           padding: EdgeInsets.all(5.0),
  //           child: Icon(Icons.photo_size_select_actual,
  //               size: 35, color: Colors.grey[700]),
  //           decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //             color: Colors.white,
  //             boxShadow: [
  //               BoxShadow(color: Colors.black26, blurRadius: 10.0),
  //             ],
  //           ),
  //         ),
  //       ));
  // }

  // Widget _galeriaYcamara(context) {
  //   return Row(children: [_botonGaleria(context), _botonCamara(context)]);
  // }

  //   if (imagenMostrada != null) {
  //     return Container(
  //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
  //         padding: const EdgeInsets.all(12),
  //         child: ClipRRect(
  //             borderRadius: BorderRadius.circular(20),
  //             child: Image.file(
  //               imagenMostrada,
  //               fit: BoxFit.cover,
  //               // height: 300.0,
  //             )));
  //   }
  //   return Container(
  //       padding: const EdgeInsets.all(12),
  //       child: ClipRRect(
  //           borderRadius: BorderRadius.circular(20),
  //           child: Image.asset('assets/no-image.png')));
  // }

  // Future _seleccionarFoto() async {
  //   _procesarImagen(ImageSource.gallery);
  // }

  // Future _tomarFoto() async {
  //   _procesarImagen(ImageSource.camera);
  // }

  // Future _procesarImagen(ImageSource origen) async {
  //   _imagenSubida = await ImagePicker().getImage(source: origen);

  //   setState(() {
  //     if (_imagenSubida != null) {
  //       _producto.imagen = null;
  //       imagenMostrada = File(_imagenSubida.path);
  //     } else {
  //       print('No ha seleccionado ninguna foto.');
  //     }
  //   });
  // }

