import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_constants.g.dart';

class HomeConstants {
  final String txtSearch = 'Search';
  final String txtSearchField = 'Search for treatment';
  final String txtViewBooking = 'View Booking Details';
  final String txtRegister = 'Register Now';
}

@riverpod
HomeConstants homeConstants(HomeConstantsRef ref) {
  return HomeConstants();
}
