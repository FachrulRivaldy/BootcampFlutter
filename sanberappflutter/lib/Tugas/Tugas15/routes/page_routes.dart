// ignore_for_file: camel_case_types

import 'package:sanberappflutter/Tugas/Tugas15/pages/page_1.dart';
import 'package:sanberappflutter/Tugas/Tugas15/pages/page_2.dart';
import 'package:sanberappflutter/Tugas/Tugas15/pages/page_3.dart';
import 'package:get/get.dart';
import 'route_name.dart';

class pageRouteApp {
  static final pages = [
    GetPage(
      name: RouteName.page_1,
      page: () => const PageOne(),
    ),
    GetPage(
      name: RouteName.page_2,
      page: () => const PageTwo(),
    ),
    GetPage(
      name: RouteName.page_3,
      page: () => const PageThree(),
    ),
  ];
}
