// ignore_for_file: avoid_print, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:sanberappflutter/Tugas/Tugas13/Tugas13_1/Config/dio_http.dart';
import 'package:sanberappflutter/Tugas/Tugas13/Tugas13_1/Pages/Login_Screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var temp = "";
  @override
  void initState() {
    super.initState();
  }

  Future<dynamic> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString("user-token");
    setState(() {
      temp == userToken;
    });
    try {
      print(":Logout");
      var response = await DioHttp.request.post("/api/logout",
          options: Options(headers: {"authorization": "Bearer $userToken"}));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    } catch (e) {
      print("Gagal");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const Text(
            "Selamat Datang, Fachrul",
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xFF475BD7),
                borderRadius: BorderRadius.circular(5)),
            child: TextButton(
              onPressed: () {
                _logout();
              },
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
