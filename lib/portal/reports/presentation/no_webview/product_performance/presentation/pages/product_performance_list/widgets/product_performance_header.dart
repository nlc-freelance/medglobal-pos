import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/lazy_list_bloc/lazy_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/cubit/product_performance_form_cubit/product_performance_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/pages/product_performance_form/product_performance_form_dialog.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/shared/report_manager_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductPerformanceHeader extends StatelessWidget with DialogMixin {
  const ProductPerformanceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportManagerCubit, ReportManagerState>(
      listener: (context, state) {
        // final tasks = state.productPerformanceTasks;
        // if (tasks.polling.isNotEmpty) {
        //   Navigator.pop(context);
        // }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: PageHeader(
          title: Strings.productPerformanceTitle,
          subtitle: Strings.productPerformanceSubtitle,
          actions: [
            UIButton.filled(
              Strings.productPerformanceCreate,
              icon: Assets.icons.add.setSize(12.0),
              onClick: () => showCustomDialog(
                context,
                dialog: MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: context.read<LazyListBloc<Category>>()),
                    BlocProvider(create: (context) => ProductPerformanceFormCubit()),
                  ],
                  child: const GenerateProductPerformanceDialog(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
