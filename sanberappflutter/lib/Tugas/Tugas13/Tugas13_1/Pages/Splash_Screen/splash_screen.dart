import 'package:flutter/material.dart';
import 'package:sanberappflutter/Tugas/Tugas13/Tugas13_1/Pages/Login_Screen/login_screen.dart';
import 'package:sanberappflutter/Tugas/Tugas13/Tugas13_1/Pages/Main_App/main_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    autoLogin();
    super.initState();
  }

  Future<void> autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString("user-token");
    if (userToken != null) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MainApp()));
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/logo.png",
              scale: 4,
            ),
            const SizedBox(
              height: 15,
            ),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
