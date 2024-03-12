import 'package:novi_indus_test/core/exception/base_exception.dart';

class LoginFailedException extends BaseException {
  final String? error;
  LoginFailedException({this.error})
      : super(
            message: error ??
                "Login Failed with an unknown exception, please try again");
}
