import 'package:novi_indus_test/features/home/data/model/api_model.dart';
import 'package:novi_indus_test/features/home/data/model/branch_model.dart';
import 'package:novi_indus_test/features/home/data/model/treatment_model.dart';

abstract class ApiServicesDataSource {
  Future<List<Patient>?> getDatas();
  Future<List<BranchModel>?> getBranches();
  Future<List<Treatment>?> getTeatemetns();
}
