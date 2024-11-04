import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/portal/reports/bloc/reports_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class DataGridToolbar extends StatelessWidget {
  const DataGridToolbar({
    this.filters,
    this.search,
    this.padding,
    this.reportType,
    super.key,
  });

  final List<Widget>? filters;
  final Widget? search;
  final EdgeInsets? padding;
  final ReportType? reportType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 24),
      child: Row(
        children: [
          if (search != null) ...[
            search!,
            const UIHorizontalSpace(8),
            const Spacer(),
          ],
          ...?filters,
          if (search == null) const Spacer(),
          if (reportType != null) ...[
            const UIHorizontalSpace(8),
            DownloadReportButton(reportType!),
          ],
        ],
      ),
    );
  }
}

class DownloadReportButton extends StatelessWidget {
  final ReportType type;
  final Map<String, dynamic>? filters;

  const DownloadReportButton(this.type, {super.key, this.filters});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReportsBloc, ReportsState>(
      listener: (context, state) {
        if (state is ReportCreateSuccess && type == state.type) {
          context.read<ReportsBloc>().add(StartReportGeneratePollingEvent(type, id: state.reportId));
        }
        if (state is ReportByIdSuccess && type == state.type) {
          if (state.report.status == ReportStatus.COMPLETED) {
            context.read<ReportsBloc>().add(DownloadReportEvent(type, fileUrl: state.report.fileUrl!));
          }
        }
        if (state is ReportError && type == state.type) {
          ToastNotification.error(context, state.message);
        }
        if (state is ReportByIdError && type == state.type) {
          ToastNotification.error(context, state.message);
        }
      },
      builder: (context, state) {
        return UIButton.outlined('Download CSV',
            iconBuilder: (isHover) => Assets.icons.download.setColorOnHover(isHover),
            onClick: () => context.read<ReportsBloc>().add(CreateReportEvent(type, filters: filters)),
            isLoading: (state is ReportByIdLoading && type == state.type) ||
                (state is ReportCreateLoading && type == state.type) ||
                (state is ReportGeneratePolling && type == state.type));
      },
    );
  }
}
