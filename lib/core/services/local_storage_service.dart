import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/custom_logger.dart';

class LocalStorageService {
  final Logger logger =
      Logger(printer: CustomLogPrinter(className: 'LocalStorageService'));
  static const String _tokenKey = 'accessToken';

  Future<void> saveAccessToken({required String accessToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, accessToken);
    logger.i('access Token ==============================> $accessToken');
  }

  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }
}
