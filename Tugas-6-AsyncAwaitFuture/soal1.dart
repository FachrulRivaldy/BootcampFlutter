// ignore_for_file: unused_local_variable

import 'dart:async';

void main(List<String> args) {
  var h = Human();

  print("Luffy");
  print("Zoro");
  print("Killer");
  var timer = Timer(Duration(seconds: 3), () => h.getData());
  print(h.name);
}

class Human {
  String name = "Nama Character One Piece";

  void getData() {
    name = "Hilmy";
    print("get Data [Done]");
    print("name 3 : ${name}");
  }
}
