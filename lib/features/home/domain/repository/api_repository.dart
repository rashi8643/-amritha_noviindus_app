import 'package:novi_indus_test/features/home/domain/entity/patient_entity.dart';

abstract class ApiRepository {
  Future<List<PatientEntity>?> getDatas();
}
