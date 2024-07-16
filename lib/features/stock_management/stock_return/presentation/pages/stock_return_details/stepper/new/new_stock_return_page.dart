import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/search_dropdown/search_dropdown.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch_repository.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/purchase_order_stepper.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/presentation/pages/stock_return_details/stepper/stock_return_stepper.dart';
import 'package:medglobal_admin_portal/features/supplier_management/data/repositories/supplier_repository_impl.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/repositories/supplier_repository.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:medglobal_shared/styles/exports.dart';

class NewStockReturnPage extends StatelessWidget {
  const NewStockReturnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          title: 'New Stock Return',
          subtitle: Strings.subtitlePlaceholder,
        ),
        UIText.heading5('Step 1 of 3 - Creation'),
        const UIVerticalSpace(12),
        const StockReturnStepper(),
      ],
    );
  }
}
