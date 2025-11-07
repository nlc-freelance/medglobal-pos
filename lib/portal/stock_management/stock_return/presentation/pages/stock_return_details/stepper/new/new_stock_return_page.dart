import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/new_stock_return/new_stock_return_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return/stock_return_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return_remote/stock_return_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/pages/stock_return_details/stepper/stock_return_stepper.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class NewStockReturnPage extends StatefulWidget {
  const NewStockReturnPage({super.key});

  @override
  State<NewStockReturnPage> createState() => _NewStockReturnPageState();
}

class _NewStockReturnPageState extends State<NewStockReturnPage> {
  @override
  void initState() {
    super.initState();
    context.read<StockReturnRemoteCubit>().reset();
    context.read<NewStockReturnCubit>().reset();

    /// TODO: Can be removed if the initState is always triggered when navigating to [StockReturnListPage]
    context.read<StockReturnCubit>().reset();
  }

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
