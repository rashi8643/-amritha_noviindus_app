import 'package:novi_indus_test/features/home/data/data_source/api_services_data_source.dart';
import 'package:novi_indus_test/features/home/data/data_source/api_services_data_source_impl.dart';
import 'package:novi_indus_test/features/home/domain/entity/branch_entity.dart';
import 'package:novi_indus_test/features/home/domain/entity/patient_entity.dart';
import 'package:novi_indus_test/features/home/domain/entity/treatment_entity.dart';
import 'package:novi_indus_test/features/home/domain/repository/api_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_repository_impl.g.dart';

class ApiRepositoryImpl implements ApiRepository {
  final ApiServicesDataSource dataSource;
  ApiRepositoryImpl({required this.dataSource});
  @override
  Future<List<PatientEntity>> getDatas() async {
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

  @override
  Future<List<BranchEntity>> getBranchs() async {
    final data = await dataSource.getBranches();
    late List<BranchEntity> results;
    results = [
      for (final result in data!)
        BranchEntity(
          id: result.id,
          name: result.name,
          patientsCount: result.patientsCount,
          location: result.location,
          phone: result.phone,
          mail: result.mail,
          address: result.address,
          gst: result.gst,
          isActive: result.isActive,
        ),
    ];
    return results;
  }

  @override
  Future<List<TreatmentEntity>> getTreatment() async {
    final data = await dataSource.getTeatemetns();
    late List<TreatmentEntity> results;
    results = [
      for (final result in data!)
        TreatmentEntity(
          id: result.id,
          name: result.name,
          duration: result.duration,
          price: result.price,
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
