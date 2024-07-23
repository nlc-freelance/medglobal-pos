import 'package:flutter/material.dart';
import '../../../../../core/utils/dialog_handler.dart';
import '../../../domain/entities/supplier.dart';
import 'supplier_details.dart';

class SupplierDetailsDialog extends DialogHandler {
  SupplierDetailsDialog([this.supplier]);

  final Supplier? supplier;

  @override
  Widget create(BuildContext context) => SupplierDetails(context, supplier: supplier);
}
