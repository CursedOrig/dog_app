part of 'app_res.dart';

class AppImages {
  AppImages._();

  static final String preloaderImg = 'dog-poster.png'.asImageAsset;
}

extension on String {
  String get asImageAsset => 'assets/images/$this';
}
