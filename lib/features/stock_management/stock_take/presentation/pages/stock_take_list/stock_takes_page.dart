import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/search_dropdown/search_dropdown.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch_repository.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/pages/stock_take_list/stock_take_data_grid.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/repositories/supplier_repository.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StockTakesPage extends StatefulWidget {
  const StockTakesPage({super.key});

  @override
  State<StockTakesPage> createState() => _StockTakesPageState();
}

class _StockTakesPageState extends State<StockTakesPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    // Get ALL stock takes
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onChangeTab(int index) {
    if (index == 0) {
      // Get ALL stock takes
    }
    if (index == 1) {
      // Get all In Progress stock takes
    }
    if (index == 2) {
      // Get all COMPLETED stock takes
    }
    if (index == 3) {
      // Get all CANCELLED stock takes
    }
  }

  @override
  Widget build(BuildContext context) {
    final columns = DataGridUtil.getColumns(DataGridColumn.STOCK_TAKES);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: 'Stock Takes',
          subtitle: Strings.subtitlePlaceholder,
          actions: [
            UIButton.filled(
              'New Stock Take',
              icon: Assets.icons.add.setSize(12.0),
              onClick: () => showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => Dialog(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.35,
                    color: UIColors.background,
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIText.heading6('New Stock Take'),
                        const Divider(color: UIColors.borderMuted),
                        const UIVerticalSpace(16),
                        SearchDropdown<Branch>.single(
                          hint: 'Select branch',
                          label: 'Target Branch',
                          isLeftLabel: true,
                          isRequired: true,
                          isLeftLabelInDialog: true,
                          itemAsString: (branch) => branch.name,
                          asyncItemsCallback: GetIt.I<BranchRepository>().getAllBranches(),
                          onSelectItem: (Branch value) {},
                        ),
                        const UIVerticalSpace(16),
                        SearchDropdown<Supplier>.single(
                          hint: 'Select supplier',
                          label: 'Target Supplier',
                          isLeftLabel: true,
                          isRequired: true,
                          isLeftLabelInDialog: true,
                          itemAsString: (supplier) => supplier.name,
                          asyncItemsCallback: GetIt.I<SupplierRepository>().getAllSuppliers(),
                          onSelectItem: (Supplier value) {},
                        ),
                        const UIVerticalSpace(30),
                        CancelActionButton(
                          actionLabel: 'Start',
                          onCancel: () => Navigator.pop(context),
                          onAction: () {
                            /// POST Request for Stock take, then pass the id of the stock take to STOCK_TAKE_DETAILS
                            Navigator.pop(context);
                            AppRouter.router.goNamed(
                              SideMenuTreeItem.STOCK_TAKE_DETAILS.name,
                              pathParameters: {'id': '1'},
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        TabBar(
          controller: _tabController,
          onTap: onChangeTab,
          tabs: [
            const Tab(text: 'All Takes'),
            Tab(text: StockOrderStatus.IN_PROGRESS.label),
            Tab(text: StockOrderStatus.COMPLETED.label),
            Tab(text: StockOrderStatus.CANCELLED.label),
          ],
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          dividerColor: UIColors.borderMuted,
          labelColor: UIColors.primary,
          labelStyle: UIStyleText.labelMedium,
          unselectedLabelColor: UIColors.textMuted,
          indicatorPadding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: UIColors.primary, width: 2.0),
            ),
          ),
          overlayColor: WidgetStateColor.resolveWith((state) {
            if (state.contains(WidgetState.pressed)) return UIColors.transparent;
            if (state.contains(WidgetState.hovered)) return UIColors.whiteBg;
            return UIColors.transparent;
          }),
        ),
        const UIVerticalSpace(20),
        DataGridToolbar(
          searchPlaceholder: 'Search branch name',
          filters: [
            UIButton.outlined(
              'Date',
              iconAlign: IconAlignment.end,
              iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
              onClick: () {},
            ),
            const UIHorizontalSpace(8),
            UIButton.outlined(
              'Filter',
              iconAlign: IconAlignment.end,
              iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
              onClick: () {},
            ),
          ],
        ),
        Expanded(child: StockTakeDataGrid(stockTakesMock)),

        // StockTakeDataGrid(),
        // BlocBuilder<StockTakeListCubit, StockTakeListState>(
        //   builder: (context, state) {
        //     if (state is StockTakeListError) {
        //       return Text(state.message);
        //     }
        //     if (state is StockTakeListLoaded) {
        // return const Expanded(
        //   child: StockTakeDataGrid(),
        //   );
        // }
        // return DataGridLoading(
        //   columns: columns,
        //   source: VariantDataSource([]),
        // );
        // },
        // ),
      ],
    );
  }
}

final stockTakesMock = [
  StockTake(
    id: 1,
    branch: Branch(id: 1, name: 'Manila Branch'),
    supplier: Supplier(id: 1, name: 'UNILAB'),
    status: StockOrderStatus.NEW,
    createdAt: DateTime.now(),
    completedAt: DateTime.now(),
  ),
  StockTake(
    id: 2,
    branch: Branch(id: 1, name: 'Manila Branch'),
    supplier: Supplier(id: 1, name: 'UNILAB'),
    status: StockOrderStatus.FOR_RECEIVING,
    createdAt: DateTime.now(),
    completedAt: DateTime.now(),
    isAllSupplier: true,
  ),
  StockTake(
    id: 3,
    branch: Branch(id: 1, name: 'Manila Branch'),
    supplier: Supplier(id: 1, name: 'UNILAB'),
    status: StockOrderStatus.COMPLETED,
    createdAt: DateTime.now(),
    completedAt: DateTime.now(),
  ),
  StockTake(
    id: 4,
    branch: Branch(id: 1, name: 'Manila Branch'),
    supplier: Supplier(id: 1, name: 'UNILAB'),
    status: StockOrderStatus.CANCELLED,
    createdAt: DateTime.now(),
    completedAt: DateTime.now(),
  ),
  StockTake(
    id: 4,
    branch: Branch(id: 1, name: 'Manila Branch'),
    supplier: Supplier(id: 1, name: 'UNILAB'),
    status: StockOrderStatus.SHIPPED,
    createdAt: DateTime.now(),
    completedAt: DateTime.now(),
  ),
  StockTake(
    id: 4,
    branch: Branch(id: 1, name: 'Manila Branch'),
    supplier: Supplier(id: 1, name: 'UNILAB'),
    status: StockOrderStatus.IN_PROGRESS,
    createdAt: DateTime.now(),
    completedAt: DateTime.now(),
  ),
];
