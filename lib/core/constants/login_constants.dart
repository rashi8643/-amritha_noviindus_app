import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_constants.g.dart';

class LoginConstants {
  final String txtHead = 'Login or Register TO Book Your Appointment';
  final String txtuserName = 'User Name';
  final String txtPassword = 'Password';
  final String txtEnterUserName = 'Enter User Name';
  final String txtEnterPass = 'Enter Password';
  final String txtLogin = 'Login';
}

@riverpod
LoginConstants loginConstants(LoginConstantsRef ref) {
  return LoginConstants();
}
