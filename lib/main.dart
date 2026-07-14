import 'package:flutter/material.dart';

void main() => runApp(const SportElemzoApp());

class SportElemzoApp extends StatelessWidget {
  const SportElemzoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foci Elemző',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue[700],
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue[300],
        scaffoldBackgroundColor: const Color(0xFF0A0E1A),
        cardColor: const Color(0xFF1E2A44),
      ),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDark = true;

  final List<Map<String, dynamic>> matches = [
    {
      'home': 'Ferencváros',
      'away': 'Újpest',
      'odds1': 1.95,
      'oddsX': 3.40,
      'odds2': 3.60,
      'prob': 55,
    },
    {
      'home': 'Debrecen',
      'away': 'MTK',
      'odds1': 2.30,
      'oddsX': 3.20,
      'odds2': 2.90,
      'prob': 48,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⚽ Foci Elemző'),
        backgroundColor: Colors.blue[800],
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              setState(() => isDark = !isDark);
              // Valós theme váltás később
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: matches.length,
        itemBuilder: (context, index) {
          final m = matches[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('${m['home']} — ${m['away']}', 
                       style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _oddColumn('1', m['odds1']),
                      _oddColumn('X', m['oddsX']),
                      _oddColumn('2', m['odds2']),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('Győzelmi esély: ${m['prob']}%', 
                       style: TextStyle(fontSize: 18, color: Colors.blue[300])),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _oddColumn(String label, double odd) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(odd.toString(), style: const TextStyle(fontSize: 18)),
      ],
    );
  }
}
