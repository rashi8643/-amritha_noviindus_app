import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:novi_indus_test/features/home/domain/entity/patient_entity.dart';

part 'home_provider_state.freezed.dart';

@freezed
class HomeProviderState with _$HomeProviderState {
  factory HomeProviderState({
    required List<PatientEntity>? getDatas,
  }) = _HomeProviderState;
}
