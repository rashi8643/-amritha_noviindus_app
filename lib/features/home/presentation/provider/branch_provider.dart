import 'package:novi_indus_test/features/home/data/repository/api_repository_impl.dart';
import 'package:novi_indus_test/features/home/domain/entity/branch_entity.dart';
import 'package:novi_indus_test/features/home/domain/usecase/get_branches_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'branch_provider.g.dart';

@riverpod
class Branch extends _$Branch {
  @override
  Future<List<BranchEntity>> build() {
    return GetBranchesUsecase(repository: ref.watch(apiRepositoryProvider))();
  }
}
