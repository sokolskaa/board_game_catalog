import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'catalog.dart';
import 'sessions.dart';
import 'players.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
  bool _autoOpenLogModal = false;

  void _onNavigateToTab(int index, {bool openLogModal = false}) {
    setState(() {
      _selectedIndex = index;
      _autoOpenLogModal = openLogModal;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(onNavigateToTab: _onNavigateToTab),
      const CatalogScreen(),
      SessionsScreen(autoOpenLogModal: _autoOpenLogModal),
      const PlayersScreen(),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _autoOpenLogModal = false;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1565C0),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            activeIcon: Icon(Icons.grid_view),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Sessions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            activeIcon: Icon(Icons.people),
            label: 'Players',
          ),
        ],
      ),
    );
  }
}