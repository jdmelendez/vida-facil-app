// To parse this JSON data, do
//
//     final listaCompra = listaCompraFromJson(jsonString);

import 'dart:convert';

ListaCompra listaCompraFromJson(String str) =>
    ListaCompra.fromJson(json.decode(str));

String listaCompraToJson(ListaCompra data) => json.encode(data.toJson());

class ListaCompra {
  ListaCompra({
    this.producto,
  });

  List<Producto>? producto;

  factory ListaCompra.fromJson(Map<String, dynamic> json) => ListaCompra(
        producto: json["producto"] == null
            ? null
            : List<Producto>.from(
                json["producto"].map((x) => Producto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "producto": producto == null
            ? null
            : List<dynamic>.from(producto!.map((x) => x.toJson())),
      };
}

class Producto {
  Producto({
    this.id,
    this.nombre,
    this.categoria,
    this.precio,
    this.enListaCompra = false,
    this.comprado,
    this.supermercado,
    this.cantidad,
    this.unidadMedida,
    this.imagen,
  });

  String? id;
  String? nombre;
  String? categoria;
  String? precio;
  bool? enListaCompra;
  bool? comprado;
  String? supermercado;
  String? cantidad;
  String? unidadMedida;
  String? imagen;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["ID"] == null ? null : json["ID"],
        nombre: json["Nombre"] == null ? null : json["Nombre"],
        categoria: json["Categoria"] == null ? null : json["Categoria"],
        precio: json["Precio"] == null ? null : json["Precio"],
        enListaCompra:
            json["enListaCompra"] == null ? null : json["enListaCompra"],
        supermercado:
            json["Supermercado"] == null ? null : json["Supermercado"],
        cantidad: json["Cantidad"] == null ? null : json["Cantidad"],
        unidadMedida:
            json["UnidadMedida"] == null ? null : json["UnidadMedida"],
        imagen: json["Imagen"] == null ? null : json["Imagen"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id == null ? null : id,
        "Nombre": nombre == null ? null : nombre,
        "Categoria": categoria == null ? null : categoria,
        "Precio": precio == null ? null : precio,
        "enListaCompra": enListaCompra == null ? null : enListaCompra,
        "Comprado": comprado == null ? null : comprado,
        "Supermercado": supermercado == null ? null : supermercado,
        "Cantidad": cantidad == null ? null : cantidad,
        "UnidadMedida": supermercado == null ? null : unidadMedida,
        "Imagen": imagen == null ? null : imagen,
      };
}
