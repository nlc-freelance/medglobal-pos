import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/utils/datetime_converter.dart';

part 'branch.g.dart';

@JsonSerializable()
class Branch extends Equatable {
  final int id;
  final String name;
  final int? accountId;
  @DateTimeConverter()
  final DateTime? createdAt;
  @DateTimeConverter()
  final DateTime? updatedAt;

  const Branch({
    required this.id,
    required this.name,
    this.accountId,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [id, name, accountId, createdAt, updatedAt];

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  Map<String, dynamic> toJson() => _$BranchToJson(this);
}
