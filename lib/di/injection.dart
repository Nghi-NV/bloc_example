import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static Future<void> initialize() async {
    // Register services and Providers
    // sl.registerLazySingleton(() => ApiService());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => prefs);
  }
}
