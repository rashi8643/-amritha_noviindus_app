import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_assets_constants.g.dart';

final class AppAssetsConstants {
  /// Prefix used for the app icons
  static const _iconsPath = 'assets/icons/ic_';
  final icArrowBackward = '${_iconsPath}back.svg';
  final icCalendar = '${_iconsPath}calendar.svg';
  final icNotification = '${_iconsPath}notification.svg';
  final icPerson = '${_iconsPath}person.svg';
  final icSearch = '${_iconsPath}search.svg';

  /// Prefix used for the app images
  static const _imagePath = 'assets/images/img_';

  final icLogin = '${_imagePath}login.png';
  final icLogo = '${_imagePath}logo.png';
  final icSplash = '${_imagePath}splash.png';
}

@riverpod
AppAssetsConstants appAssetsConstants(AppAssetsConstantsRef ref) {
  return AppAssetsConstants();
}
