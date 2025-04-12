import '../secure_storage/secure_constant.dart';
import '../secure_storage/secure_storage.dart';

class Routes {
  static Future<String> getIntialRoute() async {
    final token = await SecureStorage.instance.read(
      SecureConstant.keyUserToken,
    );

    return token != null && token.isNotEmpty ? homeScreen : loginScreen;
  }

  static const String onBoardingScreen = '/onBoardingScreen';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String homeScreen = '/homeScreen';
}
