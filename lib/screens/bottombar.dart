import 'package:flutter/material.dart';
import 'package:ghumakad/screens/blogScreen.dart';
import 'package:ghumakad/screens/homeScreen.dart';
import 'package:ghumakad/screens/mapScreen.dart';

class BottomBar extends StatefulWidget {
  int passedIndex;
  BottomBar({
    super.key,
    this.passedIndex = 0,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    int selectedIndex = widget.passedIndex;
  }

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static final List<Widget> _screens = <Widget>[
    const HomePage(),
    const BlogPage(),
    const MapPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              color: Colors.black,
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              color: Colors.black,
            ),
            label: 'Blog',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        onTap: onTapped,
      ),
    );
  }
}
