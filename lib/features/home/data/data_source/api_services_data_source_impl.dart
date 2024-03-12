import 'package:dio/dio.dart';
import 'package:novi_indus_test/core/constants/api_constants.dart';
import 'package:novi_indus_test/features/home/data/data_source/api_services_data_source.dart';
import 'package:novi_indus_test/features/home/data/model/api_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_services_data_source_impl.g.dart';

class ApiServicesDataSourceImpl implements ApiServicesDataSource {
  final Dio dio = Dio();
  static const link = ApiConstants.baseUrl;
  static const patientLink = ApiConstants.patientList;
  static const tocken = ApiConstants.tocken;

  @override
  Future<List<Patient>?> getDatas() async {
    try {
      dio.options.headers["Authorization"] = tocken;
      final response = await dio.get(link + patientLink);
      if (response.statusCode == 200) {
        final data = response.data;
        final datas = <Patient>[];
        for (final result in data['patient']) {
          datas.add(
            Patient.fromJson(result),
          );
        }
        return datas;
      }
      return null;
    } catch (e) {
      throw Exception('Api not found');
    }
  }
}

@riverpod
ApiServicesDataSource apiServicesDataSource(ApiServicesDataSourceRef ref) {
  return ApiServicesDataSourceImpl();
}
