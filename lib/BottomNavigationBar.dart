import 'package:appouse/BuyPage.dart';
import 'package:appouse/FavoritesPage.dart';
import 'package:appouse/HomeBar.dart';
import 'package:appouse/ProfileBar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedScreenIndex = 0;
  final List _screens = [
    {"screen": const HomePage(), "title": "Home A Title"},
    {"screen": const FavoritesPage(), "title": "Favorites B Title"},
    {"screen": const BuyPage(), "title": "Buy A Title"},
    {"screen": const ProfilePage(), "title": "Profile A Title"},
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5F5C64),
      body: _screens[_selectedScreenIndex]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled,color: Colors.black), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border,color: Colors.black), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined,color: Colors.black), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline,color: Colors.black), label: ''),
        ],
      ),
    );
  }
}