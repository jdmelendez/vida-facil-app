import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vida_facil/src/models/producto_model.dart';
import 'package:vida_facil/src/providers/productos_provider.dart';
import 'package:vida_facil/src/search/search_productos.dart';
import 'package:vida_facil/src/widgets/buttons/custom_icon_button.dart';
import 'package:vida_facil/src/widgets/cards/producto_card..dart';

class CategoriasProductosPage extends StatefulWidget {
  @override
  _CategoriasProductosPageState createState() =>
      _CategoriasProductosPageState();
}

class _CategoriasProductosPageState extends State<CategoriasProductosPage> {
  @override
  Widget build(BuildContext context) {
    final _productos = Provider.of<ProductosProvider>(context, listen: true);

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
            'Categorias de Productos',
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

                  // Listado de productos
                  _listadoProductos(_productos)
                ]))));
  }

  Flexible _listadoProductos(ProductosProvider _productosProvider) {
    return Flexible(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 10.0),
            child: ListView(physics: ClampingScrollPhysics(), children: [
              // Text('Comercios', style: CustomLabels.h1),
              SizedBox(
                height: 10,
              ),
              Container(
                  // TODO: FUTUREBUILDER
                  child: FutureBuilder(
                      future: _productosProvider.obtenerProductosListaCompra(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Producto>> snapshot) {
                        if (snapshot.hasData) {
                          List<Producto>? _listaCompra = snapshot.data;

                          return Container(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: _listaCompra!.length,
                                  itemBuilder: (context, index) {
                                    return Dismissible(
                                        direction: DismissDirection.startToEnd,
                                        background: Container(
                                            padding: EdgeInsets.all(12.0),
                                            alignment: Alignment.centerLeft,
                                            color: Colors.red[900],
                                            child: Text('Eliminar',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        onDismissed: (direccion) {
                                          _productosProvider
                                              .eliminaProductoListaCompra(
                                                  _listaCompra[index]);
                                        },
                                        key: UniqueKey(),
                                        child: ProductoListaCompraCard(
                                            producto: _listaCompra[index]));
                                  }));
                        } else {
                          return Container(
                              height: 400.0,
                              child:
                                  Center(child: CircularProgressIndicator()));
                        }
                      }))
            ])));
  }

  Expanded _nuevoProducto(BuildContext context) {
    return Expanded(
      child: CustomIconButton(
        onPressed: () {
          Navigator.pushNamed(context, 'productosInput');
        },
        text: 'Nuevo',
        icon: Icons.add,
      ),
    );
  }

  Expanded _categorias(BuildContext context) {
    return Expanded(
      child: CustomIconButton(
        onPressed: () {
          Navigator.pushNamed(context, 'productosInput');
        },
        text: 'Categorias',
        icon: Icons.category_rounded,
      ),
    );
  }

  Expanded _buscarProducto(BuildContext context) {
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
