import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_empty.dart';

class ProductPerformanceDataGridEmpty extends StatelessWidget {
  const ProductPerformanceDataGridEmpty({super.key});

  @override
  Widget build(BuildContext context) => const DataGridEmpty(
        title: Strings.productPerformanceEmptyTitle,
        subtitle: Strings.productPerformanceEmptySubtitle,
      );
}
