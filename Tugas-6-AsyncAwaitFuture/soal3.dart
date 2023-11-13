import 'dart:async';

void main(List<String> args) async {
  print("Ready, Sing");
  print(await line());
  print(await line2());
  print(await line3());
  print(await line4());
}

Future<String> line() async {
  String lagu = "Pernahkah kau merasa.....";
  return await Future.delayed(Duration(seconds: 5), () => (lagu));
}

Future<String> line2() async {
  String lagu = "Pernahkah kau merasa........";
  return await Future.delayed(Duration(seconds: 3), () => (lagu));
}

Future<String> line3() async {
  String lagu = "Pernahkah kau merasa";
  return await Future.delayed(Duration(seconds: 2), () => (lagu));
}

Future<String> line4() async {
  String lagu = "Hatimu hampa, pernahkah kau merasa hatimu kosong....";
  return await Future.delayed(Duration(seconds: 1), () => (lagu));
}
