import 'package:flutter/material.dart';
import 'package:kortoba_flutter_task/generated/l10n.dart';
import 'package:kortoba_flutter_task/src/presentation/screens/main/favorites/favorites_screen.dart';
import 'package:kortoba_flutter_task/src/presentation/screens/main/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String routeName = '/main-screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final screens = [
    const HomeScreen(),
    const FavoritesScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        onTap: (index) => setState(() => _currentIndex = index),
        items:  [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: S().home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: S().favorites,
          )
        ],
      ),
    );
  }
}
