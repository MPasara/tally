import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tally_mobile/app/core/service_locator.dart';
import 'package:tally_mobile/app/theme/app_theme.dart';
import 'package:tally_mobile/app/theme/logic/theme_cubit.dart';
import 'package:tally_mobile/main_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: context.read<ThemeCubit>().selectedThemeMode,
            home: const MainScreen(),
          );
        },
      ),
    );
  }
}
