import 'package:novi_indus_test/features/home/data/repository/api_repository_impl.dart';
import 'package:novi_indus_test/features/home/domain/entity/patient_entity.dart';
import 'package:novi_indus_test/features/home/domain/usecase/get_petients_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'patient_provider.g.dart';

@riverpod
class patient extends _$patient {
  @override
  Future<List<PatientEntity>> build() {
    return GetPatintsUsecase(repository: ref.watch(apiRepositoryProvider))();
  }
}
