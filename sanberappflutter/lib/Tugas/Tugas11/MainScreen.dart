// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sanberappflutter/Tugas/Tugas11/HomeScreen.dart';
import 'package:sanberappflutter/Tugas/Tugas11/ProfileScreen.dart';
import 'package:sanberappflutter/Tugas/Tugas11/SearchScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {
                showModal(context);
              },
            ),
          )
        ],
        backgroundColor: const Color(0xFF5E73E1),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'SanberApp',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xFF5E73E1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Color(0xFF5E73E1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Color(0xFF5E73E1),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF5E73E1),
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF5E73E1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/img/fachrul.jpg"),
                  ),
                  Spacer(),
                  Text(
                    "Fachrul Rivaldy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "fachrul.rivaldy@gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text("Home"),
              leading: const Icon(Icons.home),
              onTap: () {
                showModal(context);
              },
            ),
            ListTile(
              title: const Text("Profile"),
              leading: const Icon(Icons.person),
              onTap: () {
                showModal(context);
              },
            ),
            ListTile(
                title: const Text("Logout"),
                leading: const Icon(Icons.logout),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                }),
          ],
        ),
      ),
    );
  }
}
