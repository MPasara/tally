import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tally_mobile/common/data/repositories/locale_repository.dart';
import 'package:tally_mobile/common/utils/constants.dart';

@lazySingleton
class LocaleCubit extends Cubit<Locale> {
  LocaleCubit(this._localeRepository) : super(const Locale(Constants.eng));

  final LocaleRepository _localeRepository;

  Future<void> loadLocale() async {
    final result = await _localeRepository.getLocale();
    result.fold((_) {}, (languageCode) {
      if (languageCode != null) {
        emit(Locale(languageCode));
      }
    });
  }

  Future<void> changeLocale(String languageCode) async {
    emit(Locale(languageCode));
    await _localeRepository.setLocale(languageCode);
  }
}
