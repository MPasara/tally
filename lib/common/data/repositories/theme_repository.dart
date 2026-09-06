import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tally_mobile/common/data/services/local_storage_service.dart';
import 'package:tally_mobile/common/domain/failure.dart';
import 'package:tally_mobile/common/utils/either.dart';

abstract interface class ThemeRepsitory {
  EitherFailureOr<ThemeMode> getThemeMode();
  EitherFailureOr<void> setThemeMode(ThemeMode themeMode);
}

@LazySingleton(as: ThemeRepsitory)
class ThemeRepsitoryImpl implements ThemeRepsitory {
  final LocalStorageService _storageService;

  ThemeRepsitoryImpl(this._storageService);
  @override
  EitherFailureOr<ThemeMode> getThemeMode() async {
    try {
      final theme = await _storageService.getThemeMode();
      switch (theme) {
        case 'light':
          return Right(ThemeMode.light);
        case 'dark':
          return Right(ThemeMode.dark);
        default:
          return Right(ThemeMode.system);
      }
    } catch (e, st) {
      return Left(Failure(title: 'Get theme failed', error: e, stackTrace: st));
    }
  }

  @override
  EitherFailureOr<void> setThemeMode(ThemeMode themeMode) async {
    try {
      await _storageService.setThemeMode(themeMode.name);
      return const Right(null);
    } catch (e, st) {
      return Left(Failure(title: 'Set theme failed', error: e, stackTrace: st));
    }
  }
}
