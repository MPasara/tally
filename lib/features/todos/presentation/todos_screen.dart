import 'package:flutter/material.dart';
import 'package:tally_mobile/app/theme/tally_colors.dart';
import 'package:tally_mobile/features/todos/presentation/widgets/tally_drawer.dart';

class TodosScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TallyColors>()!;

    return Scaffold(
      endDrawer: TallyDrawer(),
      appBar: AppBar(
        backgroundColor: colors.bg,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          border: Border.all(color: colors.accent, style: BorderStyle.solid),
        ),
        child: FloatingActionButton(
          backgroundColor: colors.navBar,
          onPressed: () {},
          child: Icon(Icons.add, color: colors.secondaryText),
        ),
      ),
      body: Center(child: Text('Todos')),
    );
  }
}
