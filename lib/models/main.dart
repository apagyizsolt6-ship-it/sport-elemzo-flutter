import 'package:flutter/material.dart';
import 'models/tip_model.dart';

void main() => runApp(const SportFogadasApp());

class SportFogadasApp extends StatelessWidget {
  const SportFogadasApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blueAccent),
    home: const Fokepernyo(),
  );
}

class Fokepernyo extends StatefulWidget {
  const Fokepernyo({super.key});
  @override
  State<Fokepernyo> createState() => _FokepernyoState();
}

class _FokepernyoState extends State<Fokepernyo> {
  List<Tipp> tippek = [];
  final double bankroll = 100000; // Alap bankroll

  void _ujTipp(Tipp t) => setState(() => tippek.add(t));

  void _urlap() {
    final hC = TextEditingController(); final vC = TextEditingController();
    final oddsC = TextEditingController(); final tetC = TextEditingController();

    showDialog(context: context, builder: (ctx) => AlertDialog(
      title: const Text("Új Elemzett Tipp"),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        TextField(controller: hC, decoration: const InputDecoration(labelText: "Hazai")),
        TextField(controller: vC, decoration: const InputDecoration(labelText: "Vendég")),
        TextField(controller: oddsC, decoration: const InputDecoration(labelText: "Odds")),
        TextField(controller: tetC, decoration: const InputDecoration(labelText: "Tét (Ft)")),
      ]),
      actions: [ElevatedButton(onPressed: () {
        _ujTipp(Tipp(hazaiCsapat: hC.text, vendegCsapat: vC.text, odds: double.parse(oddsC.text), tet: double.parse(tetC.text)));
        Navigator.pop(ctx);
      }, child: const Text("Elemzés"))],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Risk Manager")),
      body: ListView.builder(itemCount: tippek.length, itemBuilder: (ctx, i) {
        final t = tippek[i];
        final kockazat = t.kockazatiSzazalek(bankroll);
        return Card(
          color: kockazat > 5 ? Colors.red.shade50 : Colors.green.shade50,
          child: ListTile(
            title: Text("${t.hazaiCsapat} vs ${t.vendegCsapat}"),
            subtitle: Text("Odds: ${t.odds} | Tét: ${t.tet} Ft"),
            trailing: Text("${t.varhatoNyeremeny.toInt()} Ft\nnyeremény", textAlign: TextAlign.right),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: _urlap, child: const Icon(Icons.analytics)),
    );
  }
}
