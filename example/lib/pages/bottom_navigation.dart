import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 64, color: Colors.blue),
          SizedBox(height: 16),
          Text('Home Page', style: TextStyle(fontSize: 24)),
          Text('This is the home page content'),
        ],
      ),
    ),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 64, color: Colors.green),
          SizedBox(height: 16),
          Text('Search Page', style: TextStyle(fontSize: 24)),
          Text('This is the search page content'),
        ],
      ),
    ),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite, size: 64, color: Colors.red),
          SizedBox(height: 16),
          Text('Favorites Page', style: TextStyle(fontSize: 24)),
          Text('This is the favorites page content'),
        ],
      ),
    ),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 64, color: Colors.purple),
          SizedBox(height: 16),
          Text('Profile Page', style: TextStyle(fontSize: 24)),
          Text('This is the profile page content'),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AsScaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: AsBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          AsBottomNavigationBarItem(
            icon: Icons.dashboard,
            label: 'Dashboard',
          ),
          AsBottomNavigationBarItem(
            icon: Icons.analytics,
            label: 'Analytics',
          ),
          AsBottomNavigationBarItem(
            icon: Icons.notifications,
            label: 'Notifications',
          ),
          AsBottomNavigationBarItem(
            icon: Icons.settings,
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
