// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    decoration: const BoxDecoration(
                        color: Color(0xFF5E73E1),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(150),
                            bottomRight: Radius.circular(150))),
                  ),
                  const Positioned(
                    top: 80,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 103,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage('assets/img/fachrul.jpg'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const Text(
                      "Fachrul Rivaldy",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text("Surabaya, Indonesia")
                      ],
                    ),
                    const Text(
                      "500+ Connections",
                      style: TextStyle(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ContainerProfile(
                      title: "Skills",
                      imagePaths: listSkills,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ContainerProfile(
                      title: "Social Media Accounts",
                      imagePaths: listSocMed,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class ContainerProfile extends StatelessWidget {
  final String title;
  final List<String> imagePaths;
  const ContainerProfile(
      {Key? key, required this.title, required this.imagePaths})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 2,
                spreadRadius: 3,
                offset: const Offset(3, 5)),
          ],
          color: const Color(0xFFF6F6F6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Wrap(
            spacing: 24,
            children: List.generate(
              imagePaths.length,
              (index) => Image.asset(
                imagePaths[index],
                width: 50,
                height: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> listSkills = [
  "assets/img/dart.png",
  "assets/img/javascript.png",
  "assets/img/cpp.png",
  "assets/img/kotlin.png"
];
List<String> listSocMed = [
  "assets/img/facebook.png",
  "assets/img/instagram.png",
  "assets/img/linkedin.png"
];
