import 'package:novi_indus_test/features/home/data/data_source/api_services_data_source.dart';
import 'package:novi_indus_test/features/home/data/data_source/api_services_data_source_impl.dart';
import 'package:novi_indus_test/features/home/domain/entity/patient_entity.dart';
import 'package:novi_indus_test/features/home/domain/repository/api_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_repository_impl.g.dart';

class ApiRepositoryImpl implements ApiRepository {
  final ApiServicesDataSource dataSource;
  ApiRepositoryImpl({required this.dataSource});
  @override
  Future<List<PatientEntity>?> getDatas() async {
    final data = await dataSource.getDatas();

    late List<PatientEntity> results;

    results = [
      for (final result in data!)
        PatientEntity(
          id: result.id,
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
    ];
    return results;
  }
}

@riverpod
ApiRepository apiRepository(ApiRepositoryRef ref) {
  return ApiRepositoryImpl(
    dataSource: ref.watch(
      apiServicesDataSourceProvider,
    ),
  );
}
