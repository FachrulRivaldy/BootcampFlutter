import 'linkaran.dart';

void main(List<String> args) {
  Lingkaran lingkaran;
  double luasLingkaran;

  lingkaran = new Lingkaran();
  lingkaran.setRadius(-10);

  luasLingkaran = lingkaran.hitungLuas();
  print("Luas Lingkaran: $luasLingkaran");
}
