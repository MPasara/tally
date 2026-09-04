import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tally_mobile/app/core/service_locator.dart';
import 'package:tally_mobile/app/theme/app_theme.dart';
import 'package:tally_mobile/app/theme/logic/locale_cubit.dart';
import 'package:tally_mobile/app/theme/logic/theme_cubit.dart';
import 'package:tally_mobile/generated/l10n.dart';
import 'package:tally_mobile/main_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = sl<ThemeCubit>();
    final localeCubit = sl<LocaleCubit>();
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: themeCubit),
        BlocProvider.value(value: localeCubit),
      ],

      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            locale: context.watch<LocaleCubit>().state,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: [
              S.delegate,
              ...GlobalMaterialLocalizations.delegates,
            ],
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
