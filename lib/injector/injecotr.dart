import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injecotr.config.dart';

final GetIt getIt = GetIt.I;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
GetIt initAppDependencies({String environment}) =>
    $initGetIt(getIt, environment: environment);
