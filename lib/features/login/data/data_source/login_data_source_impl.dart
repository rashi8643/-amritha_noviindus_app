import 'package:dio/dio.dart';
import 'package:novi_indus_test/core/constants/api_constants.dart';
import 'package:novi_indus_test/features/login/data/data_source/login_data_source.dart';
import 'package:novi_indus_test/features/login/data/model/login_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_data_source_impl.g.dart';

class LoginDataSourceImpl implements LoginDataSource {
  final dio = Dio();
  static const link = ApiConstants.baseUrl;
  static const loginLink = ApiConstants.login;
  @override
  Future<LoginModel?> login(String name, String pass) async {
    try {
      final data = FormData.fromMap(
        {
          'username': name,
          'password': pass,
        },
      );

      final response = await dio.post(link + loginLink, data: data);
      if (response.statusCode == 200) {
        return await response.data;
      }
      return null;
    } catch (e) {
      throw Exception('Data Not found');
    }
  }
}

@riverpod
LoginDataSource loginDataSource(LoginDataSourceRef ref) {
  return LoginDataSourceImpl();
}
