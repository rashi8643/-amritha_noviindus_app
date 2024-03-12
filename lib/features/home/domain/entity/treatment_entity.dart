import 'package:freezed_annotation/freezed_annotation.dart';

part 'treatment_entity.freezed.dart';

@freezed
class TreatmentEntity with _$TreatmentEntity {
  const factory TreatmentEntity({
    required int id,
    required String name,
    required String duration,
    required String price,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TreatmentEntity;
}
