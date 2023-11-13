// import 'dart:async';

void main(List<String> args) {
  print("Life");
  delayedPrint(3, "never flat").then((value) => print(value));
  print("is");
}

Future delayedPrint(int seconds, String message) {
  final duration = Duration(seconds: seconds);
  return Future.delayed(duration).then((value) => message);
}
