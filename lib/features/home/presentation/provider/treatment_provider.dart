import 'package:novi_indus_test/features/home/data/repository/api_repository_impl.dart';
import 'package:novi_indus_test/features/home/domain/entity/treatment_entity.dart';
import 'package:novi_indus_test/features/home/domain/usecase/get_treatement_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'treatment_provider.g.dart';

@riverpod
class Treatment extends _$Treatment {
  @override
  Future<List<TreatmentEntity>> build() {
    return GetTreatmentUsecase(repository: ref.watch(apiRepositoryProvider))();
  }
}
