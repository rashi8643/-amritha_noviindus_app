import 'package:novi_indus_test/features/login/domain/entity/login_entity.dart';
import 'package:novi_indus_test/features/login/domain/repository/login_repository.dart';

final class LoginUsecase {
  final LoginRepository repository;
  LoginUsecase({required this.repository});

  Future<LoginEntity?> call(String name, String pass) async {
    try {
      return await repository.login(name, pass);
    } catch (e) {
      throw Exception('Error');
    }
  }
}
