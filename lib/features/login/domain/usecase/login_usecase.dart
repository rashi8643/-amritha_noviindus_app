import 'package:novi_indus_test/core/exception/login/login_failed_exception.dart';
import 'package:novi_indus_test/features/login/domain/entity/login_entity.dart';
import 'package:novi_indus_test/features/login/domain/repository/login_repository.dart';

final class LoginUsecase {
  final LoginRepository repository;
  LoginUsecase({required this.repository});

  Future<LoginEntity> call(String name, String pass) async {
    try {
      LoginEntity user = await repository.login(name, pass);
      if (user.token != null) {
        return user;
      } else {
        throw LoginFailedException(error: user.message);
      }
    } catch (e) {
      rethrow;
    }
  }
}
