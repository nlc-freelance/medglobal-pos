import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/print_util.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_no_data.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/pos_product_list_search_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/print_receipt_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/register_item_list_remote/register_item_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/pages/cart/cart_closed.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/pages/cart/cart_open.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/pages/register/register_items_data_grid.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class RegisterPage extends StatefulWidget {
  static String route = '/point-of-sale/register';

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _searchController;
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 8,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: UIColors.borderMuted, width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UISearchField(
                  fieldWidth: double.infinity,
                  hint: 'Search',
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Assets.icons.search.svg(),
                  ),
                  controller: _searchController,
                  onChanged: (value) => _debouncer.run(
                    (() {
                      context.read<PosProductListSearchCubit>().setSearchKey(value);
                      context.read<RegisterItemListRemoteCubit>().getRegisterItems(
                            search: value,
                            isInitialSearch: true,
                          );
                    }),
                  ),
                ),
                BlocConsumer<PrintReceiptCubit, PrintReceiptState>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: () =>
                          context.read<PrintReceiptCubit>().printReceipt(Transaction(receiptId: 'MG-LP-2024082100001')),
                      child: const Text('PRINT RECEIPT'),
                    );
                  },
                  listener: (BuildContext context, PrintReceiptState state) {
                    if (state is PrintReceiptLoading) print('printing');
                    if (state is PrintReceiptSuccess) print('printed');
                    if (state is PrintReceiptError) print('error');
                  },
                ),
                const UIVerticalSpace(36),
                BlocBuilder<RegisterItemListRemoteCubit, RegisterItemListRemoteState>(
                  builder: (context, state) {
                    if (state is RegisterItemListLoading) {
                      return DataGridLoading(
                        columns: DataGridUtil.getColumns(DataGridColumn.REGISTER_ITEMS),
                        source: RegisterItemsDataSource([], context),
                      );
                    }
                    if (state is RegisterItemListError) {
                      return Text(state.message);
                    }
                    if (state is RegisterItemListLoaded) {
                      return Expanded(
                        child: RegisterItemsDataGrid(state.products),
                      );
                    }

                    return DataGridNoData(
                      columns: DataGridUtil.getColumns(DataGridColumn.REGISTER_ITEMS),
                      source: RegisterItemsDataSource([], context),
                      message: 'please select a register first',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            PrintUtil.printPdf(Transaction(receiptId: 'MG-LP-2024082100001'));
          },
          child: Text('Print receipt'),
        ),
        const UIHorizontalSpace(16),
        BlocBuilder<RegisterShiftBloc, RegisterShiftState>(
          builder: (context, state) {
            return Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: UIColors.borderMuted, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: FutureBuilder(
                    future: SharedPreferencesService.isShiftOpen(),
                    builder: (context, snapshot) {
                      return snapshot.data == true ? const CartOpen() : const CartClosed();
                    }),
              ),
            );
          },
        ),
      ],
    );
  }
}
