import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vida_facil/src/models/producto_model.dart';
import 'package:vida_facil/src/providers/productos_provider.dart';

// ##########################################################################
//                                CARD PRODUCTO
// ##########################################################################

class ProductoGeneralCard extends StatelessWidget {
  final Producto producto;
  final Size size;

  const ProductoGeneralCard({
    Key? key,
    required this.producto,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _productosProvider =
        Provider.of<ProductosProvider>(context, listen: false);

    final card = Container(
        // width: width != null ? width : null,
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: buildBoxDecoration(),
        child: Column(children: [
          Container(
            width: double.infinity,
            // height: 110,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _imagen(),
                      _nombreProducto(),
                      (size.width < 700.0)
                          ? Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      _btnEditar(context),
                                      _btnEliminar(),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      _btnAnadirListaCompra(_productosProvider),
                                      _btnEliminarListaCompra(
                                          _productosProvider)
                                    ],
                                  )
                                ],
                              ),
                            )
                          : Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      _btnEditar(context),
                                      _btnEliminar(),
                                      _btnAnadirListaCompra(_productosProvider),
                                      _btnEliminarListaCompra(
                                          _productosProvider)
                                    ],
                                  )
                                ],
                              ),
                            )
                    ]),
                // Row(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       _btnEditar(context),
                //       _btnEliminar(),
                //       _btnAnadirListaCompra(_productosProvider),
                //       _btnEliminarListaCompra(_productosProvider)
                //     ])
              ],
            ),
          )
        ]));

    // Expanded(
    //     flex: 2,
    //     child: Padding(
    //         padding:
    //             const EdgeInsets.only(right: 8.0),
    //         child: Column(
    //             // mainAxisSize: MainAxisSize
    //             mainAxisAlignment:
    //                 MainAxisAlignment.spaceBetween,
    //             crossAxisAlignment:
    //                 CrossAxisAlignment.start,
    //             children: [
    //               Row(
    //                   mainAxisAlignment:
    //                       MainAxisAlignment
    //                           .spaceBetween,
    //                   children: [
    //                     _nombreProducto(),
    //                   ]),
    //               Row(
    //                   crossAxisAlignment:
    //                       CrossAxisAlignment.center,
    //                   mainAxisAlignment:
    //                       MainAxisAlignment
    //                           .spaceBetween,
    //                   children: [
    //                     _btnEditar(context),
    //                     _btnEliminar(),
    //                     _btnAnadirListaCompra(
    //                         _productosProvider),
    //                     _btnEliminarListaCompra(
    //                         _productosProvider)
    //                   ])
    //                                   ])))
    //                     ])),
    //               ])))
    // ]));

    //     ListTile(
    //         tileColor: (producto.enListaCompra == true)
    //             ? Colors.green.shade100
    //             : Colors.transparent,
    //         contentPadding: EdgeInsets.symmetric(horizontal: 10.0),

    //         // IMAGEN
    //         leading: (producto.imagen == null)
    //             ? Image(image: AssetImage('no-image.jpg'))
    //             : FadeInImage.assetNetwork(
    //                 placeholder: 'loading.gif', image: producto.imagen!),

    //         // NOMBRE COMERCIO
    //         title: Text(
    //           producto.nombre!,
    //           // textAlign: TextAlign.center,
    //           style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    //         ),
    //         isThreeLine: true,

    //         // INFORMACION EXTRA COMERCIO
    //         subtitle: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(producto.supermercado!),
    //             // Text(
    //             //     '${_fecha.day}/${_fecha.month}/${_fecha.year}   ${cita.horaInicio}',
    //             //     style: TextStyle(color: Theme.of(context).accentColor)),
    //           ],
    //         ),

    //         // ACCIONES

    //         trailing: Row(mainAxisSize: MainAxisSize.min, children: [
    //           // if (modoEdicionPlan == false)

    //           IconButton(
    //             splashRadius: 30.0,
    //             iconSize: 35,
    //             focusColor: Colors.orange,
    //             color: Colors.blueGrey,
    //             icon: Icon(
    //               Icons.mode_edit_outline_rounded,
    //             ),
    //             onPressed: () {
    //               Navigator.pushNamed(context, 'productosInput');
    //             },
    //           ),
    //           IconButton(
    //             splashRadius: 30.0,
    //             iconSize: 35,
    //             focusColor: Colors.orange,
    //             color: Colors.blueGrey,
    //             icon: Icon(
    //               Icons.delete_rounded,
    //             ),
    //             onPressed: () {},
    //           ),
    //           IconButton(
    //             splashRadius: 30.0,
    //             iconSize: 35,
    //             focusColor: Colors.orange,
    //             icon: Icon(
    //               Icons.add_shopping_cart_rounded,
    //               // size: 30,
    //             ),
    //             onPressed: () {
    //               _productosProvider.addProductoListaCompra(producto);
    //             },
    //           ),
    //           IconButton(
    //             splashRadius: 30.0,
    //             iconSize: 35,
    //             focusColor: Colors.orange,
    //             icon: Icon(
    //               Icons.remove_shopping_cart_rounded,
    //               // size: 30,
    //             ),
    //             onPressed: () {
    //               _productosProvider.eliminaProductoListaCompra(producto);
    //             },
    //           )
    //         ])),
    //     // Divider()
    //   ],
    // ));

    return GestureDetector(
      child: card,
      onTap: () {
        // Provider.of<BarProvider>(context, listen: false).barSeleccionado = bar;
        // DialogoClickBar(context, bar);
        // print(bar.nombre);
      },
    );
  }

  IconButton _btnEliminarListaCompra(ProductosProvider _productosProvider) {
    return IconButton(
      splashRadius: 25.0,
      iconSize: 35,
      hoverColor: Colors.blueGrey.shade100,
      focusColor: Colors.blueGrey,
      icon: Icon(Icons.remove_shopping_cart_rounded,
          color: (producto.enListaCompra == false) ? Colors.red : Colors.grey
          // size: 30,
          ),
      onPressed: () {
        _productosProvider.eliminaProductoListaCompra(producto);
      },
    );
  }

  IconButton _btnAnadirListaCompra(ProductosProvider _productosProvider) {
    return IconButton(
      splashRadius: 25.0,
      iconSize: 35,
      hoverColor: Colors.blueGrey.shade100,
      icon: Icon(Icons.add_shopping_cart_rounded,
          color: (producto.enListaCompra == true) ? Colors.green : Colors.grey
          // size: 30,
          ),
      onPressed: () {
        _productosProvider.addProductoListaCompra(producto);
      },
    );
  }

  IconButton _btnEliminar() {
    return IconButton(
      splashRadius: 25.0,
      iconSize: 35,
      hoverColor: Colors.blueGrey.shade100,
      color: Colors.blueGrey,
      icon: Icon(
        Icons.delete_rounded,
      ),
      onPressed: () {},
    );
  }

  IconButton _btnEditar(BuildContext context) {
    return IconButton(
      splashRadius: 25.0,
      iconSize: 35,
      hoverColor: Colors.blueGrey.shade100,
      color: Colors.blueGrey,
      icon: Icon(
        Icons.mode_edit_outline_rounded,
      ),
      onPressed: () {
        Navigator.pushNamed(context, 'productosInput');
      },
    );
  }

  Text _nombreProducto() {
    return Text(producto.nombre!,
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold));
  }

  Container _imagen() {
    return Container(
        // height: 65,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: (producto.imagen == null)
              ? Image(
                  image: AssetImage('no-image.jpg'),
                  height: (size.width < 700) ? 75 : 50,
                  // width: 70,
                  fit: BoxFit.fill)
              : FadeInImage.assetNetwork(
                  placeholder: 'loading.gif',
                  image: producto.imagen!,
                  // height: 50,
                  // width: 85,
                  // fit: BoxFit.fill,
                ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
          Radius.circular(3.0),
        )));
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
          // backgroundBlendMode: BlendMode.clear,
          // color: (producto.enListaCompra == true)
          //     ? Colors.green.shade100
          //     : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.08), blurRadius: 0)
          ]);
}

