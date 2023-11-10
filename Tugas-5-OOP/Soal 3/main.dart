import 'armor_titan.dart';
import 'attack_titan.dart';
import 'beast_titan.dart';
import 'human.dart';

void main() {
  ArmorTitan armorTitan = ArmorTitan();
  AttackTitan attackTitan = AttackTitan();
  BeastTitan beastTitan = BeastTitan();
  Human human = Human();

  armorTitan.powerPoint = 3;
  attackTitan.powerPoint = 30;
  beastTitan.powerPoint = 15;
  human.powerPoint = 75;

  print("Level point armor titan: ${armorTitan.powerPoint}");
  print("Level point attack titan: ${attackTitan.powerPoint}");
  print("Level point beast titan: ${beastTitan.powerPoint}");
  print("Level point human: ${human.powerPoint}");

  print("Sifat dari armor titan: ${armorTitan.terjang()}");
  print("Sifat dari attack titan: ${attackTitan.punch()}");
  print("Sifat dari beast titan: ${beastTitan.lempar()}");
  print("Sifat dari human: ${human.killAlltitan()}");
}
