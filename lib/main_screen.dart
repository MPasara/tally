import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tally_mobile/app/theme/tally_colors.dart';
import 'package:tally_mobile/features/completed/presentation/completed_screen.dart';
import 'package:tally_mobile/features/todos/presentation/todos_screen.dart';
import 'package:tally_mobile/generated/l10n.dart';

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
    final colors = Theme.of(context).extension<TallyColors>()!;
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colors.navBar,
        onTap: (newIndex) {
          _selectedIndex = newIndex;
          HapticFeedback.mediumImpact();
          setState(() {});
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_outlined),
            label: S.of(context).todo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outlined),
            label: S.of(context).done,
          ),
        ],
      ),
    );
  }
}
