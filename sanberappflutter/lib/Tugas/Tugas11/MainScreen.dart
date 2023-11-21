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
            children: <Widget>[
              const UserAccountsDrawerHeader(
                accountEmail: Text("fachrul.rivaldy@gmail.com"),
                accountName: Text("Fachrul Rivaldy"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/img/fachrul.jpg"),
                ),
              ),
              DrawerListTile(
                iconData: Icons.assignment,
                title: "Applied Jobs",
                onTilePressed: () {
                  showModal(context);
                },
              ),
              DrawerListTile(
                iconData: Icons.bookmark_border,
                title: "Saved Jobs",
                onTilePressed: () {
                  showModal(context);
                },
              ),
              const Divider(),
              DrawerListTile(
                iconData: Icons.settings,
                title: "Settings",
                onTilePressed: () {
                  showModal(context);
                },
              ),
              DrawerListTile(
                iconData: Icons.logout,
                title: "Logout",
                onTilePressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
        ));
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final VoidCallback? onTilePressed;

  const DrawerListTile(
      {Key? key, this.iconData, this.title, this.onTilePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title!,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
