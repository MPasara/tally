import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tally_mobile/app/core/service_locator.config.dart';

final sl = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => sl.init();
