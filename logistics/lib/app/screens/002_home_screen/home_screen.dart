import 'package:flutter/material.dart';
import 'package:logistics/app/widgets/template/main_template.dart';
import 'package:logistics/app/screens/003_add_screen/add_screen.dart';
import 'package:logistics/app/screens/004_message_screen/message_screen.dart';
import 'package:logistics/app/screens/005_my_screen/my_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  /// List of screens for each tab
  static const List<Widget> _screens = <Widget>[
    _HomeContent(),
    AddScreen(),
    MessageScreen(),
    MyScreen(),
  ];

  /// List of titles for the AppBar
  static const List<String> _titles = <String>[
    'NANP PRO',
    'Add New',
    'Messages',
    'My Profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainTemplateAppBar(
      content: _screens[_selectedIndex],
      title: _titles[_selectedIndex],
      isShowAppBar: true,
      useSafeArea: true,
      trailingWidget: const Icon(Icons.more_vert),
      useAppBarBottomBorder: true,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // ensure all items are displayed
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded),
            activeIcon: Icon(Icons.add_circle),
            label: 'New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            activeIcon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'My',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey[600],  
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: true,   // Always show label when selected
        showUnselectedLabels: true, // Always show label when not selected
        onTap: _onItemTapped,
        elevation: 8,
      ),
    );
  }
}

/// Widget content for the Home tab
class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, size: 80, color: Colors.deepPurple),
            const SizedBox(height: 16),
            const Text(
              'Home Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Welcome to NANP PRO',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}