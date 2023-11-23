// ignore_for_file: avoid_print

import 'dart:async';

import 'package:sanberappflutter/Tugas/Tugas14/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Services {
  Future<List<PostModel>?> getallposts() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"))
          .timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException("Connection Time Out");
        },
      );

      if (response.statusCode == 200) {
        List jsonresponse = convert.jsonDecode(response.body);
        return jsonresponse.map((e) => PostModel.fromJson(e)).toList();
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print("Response Time Out");
    }
    return null;
  }
}
