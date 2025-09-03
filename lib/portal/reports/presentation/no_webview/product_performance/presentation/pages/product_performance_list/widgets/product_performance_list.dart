import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report_task.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/shared/report_bloc/report_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/shared/report_manager_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/bloc/product_performance_list_bloc/product_performance_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/pages/product_performance_list/widgets/data_grid/product_performance_data_grid.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/pages/product_performance_list/widgets/product_performance_header.dart';

class ProductPerformanceList extends StatelessWidget {
  const ProductPerformanceList({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ReportBloc, ReportState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: () => PageLoader.show(context),
              loaded: (report) {
                PageLoader.close();
                context.read<ReportManagerCubit>().manualDownloadReport(report);
              },
              failure: (message) {
                PageLoader.close();
                SnackbarUtil.error(context, message);
              },
              orElse: () {},
            );
          },
        ),

        BlocListener<ReportManagerCubit, ReportManagerState>(
          listener: (context, state) {
            final listBloc = context.read<ProductPerformanceListBloc>();
            final tasks = state.productPerformanceTasks;

            if (tasks.failedCreation.isNotEmpty) {
              PageLoader.close();
            }

            /// If any product performance report task's status is polling (it means report generation has been triggered),
            /// add a temporary report for UI feedback.
            if (tasks.polling.isNotEmpty) {
              for (ReportTask task in tasks.polling) {
                listBloc.add(
                  ProductPerformanceListEvent.addReport(
                    Report(
                      id: task.id,
                      type: task.type,
                      status: ReportStatus.pending,
                      fileName: task.fileName,
                    ),
                  ),
                );
              }
              PageLoader.close();
            }

            /// If any product performance report task's status is ready, update the report to show 'Download'.
            if (tasks.ready.isNotEmpty) {
              for (ReportTask task in tasks.ready) {
                listBloc.add(
                  ProductPerformanceListEvent.updateReport(
                    task.id,
                    (report) => report.copyWith(
                      status: ReportStatus.completed,
                      fileUrl: task.fileUrl,
                    ),
                  ),
                );
              }
            }
          },
        ),

        /// Close dialog after adding the new report in the ProductPerformanceListBloc for UI display
        BlocListener<ProductPerformanceListBloc, ProductPerformanceListState>(
          listener: (context, state) {
            state.maybeWhen(
              loaded: (_, addedNew) {
                if (addedNew) Navigator.of(context, rootNavigator: true).pop();
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: const Column(
        children: [
          ProductPerformanceHeader(),
          Expanded(child: ProductPerformanceDataGrid()),
        ],
      ),
    );
  }
}
