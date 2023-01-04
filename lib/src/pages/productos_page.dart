import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vida_facil/src/models/producto_model.dart';
import 'package:vida_facil/src/providers/productos_provider.dart';
import 'package:vida_facil/src/search/search_productos.dart';
import 'package:vida_facil/src/widgets/buttons/custom_icon_button.dart';
import 'package:vida_facil/src/widgets/cards/producto_card..dart';

class ProductosPage extends StatefulWidget {
  @override
  _ProductosPageState createState() => _ProductosPageState();
}

class _ProductosPageState extends State<ProductosPage> {
  @override
  Widget build(BuildContext context) {
    final _productos = Provider.of<ProductosProvider>(context, listen: true);

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
            'Productos',
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
                      _buscarProducto(context),
                      SizedBox(
                        width: 18,
                      ),
                      _nuevoProducto(context),
                      SizedBox(
                        width: 18,
                      ),
                      _categorias(context)
                    ],
                  ),
                  // Listado de productos
                  _listadoProductos(_productos, size)
                ]))));
  }

  Flexible _listadoProductos(ProductosProvider _productos, Size size) {
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
            child: FutureBuilder(
              future: _productos.obtenerProductos(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Producto>> snapshot) {
                if (snapshot.hasData) {
                  List<Producto>? _listaProductos = snapshot.data;

                  return Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: _listaProductos!.length,
                        itemBuilder: (context, index) {
                          return ProductoGeneralCard(
                              producto: _listaProductos[index], size: size);
                        }),
                  );
                } else {
                  return Container(
                      height: 400.0,
                      child: Center(child: CircularProgressIndicator()));
                }
              },
            ),
          ),

          // )
        ],
      ),
    ));
  }

  Expanded _nuevoProducto(BuildContext context) {
    return Expanded(
      child: CustomIconButton(
        onPressed: () {
          Navigator.pushNamed(context, 'productosInput');
        },
        // text: 'Nuevo',
        icon: Icons.add,
      ),
    );
  }

  Expanded _categorias(BuildContext context) {
    return Expanded(
      child: CustomIconButton(
        onPressed: () {
          Navigator.pushNamed(context, 'categoriasProductos');
        },
        // text: 'Categorias',
        icon: Icons.settings_rounded,
      ),
    );
  }

  Expanded _buscarProducto(BuildContext context) {
    return Expanded(
      child: CustomIconButton(
        onPressed: () {
          showSearch(context: context, delegate: DataSearch());
        },
        // text: 'Buscar',
        icon: Icons.search_rounded,
      ),
    );
  }
}
