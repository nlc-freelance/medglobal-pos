import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/bloc/product_performance_list_bloc/product_performance_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/pages/product_performance_list/widgets/product_performance_list.dart';

class ProductPerformanceListPage extends StatelessWidget {
  const ProductPerformanceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<ProductPerformanceListBloc>()
        ..add(
          ProductPerformanceListEvent.getReports(
            filters: PageQuery(
              extra: {'type': ReportType.productPNL.value},
            ),
          ),
        ),
      child: const ProductPerformanceList(),
    );
  }
}
