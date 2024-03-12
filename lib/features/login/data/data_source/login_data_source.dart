import 'package:novi_indus_test/features/login/data/model/login_model.dart';

abstract class LoginDataSource {
  Future<LoginModel> login(String name, String pass);
}
