import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return/stock_return_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return_remote/stock_return_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/pages/stock_return_details/stepper/details/stock_return_details.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/pages/stock_return_details/stepper/stock_return_stepper.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StockReturnDetailsPage extends StatefulWidget {
  const StockReturnDetailsPage({super.key, required this.id});

  final String id;

  @override
  State<StockReturnDetailsPage> createState() => _StockReturnDetailsPageState();
}

class _StockReturnDetailsPageState extends State<StockReturnDetailsPage> {
  late StockReturn _stockReturn;

  @override
  void initState() {
    super.initState();
    context.read<StockReturnRemoteCubit>().getStockReturnById(int.parse(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockReturnRemoteCubit, StockReturnRemoteState>(
      listener: (context, state) {
        if (state is StockReturnByIdSuccess) {
          _stockReturn = state.stockReturn;
          context.read<StockReturnCubit>().setStockReturn(state.stockReturn);
        }
        if (state is StockReturnSuccess) {
          _stockReturn = state.stockReturn;
          SnackbarUtil.success(context, 'Stock Return updated successfully.');
        }
      },
      builder: (context, state) {
        if (state is StockReturnByIdError) {
          return Text(state.message);
        }
        if (state is StockReturnByIdLoading) {
          return const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2));
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              title: _stockReturn.status == StockOrderStatus.NEW ? 'Edit Stock Return' : 'Stock Return Details',
              titleTrailings: [
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Chip(
                    label: Text(
                      _stockReturn.status!.label,
                      style: UIStyleText.chip.copyWith(color: StatusMapper.textColor(_stockReturn.status!)),
                    ),
                    backgroundColor: StatusMapper.color(_stockReturn.status!),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: UIColors.transparent),
                    ),
                  ),
                ),
              ],
            ),
            if (_stockReturn.status == StockOrderStatus.NEW) ...[
              UIText.heading5('Step 2 of 3 - Editing'),
              const UIVerticalSpace(12),
              const StockReturnStepper(currentStep: 1),
            ],
            if (_stockReturn.status == StockOrderStatus.COMPLETED)
              const Expanded(
                child: SingleChildScrollView(
                  child: StockReturnDetails(),
                ),
              )
          ],
        );
      },
    );
  }
}
