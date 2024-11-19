import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dashboard inventario",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 32, 33, 33)),
          useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDarkMode = false;

  ThemeData _buildTheme(bool isDark) {
    return ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 254, 228, 81),
            brightness: isDark ? Brightness.dark : Brightness.light),
        cardTheme: CardTheme(
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dashboard inventario",
      theme: _buildTheme(isDarkMode),
      home: DashboardScreem(
          toggleTheme: () {
            setState(() {
              isDarkMode = !isDarkMode;
            });
          },
          isDarkMode: isDarkMode),
    );
  }
}

class DashboardScreem extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const DashboardScreem(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard inventario"),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: toggleTheme,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(children: [
          if (screenWidth >= 600)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _cardPrincipal(context, 'Productos en stock', '2,245',
                    Icons.emoji_objects_outlined, colorScheme.primary),
                _cardPrincipal(context, 'Órdenes pendientes', '32',
                    Icons.local_shipping, colorScheme.secondary),
                _cardPrincipal(context, 'Inventario total', '352,234',
                    Icons.store, colorScheme.tertiary),
                _cardPrincipal(context, 'Productos agotados', '02',
                    Icons.warning, colorScheme.error),
              ],
            )
          else
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _cardPrincipal(context, 'Productos en stock', '1,234',
                        Icons.emoji_objects_outlined, colorScheme.primary),
                    _cardPrincipal(context, 'Órdenes pendientes', '12',
                        Icons.shopping_cart, colorScheme.secondary),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _cardPrincipal(context, 'Inventario total', '352,234',
                        Icons.store, colorScheme.tertiary),
                    _cardPrincipal(context, 'Productos agotados', '02',
                        Icons.trending_down, colorScheme.error),
                  ],
                ),
              ],
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            child: Container(
              height: 2,
              color: Colors.grey,
            ),
          ),
          Text('Informe total de ventas',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          _cardVentas(context),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            child: Container(
              height: 2,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Table(
              border: TableBorder.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2.0,
                borderRadius: BorderRadius.circular(16.0),
              ),
              children: [
                TableRow(
                  children: [
                    _encabezadoTabla(context, 'Productos'),
                    _encabezadoTabla(context, 'Stock'),
                    _encabezadoTabla(context, 'Vendidos'),
                  ],
                ),
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Jersey Local', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('620', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('2,480', textAlign: TextAlign.center),
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          Text('Jersey Visitante', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('322', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('1,865', textAlign: TextAlign.center),
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          Text('Jersey All Star', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('458', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('2,084', textAlign: TextAlign.center),
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Calcetines', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('214', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('895', textAlign: TextAlign.center),
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Bermudas', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('356', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('879', textAlign: TextAlign.center),
                    ),
                  ],
                ),
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Balón', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('275', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('1,115', textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

Widget _cardVentas(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: screenWidth * 0.45,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _filaVentas('Ventas diarias', '\$3,100'),
                _filaVentas('Ventas Mensual', '\$62,152'),
                _filaVentas('trimestral', '\$186,000'),
                _filaVentas('Ventas totales', '\$744,000')
              ],
            ),
          ),
        ),
      ),
      Container(
        width: screenWidth * 0.45,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                _filaVentas('Más vendida', 'Jersey local'),
                _filaVentas('Venta 2023', '\$730,271'),
                _filaVentas('Venta 2024', '\$744,000'),
                _filaVentas('Proyección', '\$790,000')
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _filaVentas(String label, String value) {
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ));
}

Widget _cardPrincipal(BuildContext context, String title, String value,
    IconData icon, Color color) {
  return Container(
    width: 185,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(icon, color: color, size: 34),
                Text(
                  value,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold, color: color),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _encabezadoTabla(BuildContext context, String text) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .titleSmall
          ?.copyWith(fontWeight: FontWeight.bold),
    ),
  );
}
