import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/data/dto/request/report_payload.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report_task.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/shared/report_manager_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ExportButton extends StatelessWidget {
  final ReportType type;
  final Map<String, dynamic>? filters;

  const ExportButton(this.type, {super.key, this.filters});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportManagerCubit, ReportManagerState>(
      builder: (context, state) {
        return UIButton.outlined(
          'Export CSV',
          iconBuilder: (isHover) => Assets.icons.download.setColorOnHover(isHover),
          onClick: () => context.read<ReportManagerCubit>().generateReport(
                ReportPayload(
                  type: type.value,
                  filters: filters,
                ),
              ),
          isLoading: state.tasks.any(
            (task) =>
                task.type == type &&
                (task.status == ReportTaskStatus.creating ||
                    task.status == ReportTaskStatus.polling ||
                    task.status == ReportTaskStatus.downloading),
          ),
        );
      },
    );
  }
}