// ##########################################################################
//                                CARD LISTA COMPRA
// ##########################################################################

class ProductoListaCompraCard extends StatefulWidget {
  final Producto producto;

  const ProductoListaCompraCard({
    Key? key,
    required this.producto,
  }) : super(key: key);

  @override
  _ProductoListaCompraCardState createState() =>
      _ProductoListaCompraCardState();
}

class _ProductoListaCompraCardState extends State<ProductoListaCompraCard> {
  bool seleccionado = false;

  @override
  Widget build(BuildContext context) {
    final _productosProvider =
        Provider.of<ProductosProvider>(context, listen: true);
    final card = Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
        decoration: buildBoxDecoration(),
        child: Column(children: [
          ListTile(
            tileColor: seleccionado
                ? Colors.green.withOpacity(0.6)
                : Colors.grey.withOpacity(0.08),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),

            // IMAGEN
            leading: (widget.producto.imagen == null)
                ? Image(image: AssetImage('no-image.jpg'))
                : FadeInImage.assetNetwork(
                    placeholder: 'loading.gif', image: widget.producto.imagen!),

            // NOMBRE PRODUCTO
            title: Text(
              widget.producto.nombre!,
              // textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            isThreeLine: true,

            // INFORMACION EXTRA COMERCIO
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.producto.supermercado!),
                // Text(
                //     '${_fecha.day}/${_fecha.month}/${_fecha.year}   ${cita.horaInicio}',
                //     style: TextStyle(color: Theme.of(context).accentColor)),
              ],
            ),
          )
        ]));

    return GestureDetector(
      child: card,
      onTap: () {
        setState(() {
          seleccionado = !seleccionado;

          widget.producto.comprado = seleccionado;
          _productosProvider.estadoCompraProductoListaCompra(widget.producto);
        });

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
        // boxShadow: [
        //   BoxShadow(
        //       color: seleccionado
        //           ? Colors.green.withOpacity(0.6)
        //           : Colors.grey.withOpacity(0.08),
        //       blurRadius: 0)]
      );
}
