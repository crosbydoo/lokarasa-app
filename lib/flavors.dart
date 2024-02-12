import 'package:restaurant_app/core/constant/app_constant.dart';

enum Flavor {
  production,
  development,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.production:
        return 'Lokarasa';
      case Flavor.development:
        return 'Lokarasa Dev';
      default:
        return 'Lokarasa Dev';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.development:
        return AppConstant.appBaseUrl;

      case Flavor.production:
        return AppConstant.appBaseUrl;

      default:
        return AppConstant.appBaseUrl;
    }
  }
}
