// ignore_for_file: non_constant_identifier_names, avoid_print, unused_local_variable, use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:sanberappflutter/Tugas/Tugas13/Tugas13_1/Pages/Login_Screen/login_screen.dart';
import 'package:sanberappflutter/Tugas/Tugas13/Tugas13_1/Config/dio_http.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late String? name;
  late String? username;
  late String? email;
  late String? password;
  late bool _isLoading = false;

  Future<dynamic> _RegisterSubmit() async {
    var data = {
      "name": name,
      "username": username,
      "email": email,
      "password": password
    };
    try {
      print(data);
      setState(() {
        _isLoading = true;
      });
      var response = await DioHttp.request.post("/api/register", data: data);
      print(response.data);

      setState(() {
        _isLoading = false;
      });

      final snackBar = SnackBar(
        content: Text(response.data["message"]),
        backgroundColor: Colors.green,
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    } on DioException catch (e) {
      var message = "";
      switch (e.response!.statusCode) {
        case 422:
          Map<String, dynamic> _errorData = e.response!.data["errors"];
          var getListMessage = _errorData.values;
          var result = getListMessage.map((item) =>
              item.toString().substring(1, item.toString().length - 2));
          setState(() {
            _isLoading = false;
          });
          message = result.join("\n");
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
          break;
      }
      final snackBar = SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
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
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                    child: Image.asset("assets/img/logo.png"),
                  ),
                  const Text(
                    "CariKerja",
                    style: TextStyle(
                        fontSize: 16,
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
                        validator: (String? nameValue) {
                          if (nameValue!.isEmpty) {
                            return "Enter Name Text";
                          }
                          name = nameValue;
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.black),
                        ),
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
                        validator: (String? userNameValue) {
                          if (userNameValue!.isEmpty) {
                            return "Enter Username Text";
                          }
                          username = userNameValue;
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Username",
                          hintStyle: TextStyle(color: Colors.black),
                        ),
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
                        validator: (String? emailValue) {
                          if (emailValue!.isEmpty) {
                            return "Enter Email Text";
                          }
                          email = emailValue;
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.black),
                        ),
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
                      const Text("Sudah punya akun?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                        },
                        child: const Text("Masuk"),
                      )
                    ],
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _RegisterSubmit();
                          }
                        },
                        child: const Text(
                          "Daftar",
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
