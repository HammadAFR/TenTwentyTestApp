import 'package:get_it/get_it.dart';

import '../services/database_services.dart';
import '../services/local_storage_service.dart';

GetIt locator = GetIt.instance;

setupLocator() async {
  locator.registerSingleton(LocalStorageService());
  locator.registerSingleton(DatabaseServices());
}
