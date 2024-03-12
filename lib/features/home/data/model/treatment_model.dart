import 'package:freezed_annotation/freezed_annotation.dart';

part 'treatment_model.freezed.dart';
part 'treatment_model.g.dart';

@freezed
class Treatment with _$Treatment {
  const factory Treatment({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "duration") required String duration,
    @JsonKey(name: "price") required String price,
    @JsonKey(name: "is_active") required bool isActive,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
  }) = _Treatment;

  factory Treatment.fromJson(Map<String, dynamic> json) =>
      _$TreatmentFromJson(json);
}
