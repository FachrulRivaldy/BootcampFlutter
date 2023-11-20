// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(48.0),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        "assets/img/logo.png",
                        width: 200,
                        height: 200,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Login",
                        style: titleText(),
                      ),
                      const PrimaryForm(
                        hintText: "Username",
                        prefixIcon: Icons.person,
                      ),
                      const PrimaryForm(
                        isObscure: true,
                        hintText: "Password",
                        prefixIcon: Icons.lock,
                        suffixIcon: Icons.visibility_off,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                              child: Text(
                                "Forgot Password?",
                                style: linkText(),
                              ),
                              onTap: () {})),
                      PrimaryButton(
                        text: "Login",
                        onPressed: () {
                          Navigator.pushNamed(context, '/main');
                        },
                      ),
                      const Text("Or Login With"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            child: Image.asset(
                              "assets/img/facebook.png",
                              width: 60,
                              height: 60,
                            ),
                          ),
                          GestureDetector(
                            child: Image.asset(
                              "assets/img/instagram.png",
                              width: 60,
                              height: 60,
                            ),
                          ),
                          GestureDetector(
                            child: Image.asset(
                              "assets/img/linkedin.png",
                              width: 60,
                              height: 60,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          InkWell(
                              child: Text(
                                "Register Here",
                                style: linkText(),
                              ),
                              onTap: () {}),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PrimaryForm extends StatelessWidget {
  final String? hintText;
  final IconData? suffixIcon;
  final bool isObscure;
  final double width;
  final IconData? prefixIcon;
  const PrimaryForm(
      {Key? key,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.isObscure = false,
      this.width = 300})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
          obscureText: isObscure,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: Icon(suffixIcon),
            prefixIcon: Icon(prefixIcon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          )),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xFF5E73E1)),
          minimumSize: MaterialStateProperty.all(const Size(250, 55)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))),
      onPressed: onPressed,
      child:
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 24)),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final Widget image;
  final VoidCallback onPressed;
  const SecondaryButton(
      {Key? key, required this.image, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent)),
        onPressed: onPressed,
        child: image,
      ),
    );
  }
}

TextStyle linkText() {
  return const TextStyle(color: Color(0xFF5E73E1));
}

TextStyle titleText() {
  return const TextStyle(fontSize: 36, fontWeight: FontWeight.w500);
}
