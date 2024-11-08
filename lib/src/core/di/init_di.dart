import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:budget_tracker/src/core/di/init_di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();
