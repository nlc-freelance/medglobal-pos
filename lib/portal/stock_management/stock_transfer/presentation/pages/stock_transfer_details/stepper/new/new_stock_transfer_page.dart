import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/new_stock_transfer/new_stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer/stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer_remote/stock_transfer_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/pages/stock_transfer_details/stepper/stock_transfer_stepper.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class NewStockTransferPage extends StatefulWidget {
  const NewStockTransferPage({super.key});

  @override
  State<NewStockTransferPage> createState() => _NewStockTransferPageState();
}

class _NewStockTransferPageState extends State<NewStockTransferPage> {
  @override
  void initState() {
    super.initState();
    context.read<StockTransferRemoteCubit>().reset();
    context.read<NewStockTransferCubit>().reset();

    /// TODO: Can be removed if the initState is always triggered when navigating to [StockTransfersPage]
    context.read<StockTransferCubit>().reset();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          title: 'New Stock Transfer',
          subtitle: Strings.subtitlePlaceholder,
        ),
        UIText.heading5('Step 1 of 4 - Creation'),
        const UIVerticalSpace(12),
        const StockTransferStepper(),
      ],
    );
  }
}
