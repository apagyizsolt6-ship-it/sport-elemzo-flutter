import 'package:flutter/material.dart';

void main() {
  runApp(const SportElemzoApp());
}

class SportElemzoApp extends StatelessWidget {
  const SportElemzoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sportfogadás Elemző',
      debugShowCheckedModeBanner: false,
      // Világos téma - Sportos kékkel
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.light,
        ),
      ),
      // Sötét téma - Mély sötétkék és világoskék akcentussal
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
          surface: const Color(0xFF121212),
        ),
      ),
      themeMode: ThemeMode.system, // Követi a telefon beállítását
      home: const KezdoKepernyo(),
    );
  }
}

class KezdoKepernyo extends StatelessWidget {
  const KezdoKepernyo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sport Elemző', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sports_soccer, size: 100, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 20),
            const Text(
              'Üdvözöllek a sportelemződben!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Tipp rögzítése'),
            ),
          ],
        ),
      ),
    );
  }
}
