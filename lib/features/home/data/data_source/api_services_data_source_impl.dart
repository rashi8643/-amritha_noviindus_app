import 'package:novi_indus_test/core/constants/api_constants.dart';
import 'package:novi_indus_test/features/home/data/data_source/api_services_data_source.dart';
import 'package:novi_indus_test/features/home/data/model/api_model.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_services_data_source_impl.g.dart';

class ApiServicesDataSourceImpl implements ApiServicesDataSource {
  final http.Client client = http.Client();
  static const link = ApiConstants.baseUrl;
  static const patientLink = ApiConstants.patientList;
  static const tocken = ApiConstants.tocken;

  @override
  Future<List<Patient>?> getDatas() async {
    final url = Uri.parse(link + patientLink);
    try {
      final response = await client.get(url, headers: {
        'Authorization': tocken,
      });
      if (response.statusCode == 200) {
        final data = apiModelFromJson(response.body);
        final datas = <Patient>[];
        for (final result in data.patient) {
          datas.add(
            Patient(
              id: result.id,
              patientdetailsSet: result.patientdetailsSet,
              branch: result.branch,
              user: result.user,
              payment: result.payment,
              name: result.name,
              phone: result.phone,
              address: result.address,
              price: result.price,
              totalAmount: result.totalAmount,
              discountAmount: result.discountAmount,
              advanceAmount: result.advanceAmount,
              balanceAmount: result.balanceAmount,
              dateNdTime: result.dateNdTime,
              isActive: result.isActive,
              createdAt: result.createdAt,
              updatedAt: result.updatedAt,
            ),
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
