import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/product_dto.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';

class Filter {
  final int id;
  final FilterType? type;
  final FilterRule? rule;
  final dynamic value;

  const Filter({required this.id, this.type, this.rule = FilterRule.IS, this.value});

  Filter copyWith({
    int? id,
    FilterType? type,
    FilterRule? rule,
    dynamic value,
    bool? nullType = false,
    bool? nullRule = false,
    bool? nullValue = false,
  }) {
    return Filter(
      id: id ?? this.id,
      type: nullType == true ? null : type ?? this.type,
      rule: nullRule == true ? null : rule ?? this.rule,
      value: nullValue == true ? null : value ?? this.value,
    );
  }

  @override
  String toString() {
    return 'Filter{id: $id, type: $type, rule: $rule, value: $value}';
  }
}

extension FilterListExt on List<Filter> {
  List<Map<String, dynamic>> get toPayload {
    dynamic value(Filter filter) {
      if (filter.type == FilterType.BRANCH) return (filter.value as Branch).id;
      if (filter.type == FilterType.SUPPLIER) return (filter.value as Supplier).id;
      if (filter.type == FilterType.PRODUCT_CATEGORY) return (filter.value as Category).id;
      if (filter.type == FilterType.PRODUCT_NAME) return (filter.value as ProductDto).name;
    }

    return map((filter) => {
          'condition': filter.rule?.name,
          'value': value(filter),
        }).toList();
  }
}
