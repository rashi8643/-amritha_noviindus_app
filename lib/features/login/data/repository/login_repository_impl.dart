import 'package:novi_indus_test/features/login/data/data_source/login_data_source.dart';
import 'package:novi_indus_test/features/login/data/data_source/login_data_source_impl.dart';
import 'package:novi_indus_test/features/login/domain/entity/login_entity.dart';
import 'package:novi_indus_test/features/login/domain/repository/login_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_repository_impl.g.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;
  LoginRepositoryImpl({required this.dataSource});
  @override
  Future<LoginEntity> login(String name, String pass) async {
    final data = await dataSource.login(name, pass);

    final result = LoginEntity(
      status: data.status,
      message: data.message,
      token: data.token,
      isSuperuser: data.isSuperuser,
    );
    return result;
  }
}

@riverpod
LoginRepository loginRepository(LoginRepositoryRef ref) {
  return LoginRepositoryImpl(dataSource: ref.watch(loginDataSourceProvider));
}
