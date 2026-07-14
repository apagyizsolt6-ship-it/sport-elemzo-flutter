class Tipp {
  final String hazaiCsapat;
  final String vendegCsapat;
  final double odds;
  final double tet;

  Tipp({
    required this.hazaiCsapat,
    required this.vendegCsapat,
    required this.odds,
    required this.tet,
  });

  // Ez a "meglepetés" logika: kiszámolja a várható nyereményt
  double get varhatoNyeremeny => tet * odds;
  
  // Kiszámolja a kockázatot: a tét a bankroll hány százaléka
  double kockazatiSzazalek(double osszToke) => (tet / osszToke) * 100;
}
