void main() {
  Segitiga segitiga;

  segitiga = new Segitiga();
  segitiga.alas = 10;
  segitiga.tinggi = 20;

  var luas = segitiga.hitungLuas();
  print("Luas Segitiga: $luas");
}

class Segitiga {
  late double alas;
  late double tinggi;

  double hitungLuas() {
    return 0.5 * alas * tinggi;
  }
}
