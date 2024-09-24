import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/entities/branch.dart';

part 'branch_dto.g.dart';

@JsonSerializable()
class BranchDto extends Equatable {
  final int? id;
  final String? name;
  final String? address;
  final int? accountId;
  @DateTimeConverter()
  final DateTime? createdAt;
  @DateTimeConverter()
  final DateTime? updatedAt;

  const BranchDto({
    this.id,
    this.name,
    this.address,
    this.accountId,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [id, name, address, accountId, createdAt, updatedAt];

  factory BranchDto.fromJson(Map<String, dynamic> json) => _$BranchDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BranchDtoToJson(this);

  Branch toEntity() => Branch(
        id: id,
        name: name ?? Strings.empty,
        address: address,
        accountId: accountId,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
