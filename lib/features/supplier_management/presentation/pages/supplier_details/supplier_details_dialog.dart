import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/utils/dialog_handler.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/pages/supplier_details/supplier_details.dart';

class SupplierDetailsDialog extends DialogHandler {
  SupplierDetailsDialog([this.supplier]);

  final Supplier? supplier;

  @override
  Widget create(BuildContext context) => SupplierDetails(context, supplier: supplier);
}
