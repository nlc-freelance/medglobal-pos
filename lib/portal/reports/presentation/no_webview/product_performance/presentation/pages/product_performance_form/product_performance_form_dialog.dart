import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:medglobal_admin_portal/core/widgets/dialog/app_custom_dialog.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report_task.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/shared/report_manager_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/cubit/product_performance_form_cubit/product_performance_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/pages/product_performance_form/widgets/product_performance_form.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/pages/product_performance_form/widgets/product_performance_selection.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class GenerateProductPerformanceDialog extends StatefulWidget {
  const GenerateProductPerformanceDialog({super.key});

  @override
  State<GenerateProductPerformanceDialog> createState() => _GenerateProductPerformanceDialogState();
}

class _GenerateProductPerformanceDialogState extends State<GenerateProductPerformanceDialog> {
  int currentStep = 0;
  ReportTask? currentReportTask;

  late ProductPerformanceFormCubit formCubit;
  late ReportManagerCubit reportCubit;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    formCubit = context.read<ProductPerformanceFormCubit>();
    reportCubit = context.read<ReportManagerCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: AppCustomDialog(
        title: 'Generate Product Performance Report',
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            currentStep == 0 ? const ProductPerformanceSelection() : const ProductPerformanceForm(),
            const UIVerticalSpace(16),
            BlocSelector<ProductPerformanceFormCubit, ProductPerformanceFormState, bool>(
              selector: (state) => state.isTypeSelected,
              builder: (context, isTypeSelected) => isTypeSelected
                  ? const SizedBox.shrink()
                  : const PageErrorBanner(message: 'Please select a report type.'),
            ),
          ],
        ),
        actions: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocSelector<ProductPerformanceFormCubit, ProductPerformanceFormState, bool>(
              selector: (state) => state.isFormValid,
              builder: (context, isFormValid) => isFormValid
                  ? const SizedBox.shrink()
                  : const PageErrorBanner(message: 'Please fill in all required fields.'),
            ),
            BlocConsumer<ReportManagerCubit, ReportManagerState>(
              listener: (context, state) {
                final failedCreationTasks = state.productPerformanceTasks.failedCreation;

                setState(() {
                  currentReportTask = failedCreationTasks.isNotEmpty ? failedCreationTasks.first : null;
                });
              },
              builder: (context, state) {
                if (currentReportTask == null) return const SizedBox();

                return PageErrorBanner(message: currentReportTask!.error!);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                currentStep == 0
                    ? UIButton.outlined('Cancel', onClick: () => Navigator.pop(context))
                    : UIButton.outlined('Back', onClick: _onBack),
                const UIHorizontalSpace(8),
                currentStep == 0
                    ? UIButton.filled('Next', onClick: _onTypeSelected)
                    : UIButton.filled('Generate', onClick: _onGenerate),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onBack() {
    if (currentReportTask != null) reportCubit.removeTask(currentReportTask!.key);
    formCubit.reset();

    setState(() => currentStep = 0);
  }

  void _onTypeSelected() {
    formCubit.validateType();

    if (formCubit.state.isTypeSelected) setState(() => currentStep = 1);
  }

  void _onGenerate() {
    /// Remove all product performance tasks that failed during the creation phase,
    /// before attempting to generate new reports again.
    final failedCreationTasks = reportCubit.state.productPerformanceTasks.failedCreation;

    if (failedCreationTasks.isNotEmpty) {
      for (ReportTask task in failedCreationTasks) {
        reportCubit.removeTask(task.key);
      }
    }

    /// Validates the form and, if valid, triggers report generation without auto-download.
    formCubit.validate();

    if (formCubit.state.isFormValid) {
      final payload = formCubit.state.toPayload;

      if (payload != null) {
        reportCubit.generateReport(payload, autoDownload: false);
        PageLoader.show(context);
      }
    }
  }

  @override
  void dispose() {
    if (currentReportTask != null) reportCubit.removeTask(currentReportTask!.key);
    formCubit.reset();

    super.dispose();
  }
}
