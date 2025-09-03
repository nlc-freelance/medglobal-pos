import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/bloc/product_performance_list_bloc/product_performance_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/pages/product_performance_list/widgets/product_performance_list.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/shared/report_bloc/report_bloc.dart';

class ProductPerformanceListPage extends StatelessWidget {
  const ProductPerformanceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I<ProductPerformanceListBloc>()
            ..add(
              ProductPerformanceListEvent.getReports(
                query: PageQuery(extra: ReportType.productPerformanceTypeQuery),
              ),
            ),
        ),
        // If ReportBloc is created on this page, the Bloc closes when user navigates to other page and cannot add new events
        // Create the the Bloc on the main app so it does not close on page navigate
        // Investigate further later
        // BlocProvider(
        //   create: (context) => GetIt.I<ReportBloc>(),
        // ),
      ],
      child: const ProductPerformanceList(),
    );
  }
}
