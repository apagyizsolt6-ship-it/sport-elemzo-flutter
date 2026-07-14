import 'package:flutter/material.dart';

void main() => runApp(const SportElemzoApp());

class SportElemzoApp extends StatelessWidget {
  const SportElemzoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sport Elemző',
      theme: ThemeData.dark().copyWith(primaryColor: Colors.green),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('⚽ SportFogadás Elemző')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Üdv a Sport Elemzőben!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text('Első verzió - hamarosan több funkció', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.sports_soccer),
      ),
    );
  }
}
