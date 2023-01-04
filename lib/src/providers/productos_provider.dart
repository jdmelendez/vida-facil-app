import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vida_facil/src/models/producto_model.dart';

class ProductosProvider extends ChangeNotifier {
  final firestore = FirebaseFirestore.instance;

  Producto _producto = new Producto();
  Producto _productoSeleccionado = new Producto();
  List<Producto> _listaProductos = [];
  List<Producto> _listadoCompra = [];
  List<String> _categoriasProducto = [];

  // ##########################################################################
  //                                 SET, GET, FUNCIONES
  // ##########################################################################

  Producto get ProductoSeleccionada {
    return this._productoSeleccionado;
  }

  set ProductoSeleccionada(Producto value) {
    this._productoSeleccionado = value;
    notifyListeners();
  }

  List<Producto> get ListadoCompra {
    return this._listadoCompra;
  }

  void clearListaCompra() {
    this._listadoCompra.clear();
    notifyListeners();
  }

  // ##########################################################################
  //                                 LECTRA DE DATOS
  // ##########################################################################

  /// ######################### PRODUCTOS ###################################
  Future<List<Producto>> obtenerProductos() async {
    _listaProductos = [];

    var documents = await firestore
        .collection('Productos')
        // .where('idCliente', isEqualTo: uid)
        .get();

    documents.docs.forEach((doc) {
      Producto _producto = Producto.fromJson(doc.data());
      _listaProductos.add(_producto);
    });

    // notifyListeners();
    return _listaProductos;
  }

  // ######################### LISTA COMPRA ###################################
  Future<List<Producto>> obtenerProductosListaCompra() async {
    _listadoCompra = [];
    var documents = await firestore
        .collection('Productos')
        .where('enListaCompra', isEqualTo: true)
        .get();

    documents.docs.forEach((doc) {
      Producto _producto = Producto.fromJson(doc.data());
      _listadoCompra.add(_producto);
    });

    // notifyListeners();
    return _listadoCompra;
  }

  // ######################### CATEGORIAS ###################################
  Future<List<String>> obtenerCategoriasProductos() async {
    _listadoCompra = [];
    var documents = await firestore.collection('CategoriasProducto').get();

    documents.docs.forEach((doc) {
      String _categoria = (doc.data().values.toString());
      _categoriasProducto.add(_categoria);
    });

    // notifyListeners();
    return _categoriasProducto;
  }

  // ##########################################################################
  //                                ESCRITURA DE DATOS
  // ##########################################################################

  /// ######################### PRODUCTOS ###################################
  Future creaProducto(Producto producto) async {
    await firestore
        .collection("/Productos")
        .add(producto.toJson())
        .then((result) {
      result.update({"ID": result.id});
      // _producto.id = result.id;
      print(" +1 producto añadido " + result.id);
    }).catchError((e) {
      print(e);
    });

    notifyListeners();
  }

  Future actualizaProducto(Producto producto) async {
    await firestore
        .collection("/Productos")
        .doc(producto.id)
        .update(producto.toJson())
        .then((result) {
      print(" +1 producto actualizado ");
    }).catchError((e) {
      print(e);
    });

    notifyListeners();
  }

  Future eliminaProducto(Producto producto) async {
    await firestore
        .collection("/Productos")
        .doc(producto.id)
        .delete()
        .then((result) {
      print(" +1 producto eliminado ");
    }).catchError((e) {
      print(e);
    });

    notifyListeners();
  }

  // ######################### LISTA COMPRA ###################################

  Future addProductoListaCompra(Producto producto) async {
    producto.enListaCompra = true;
    await firestore
        .collection("/Productos")
        .doc(producto.id)
        .update(producto.toJson())
        .then((result) {
      print(" +1 producto añadido a la lista de la compra ");
    }).catchError((e) {
      print(e);
    });

    notifyListeners();
  }

  Future estadoCompraProductoListaCompra(Producto producto) async {
    await firestore
        .collection("/Productos")
        .doc(producto.id)
        .update(producto.toJson())
        .then((result) {
      print(" +1 producto comprado ");
    }).catchError((e) {
      print(e);
    });

    // notifyListeners();
  }

  Future eliminaProductoListaCompra(Producto producto) async {
    producto.enListaCompra = false;

    await firestore
        .collection("/Productos")
        .doc(producto.id)
        .update(producto.toJson())
        .then((result) {
      print(" +1 producto eliminado de la lista de la compra ");
    }).catchError((e) {
      print(e);
    });

    notifyListeners();
  }

  // Future vaciaProductoListaCompra(Producto producto) async {
  //   producto.enListaCompra = false;

  //   await firestore
  //       .collection("/Productos").where('enListaCompra', isEqualTo: true).
  //       .update(producto.toJson())
  //       .then((result) {
  //     print(" +1 producto eliminado de la lista de la compra ");
  //   }).catchError((e) {
  //     print(e);
  //   });

  //   notifyListeners();
  // }

  // ######################### CATEGORIAS ###################################
  Future creaCategoria(Producto producto) async {
    await firestore
        .collection("/Productos")
        .add(producto.toJson())
        .then((result) {
      result.update({"ID": result.id});
      // _producto.id = result.id;
      print(" +1 producto añadido " + result.id);
    }).catchError((e) {
      print(e);
    });

    notifyListeners();
  }

  Future actualizaCategoria(Producto producto) async {
    await firestore
        .collection("/Productos")
        .doc(producto.id)
        .update(producto.toJson())
        .then((result) {
      print(" +1 producto actualizado ");
    }).catchError((e) {
      print(e);
    });

    notifyListeners();
  }

  Future eliminaCategoria(Producto producto) async {
    await firestore
        .collection("/Productos")
        .doc(producto.id)
        .delete()
        .then((result) {
      print(" +1 producto eliminado ");
    }).catchError((e) {
      print(e);
    });

    notifyListeners();
  }
}
