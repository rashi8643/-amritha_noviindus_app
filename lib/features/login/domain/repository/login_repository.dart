import 'package:novi_indus_test/features/login/domain/entity/login_entity.dart';

abstract class LoginRepository {
  Future<LoginEntity> login(String name, String pass);
}
