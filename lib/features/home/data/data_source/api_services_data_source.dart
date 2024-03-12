import 'package:novi_indus_test/features/home/data/model/api_model.dart';

abstract class ApiServicesDataSource {
  Future<List<Patient>?> getDatas();
}
