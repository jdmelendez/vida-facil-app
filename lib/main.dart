import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vida_facil/src/pages/categoriasProductos_page.dart';
import 'package:vida_facil/src/pages/productosInput_page..dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:vida_facil/src/providers/productos_provider.dart';
import 'package:vida_facil/src/widgets/buttons/custom_icon_button.dart';

import 'src/pages/calendarioPlan_page.dart';
import 'src/pages/calendario_page.dart';
import 'src/pages/listaCompra_page.dart';
import 'src/pages/productos_page.dart';
import 'src/pages/recetasInput_page.dart';
import 'src/pages/recetas_page.dart';
import 'src/pages/recetasShow_page..dart';

void main() async {
  initializeDateFormatting().then((_) => runApp(AppState()));
}

class AppState extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductosProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        'cesta': (BuildContext context) => ListaCompraPage(),
        'recetas': (BuildContext context) => RecetasPage(),
        'recetasInput': (BuildContext context) => RecetasInputPage(),
        'recetasShow': (BuildContext context) => RecetasShowPage(),
        'calendario': (BuildContext context) => CalendarioPage(),
        'calendarioPlan': (BuildContext context) => CalendarioPlanPage(),
        'productos': (BuildContext context) => ProductosPage(),
        'categoriasProductos': (BuildContext context) =>
            CategoriasProductosPage(),
        'productosInput': (BuildContext context) => ProductosInputPage(),
      },
      theme: ThemeData(
        hoverColor: Colors.orange,
        accentColor: Colors.orange,
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: "Vida Fácil"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          widget.title,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.pop(context, false),
        // onPressed:() => exit(0),)
        // ),
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(1), blurRadius: 5)
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Menú de hoy!',
                      style: TextStyle(
                          fontSize: size.width / 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              )),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(15),
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              crossAxisCount: 2,
              children: [
                btnMenuPpal(
                    "Calendario", Icons.calendar_today_rounded, 'calendario'),
                btnMenuPpal("Recetas", Icons.dining_rounded, 'recetas'),
                btnMenuPpal("Cesta", Icons.shopping_cart_rounded, 'cesta'),
                btnMenuPpal(
                    "Productos", Icons.app_registration_rounded, 'productos'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget btnMenuPpal(String texto, IconData icono, String route) {
    final size = MediaQuery.of(context).size;

    return OutlinedButton(
      style: ButtonStyle(

          // side: MaterialStateProperty.all(
          //     BorderSide(width: 2, color: Colors.green)),
          elevation: MaterialStateProperty.all<double>(20),
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(30)),
          // shape: MaterialStateProperty.all(StadiumBorder()),
          backgroundColor: MaterialStateProperty.all(
            Colors.white,
          )),

      // overlayColor: MaterialStateProperty.(Colors.orange)),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearGradientMask(
              child: Icon(
                icono,
                size: size.width / 4,
                color: Colors.white,
              ),
            ),
            // GradientIcon(icono, color: Colors.black, size: size.width / 4
            //     // size: 100,
            //     ),
            SizedBox(
              height: 20,
            ),
            Text(
              texto,
              style: TextStyle(
                  fontSize: size.width / 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
