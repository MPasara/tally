import 'package:flutter/material.dart';
import 'package:tally_mobile/features/completed/presentation/completed_screen.dart';
import 'package:tally_mobile/features/todos/presentation/todos_screen.dart';

class MainScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _screens = [TodosScreen(), CompletedScreen()];
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          _selectedIndex = value;
          setState(() {});
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_outlined),
            label: 'Todo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outlined),
            label: 'Done',
          ),
        ],
      ),
    );
  }
}
