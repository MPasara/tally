import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tally_mobile/app/theme/logic/theme_cubit.dart';

class TodosScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.read<ThemeCubit>().setLight(),
              child: Text('Light'),
            ),
            SizedBox(width: 6),
            ElevatedButton(
              onPressed: () => context.read<ThemeCubit>().setSystem(),
              child: Text('System'),
            ),
            SizedBox(width: 6),
            ElevatedButton(
              onPressed: () => context.read<ThemeCubit>().setDark(),
              child: Text('Dark'),
            ),
          ],
        ),
      ),
    );
  }
}
