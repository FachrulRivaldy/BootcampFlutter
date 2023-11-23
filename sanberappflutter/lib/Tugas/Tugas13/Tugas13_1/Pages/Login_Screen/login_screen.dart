// ignore_for_file: use_build_context_synchronously, avoid_print, unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:sanberappflutter/Tugas/Tugas13/Tugas13_1/Config/dio_http.dart';
import 'package:sanberappflutter/Tugas/Tugas13/Tugas13_1/Pages/Main_App/main_app.dart';
import 'package:sanberappflutter/Tugas/Tugas13/Tugas13_1/Pages/Register_Screen/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  var _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late String? email;
  late String? password;
  late bool _isLoading = false;

  Future<dynamic> _login() async {
    var data = {"email": email, "password": password};
    try {
      setState(() {
        _isLoading = true;
      });
      var response = await DioHttp.request.post("/api/login", data: data);
      print(response.data);

      setState(() {
        _isLoading = false;
      });

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("user-token", response.data["token"]);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MainApp()));
    } on DioException catch (e) {
      var message = "";
      switch (e.response!.statusCode) {
        case 400:
          setState(() {
            _isLoading = false;
          });
          print(e.response!.data["message"].toString());
          message = e.response!.data["message"].toString();
          break;
        case 404:
          setState(() {
            _isLoading = false;
          });
          message = "Server Not Found";
          break;
        default:
          setState(() {
            _isLoading = false;
          });
          message = "Server Error";
      }

      final snackBar = SnackBar(
        content: const Text("Invalid Email or Password"),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: LoadingOverlay(
          isLoading: _isLoading,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    "assets/img/logo.png",
                    scale: 6,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "CariKerja",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF475BD7)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        validator: (String? emailValue) {
                          if (emailValue!.isEmpty) {
                            return "Enter Email Text";
                          }
                          email = emailValue;
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: "Masukkan Email Anda",
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        obscureText: !_passwordVisible,
                        validator: (String? passwordValue) {
                          if (passwordValue!.isEmpty) {
                            return "Enter Password Text";
                          }
                          password = passwordValue;
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Masukkan Password Anda",
                            hintStyle: const TextStyle(color: Colors.black),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                })),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text("Belum punya akun?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ));
                        },
                        child: const Text("Daftar"),
                      )
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _login();
                          }
                        },
                        child: const Text(
                          "Masuk",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
