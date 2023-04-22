import 'package:get_it/get_it.dart';


import '../providers/gamedata_provider.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<GameDataProvider>(() => GameDataProvider());
}
