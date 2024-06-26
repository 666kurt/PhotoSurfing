import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:photo_surfing/screens/photo_feed_screen.dart';
import 'package:photo_surfing/screens/screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      if (_selectedIndex == index) {
        return;
      } else {
        _selectedIndex = index;
      }
    });
  }

  static List<Widget> _screenOptions = [
    PhotoFeedScreen(),
    Center(child: Text('add')),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenOptions.elementAt(_selectedIndex),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16),
        child: GNav(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          gap: 8,
          tabBackgroundColor: Color.fromRGBO(0, 98, 255, 0.5),
          hoverColor: Color.fromRGBO(0, 98, 255, 0.5),
          activeColor: Colors.white,
          duration: Duration(milliseconds: 200),
          color: Color.fromRGBO(7, 7, 12, 1),
          tabs: [
            GButton(icon: Icons.photo_library, text: 'Photo Feed'),
            GButton(icon: Icons.add_box, text: 'Add'),
            GButton(icon: Icons.account_circle, text: 'Account'),
          ],
          onTabChange: _onItemTapped,
          selectedIndex: _selectedIndex,
        ),
      ),
    );
  }
}
