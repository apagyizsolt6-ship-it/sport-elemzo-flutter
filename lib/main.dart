import 'package:flutter/material.dart';

void main() => runApp(const SportFogadasApp());

class SportFogadasApp extends StatelessWidget {
  const SportFogadasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const Fokepernyo(),
    );
  }
}

class Fokepernyo extends StatefulWidget {
  const Fokepernyo({super.key});

  @override
  State<Fokepernyo> createState() => _FokepernyoState();
}

class _FokepernyoState extends State<Fokepernyo> {
  int _index = 0;

  final List<Widget> _oldalak = [
    const Center(child: Text("Aktív tippjeim")), // Ide jön a lista
    const Center(child: Text("Statisztikák")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Foci Fogadás App")),
      body: _oldalak[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list), label: "Tippek"),
          NavigationDestination(icon: Icon(Icons.analytics), label: "Statisztika"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Itt nyitjuk majd meg az űrlapot
        },
      ),
    );
  }
}
