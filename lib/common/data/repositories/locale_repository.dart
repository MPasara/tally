import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tally_mobile/common/data/local_storage_service.dart';
import 'package:tally_mobile/common/domain/failure.dart';
import 'package:tally_mobile/common/utils/either.dart';

abstract interface class LocaleRepository {
  EitherFailureOr<String?> getLocale();
  EitherFailureOr<void> setLocale(String languageCode);
}

@LazySingleton(as: LocaleRepository)
class LocaleRepositoryImpl implements LocaleRepository {
  LocaleRepositoryImpl(this._localStorageService);

  final LocalStorageService _localStorageService;

  @override
  EitherFailureOr<String?> getLocale() async {
    try {
      final result = await _localStorageService.getLanguageCode();
      return Right(result);
    } catch (e) {
      return Left(Failure(title: 'Get language code failed'));
    }
  }

  @override
  EitherFailureOr<void> setLocale(String languageCode) async {
    try {
      await _localStorageService.setLanguageCode(languageCode);
      return Right(null);
    } catch (e) {
      return Left(Failure(title: 'Get language code failed'));
    }
  }
}
